package shippingService;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gkoo.configuration.SecurityConfig;
import com.gkoo.data.UserBaseInfo;
import com.gkoo.exception.CustomerStatusException;
import databaseUtil.ConnectionDB;
import payment.PaymentState;
import serviceBase.ServicePath;
import util.MemberProfile;
import util.OrderID;
import util.TimeStamp;

@RestController
public class ShippingRequestController {
    private static final Logger LOGGER = LogManager.getLogger();
	private final double INITIAL_PRICE = 0;
    private static final String FETCH_USERBASEINFO = "select * from customer where userid = ?";

	/**
     *Todo: using spring annotation 
     */		
	public ShippingRequestController() {}
	
	@CrossOrigin(origins = ServicePath.SHIPPING_SERVICE)
	@RequestMapping(value = "/createshippingservice", method = RequestMethod.POST)
	public ResponseEntity<?> requestShippingservice(@RequestBody HashMap<String, Object>[] data, HttpServletRequest request) throws SQLException, JsonParseException, JsonMappingException, IOException {
	
	    LOGGER.info("배송대행 서비스 신청시작");
		ShippingServiceModel shippingModel = new ShippingServiceModel();
		ShippingServiceDAO shipServiceDao = new ShippingServiceDAO();
		
        String userid = SecurityConfig.getUserid(request);      
        String timeStamp = TimeStamp.getCurrentTimeStampKorea();
        String orderId = OrderID.generateOrderID();
        LOGGER.info("배송대행 서비스주문번호: " + orderId);
		
        shippingModel.setUserid(userid);
        shippingModel.setTimeStamp(timeStamp);
        shippingModel.setOrderId(orderId);
        shippingModel.setEasyship(data[0].get("easyship").toString());
        
        ObjectMapper mapper = new ObjectMapper();
        DeliveryDataObject deliveryDataObj = mapper.readValue(data[1].get("deliveryDataObject").toString(), DeliveryDataObject.class);
        ShippingProduct[] shippingProducts = mapper.readValue(data[2].get("shippingProductList").toString(), ShippingProduct[].class);
        
        shippingModel.setDeliveryData(deliveryDataObj);
        shippingModel.setShippingProductsList(shippingProducts);

		/**
	     *ToDO: move to shippingServiceModel
	     *ToDO: Build pattern
	     *ToDO: Jackson
	     */
		shippingModel.setReceiverNameByKorea(data[3].get("receiverNameByKorea").toString());
		shippingModel.setOwnerContent(data[4].get("setOwnerContent").toString());
		shippingModel.setReceiverNameByEnglish(data[5].get("receiverNameByEnglish").toString());
		
		shippingModel.setPrivateTransit(data[6].get("privateTransit").toString());
		shippingModel.setTransitNumber(data[7].get("transitNumber").toString());
		shippingModel.setAgreeWithCollection(data[8].get("agreeWithCollection").toString());
		
		shippingModel.setPhonenumberFirst(data[9].get("phonenumberFirst").toString());
		shippingModel.setPhonenumberSecond(data[10].get("phonenumberSecond").toString());
		
		shippingModel.setPostCode(data[11].get("postCode").toString());
		shippingModel.setDeliveryAddress(data[12].get("deliveryAddress").toString());
		shippingModel.setDeliveryMessage(data[13].get("deliveryMessage").toString());
		
		/** 국제배송비 */
		shippingModel.setShippingPrice(INITIAL_PRICE);
		/** 국제배송 상태 */
		shippingModel.setShipState(ShippingServiceState.RECEIVE_BOX_READY);
		shippingModel.setPaymentState(PaymentState.BEFORE);
		
		shipServiceDao.createShippingServiceDB(shippingModel);
		HttpHeaders headers = new HttpHeaders();
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}
	
    @CrossOrigin(origins = ServicePath.SHIPPING_SERVICE)
    @RequestMapping("/fetchcustomerbaseinfo")
    public UserBaseInfo requestCustomerBaseInfo(HttpServletRequest request) throws SQLException {
        String userid = SecurityConfig.getUserid(request);
        return getUserBaseInfo(userid);
    }
    
    public static UserBaseInfo getUserBaseInfo(String userid) {
        ConnectionDB.connectSQL();
        ResultSet resultSet = null;
        UserBaseInfo userBaseInfo = null;
        try (Connection conn = ConnectionDB.getConnectInstance();
                PreparedStatement psmt = conn.prepareStatement(FETCH_USERBASEINFO);){
            psmt.setString(1, userid);
            resultSet = psmt.executeQuery();
            userBaseInfo = writeUserBaseInfo(resultSet);
        } catch (SQLException e) {
            String error = "Error fetching userBaseInfo";
            LOGGER.error(error, e);
            throw new CustomerStatusException(error, e);
        }
        return userBaseInfo;
    }
    
    private static UserBaseInfo writeUserBaseInfo(ResultSet resultSet) throws SQLException {
        UserBaseInfo userBaseInfo =  new UserBaseInfo();
        while (resultSet.next()) {
            userBaseInfo.setUserid(resultSet.getString("userid"))
                         .withNameKor(resultSet.getString("name_kor"))
                         .withNameEng(resultSet.getString("name_eng"))
                         .withEmail(resultSet.getString("email"))
                         .withTransitNr(resultSet.getString("transit_nr"))
                         .withPhonenumberFirst(resultSet.getString("phonenumber_first"))
                         .withPhonenumberSecond(resultSet.getString("phonenumber_second"))
                         .withZipCode(resultSet.getString("zip_code"))
                         .withAddress(resultSet.getString("address"));
        }
        return userBaseInfo;
    }
	
	
	/**
     *ToDo:json structure should be modified
     */
	private ArrayList<String> transformArrayList(String key, String val){
		ArrayList<String> arrayList = new ArrayList<>(); 
		
		String predef = "{" + key + ":";
		String content = val;
		String postdef = "}";
		String convert = predef.concat(content);
		String result = convert.concat(postdef);
		
		JSONObject obj = new JSONObject(result);		
		JSONArray arr = obj.getJSONArray(key);

		for (int i = 0; i < arr.length(); i++)
		{
		    String in = arr.getString(i);
		    arrayList.add(in);
		}
		return arrayList;
	}
}
