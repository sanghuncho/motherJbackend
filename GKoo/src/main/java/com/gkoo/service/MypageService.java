package com.gkoo.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.http.ResponseEntity;
import com.gkoo.data.BuyingOrderData;
import com.gkoo.data.DeliveryKoreaData;
import com.gkoo.data.OrderInformation;
import com.gkoo.data.WarehouseInformation;
import payment.PaymentData;

public interface MypageService {
    
    /////////////////////
    /// ShippingService ///
    /////////////////////
    public List<OrderInformation> getOrderData(String userid);
    public List<WarehouseInformation> getWarehouseData(String userid);
    public ResponseEntity<?> updateTrackingNumber(String userid, String orderNumber, String trackingCompany, String trackingNumber);
    public List<PaymentData> getPaymentData(String userid);
    public List<DeliveryKoreaData> getDeliveryKoreaData(String userid);
    
    /////////////////////
    /// BuyingService ///
    /////////////////////
    public List<BuyingOrderData> getOrderDataBuyingService(String userid);
    public List<PaymentData> getPaymentProductBuyingService(String userid);
    public List<PaymentData> getPaymentDeliveryBuyingService(String userid);
    public List<DeliveryKoreaData> getDeliveryKoreaDataBuyingService(String userid);
    public ResponseEntity<?> updatePaymentProductBuyingService(HashMap<String, Object>[] data, String userid);
    public ResponseEntity<?> updatePaymentDeliveryBuyingService(HashMap<String, Object>[] data);
}
