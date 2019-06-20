package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import dataBase.ConnectionDB;
import mypage.information.ProductsCommonInformation;
import mypage.information.ProductsInformation;
import mypage.information.ProductsInformation.Product;
import mypage.information.RecipientInformation;

public class MypageDetailsImpl implements MypageDetailsDAO {
	
	/*bulider pattern*/
	@Override
	public OrderingPersonInformation getOrderingpersonInfo(String fullname) {
		OrderingPersonInformation orderingPersonInfo = new OrderingPersonInformation();
		orderingPersonInfo.setFullname(fullname);
		orderingPersonInfo.setShipServiceCenter("독일");
		return orderingPersonInfo;
	}

	//factory pattern
	//https://alvinalexander.com/java/java-factory-pattern-example
	@Override
	public RecipientInformation getRecipientInfo(String username, String number) {
		ResultSet resultSet = null;
		ConnectionDB.connectSQL();
		String query = "SELECT * FROM RECIPIENT WHERE memberid=? AND orderid=?";
		RecipientInformation recipient = new RecipientInformation();
		try (Connection conn = ConnectionDB.getConnectInstance();
				PreparedStatement psmt = conn.prepareStatement(query);){
			psmt.setString(1, username);
			psmt.setString(2, number);
			resultSet = psmt.executeQuery();
			recipient = writeRecipientInformation(resultSet, recipient);
		} catch (SQLException e) {
			//Logger
		}		
		return recipient;
	}
	
	public RecipientInformation writeRecipientInformation(ResultSet rs, RecipientInformation recipient) throws SQLException {
		while (rs.next()) {
			recipient.setNameKor(rs.getString("name_kor"));
			recipient.setNameEng(rs.getString("name_eng"));
			recipient.setTransitNr(rs.getString("transit_nr"));
			recipient.setPhonePrefic(rs.getString("phone_prefic"));
			recipient.setPhoneInterfix(rs.getString("phone_interfix"));
			recipient.setPhoneSuffix(rs.getString("phone_suffix"));
			recipient.buildPhoneNr();
			recipient.setZipCode(rs.getString("zip_code"));
			recipient.setAdress(rs.getString("address"));
			recipient.setAdressDetails(rs.getString("detail_adress"));
			recipient.buildFullAdress();
			recipient.setUsercomment(rs.getString("usercomment"));
		}
		return recipient;
	}
	
	@Override
	public List<Product> getProductsInfo(String username, String number) {
		ResultSet resultSet = null;
		ConnectionDB.connectSQL();
		String query = "SELECT memberid, orderid, pd_shopurl, pd_trackingtitle, pd_trackingnumber, pd_categorytitle"
				+ ", pd_itemtitle, pd_itemname,pd_brandname, pd_amount, pd_price, pd_totalprice  FROM PRODUCT WHERE memberid=? AND orderid=?";
		ProductsInformation productsInfo = new ProductsInformation();
		try (Connection conn = ConnectionDB.getConnectInstance();
				PreparedStatement psmt = conn.prepareStatement(query);){
			psmt.setString(1, username);
			psmt.setString(2, number);
			resultSet = psmt.executeQuery();
			productsInfo = writeProductsInformation(resultSet, productsInfo);
		} catch (SQLException e) {
			//Logger
		}		
		return productsInfo.getProductsList();
	}
	
	public ProductsInformation writeProductsInformation(ResultSet rs, ProductsInformation products) throws SQLException {
		while (rs.next()) {
			/*refactoring divide table shopurl, tracking..*/
			Product product = products.createProduct();
			product.setCategorytitle(rs.getString("pd_categorytitle"));
			product.setItemtitle(rs.getString("pd_itemtitle"));
			product.setItemName(rs.getString("pd_itemname"));
			product.setBrandname(rs.getString("pd_brandname"));
			product.setAmount(rs.getInt("pd_amount"));
			product.setPrice(rs.getDouble("pd_price"));
			product.setTotalPrice(rs.getDouble("pd_totalprice"));
			products.getProductsList().add(product);
		}
		return products;
	}
	
	@Override
	public ProductsCommonInformation getProductsCommonInfo(String username, String number) {
		ResultSet resultSet = null;
		ConnectionDB.connectSQL();
		String query = "SELECT prod.pd_shopurl, prod.pd_trackingtitle, prod.pd_trackingnumber, state.ship_state "
				+ "FROM PRODUCT prod INNER JOIN ORDERSTATE state ON prod.orderid=state.orderid and prod.memberid=? and prod.orderid=?";
		ProductsCommonInformation commonInfo = new ProductsCommonInformation();
		try (Connection conn = ConnectionDB.getConnectInstance();
				PreparedStatement psmt = conn.prepareStatement(query);){
			psmt.setString(1, username);
			psmt.setString(2, number);
			resultSet = psmt.executeQuery();
			commonInfo = writeProductsCommonInformation(resultSet, commonInfo);
		} catch (SQLException e) {
			//Logger
		}
		
		ResultSet resultSetForPrice = null;
		ConnectionDB.connectSQL();
		String totalPriceQuery = "SELECT pd_totalprice FROM PRODUCT WHERE memberid=? AND orderid=?";
		try (Connection conn = ConnectionDB.getConnectInstance();
				PreparedStatement psmt = conn.prepareStatement(totalPriceQuery);){
			psmt.setString(1, username);
			psmt.setString(2, number);
			resultSetForPrice = psmt.executeQuery();
			commonInfo = writeTotalPriceProductsCommonInformation(resultSetForPrice, commonInfo);
		} catch (SQLException e) {
			//Logger
		}
		return commonInfo;
	}
	
	public ProductsCommonInformation writeTotalPriceProductsCommonInformation(ResultSet rs, ProductsCommonInformation commonInfo) throws SQLException {
		double price=0.0;
		while (rs.next()) {
			price = price + rs.getDouble("pd_totalprice");
		}
		commonInfo.setTotalPrice(price);
		return commonInfo;
	}
	
	public ProductsCommonInformation writeProductsCommonInformation(ResultSet rs, ProductsCommonInformation commonInfo) throws SQLException {
		while (rs.next()) {
			/*refactoring divide table shopurl, tracking..and perform ones*/
			commonInfo.setShopUrl(rs.getString("pd_shopurl"));
			commonInfo.setTrackingCompany(rs.getString("pd_trackingtitle"));
			commonInfo.setTrackingNr(rs.getString("pd_trackingnumber"));
			commonInfo.setShipState(rs.getInt("ship_state"));
		}
		return commonInfo;
	}
}