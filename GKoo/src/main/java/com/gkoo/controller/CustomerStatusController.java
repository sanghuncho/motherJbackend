package com.gkoo.controller;

import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.gkoo.data.CustomerStatus;
import com.gkoo.data.UserBaseInfo;
import com.gkoo.service.CustomerStatusService;
import serviceBase.ServicePath;

/**
 *
 * @author sanghuncho
 *
 * @since  12.11.2019
 *
 */
@RestController
public class CustomerStatusController {
    private static final Logger LOGGER = LogManager.getLogger();
    private final CustomerStatusService customerstatusService;

    @Autowired
    public CustomerStatusController(CustomerStatusService customerstatusService){
        this.customerstatusService = customerstatusService;
    }
    
    @CrossOrigin(origins = {ServicePath.SHIPPING_SERVICE_DEV, ServicePath.SHIPPING_SERVICE_PROD,
                                ServicePath.BUYING_SERVICE_REGIST_DEV, ServicePath.BUYING_SERVICE_REGIST_PROD})
    @RequestMapping(value = "/register_customer/{userid}", method = {RequestMethod.POST, RequestMethod.OPTIONS})
    public ResponseEntity<?> registerInitialCustomer(@RequestBody HashMap<String, Object>[] data, HttpServletRequest request, @PathVariable String userid) throws SQLException {
        String lastname= data[0].get("lastname").toString();
        String firstname= data[1].get("firstname").toString();
        String email = data[2].get("email").toString();
        //later test : AccessToken accessToken = SecurityConfig.getAccessToken(request);
        //String userid = SecurityConfig.getUserid(request);
        return customerstatusService.checkUserid(userid, lastname, firstname, email);
    }
    
    @CrossOrigin(origins = {ServicePath.MYPAGE_DEV, ServicePath.MYPAGE_PROD, ServicePath.MYPAGE_BUYING_SERVICE_DEV, ServicePath.MYPAGE_BUYING_SERVICE_PROD})
    @RequestMapping(value = "/customerstatus/{userid}", method = {RequestMethod.POST, RequestMethod.OPTIONS})
    public CustomerStatus requestCustomerStatus(@RequestBody HashMap<String, Object>[] data, HttpServletRequest request, @PathVariable String userid) throws SQLException {
        String lastname = data[0].get("lastname").toString();
        String firstname = data[1].get("firstname").toString();
        String email = data[2].get("email").toString();
        customerstatusService.checkUserid(userid, lastname, firstname, email);
        return customerstatusService.getCustomerStatus(userid);
    }
    
    @CrossOrigin(origins = {ServicePath.MYPAGE_DEV, ServicePath.MYPAGE_PROD, ServicePath.MYPAGE_BUYING_SERVICE_DEV, ServicePath.MYPAGE_BUYING_SERVICE_PROD})
    @RequestMapping(value = "/fetchCustomerStatusAdmin/{userid}")
    public CustomerStatus requestCustomerStatusAdmin(HttpServletRequest request, @PathVariable String userid) throws SQLException {
        LOGGER.trace("fetchCustomerStatusAdmin:" + userid);
        return customerstatusService.getCustomerStatus(userid);
    }

    
	/**
	 * 마이페이지/개인정보
	 */
	@CrossOrigin(origins = {ServicePath.MYPAGE_DEV, ServicePath.MYPAGE_PROD, ServicePath.MYPAGE_PERSONAL_DEV, ServicePath.MYPAGE_PERSONAL_PROD})
    @RequestMapping("/fetchuserbaseinfo/{userid}")
    public UserBaseInfo requestUserBaseInfo(HttpServletRequest request, @PathVariable String userid) throws SQLException {
        return customerstatusService.getUserBaseInfo(userid);
    }
	
	@CrossOrigin(origins = {ServicePath.MYPAGE_DEV, ServicePath.MYPAGE_PROD, ServicePath.MYPAGE_PERSONAL_DEV, ServicePath.MYPAGE_PERSONAL_PROD})
    @RequestMapping(value = "/updateuserbaseinfo/{userid}", method = {RequestMethod.POST, RequestMethod.OPTIONS})
    public ResponseEntity<?> updateBaseInfo(@RequestBody HashMap<String, Object>[] data, HttpServletRequest request, @PathVariable String userid) throws SQLException {
        LOGGER.info("개인정보수정:updateuserbaseinfo");
        return customerstatusService.updateBaseInfo(data, userid);
    }
}