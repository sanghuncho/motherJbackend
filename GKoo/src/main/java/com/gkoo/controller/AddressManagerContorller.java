package com.gkoo.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
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
import com.gkoo.data.FavoriteAddress;
import com.gkoo.service.AddressManagerService;
import serviceBase.ServicePath;

/**
 *
 * @author sanghuncho
 *
 * @since  19.12.2019
 *
 */
@RestController
public class AddressManagerContorller {
    private static final Logger LOGGER = LogManager.getLogger();
    private final AddressManagerService addressManagerService;
    
    @Autowired
    public AddressManagerContorller(AddressManagerService addressManagerService) {
        this.addressManagerService = addressManagerService;
    }

    @CrossOrigin(origins = {ServicePath.FAVORITE_ADDRESS_MANAGER_DEV, ServicePath.FAVORITE_ADDRESS_MANAGER_PROD})
    @RequestMapping("/getFavoriteAddressList/{userid}")
    public List<FavoriteAddress> getFavoriteAddressList(HttpServletRequest request, @PathVariable String userid){
        return addressManagerService.getFavoriteAddressList(userid);
    }
    
    @CrossOrigin(origins = {ServicePath.FAVORITE_ADDRESS_MANAGER_DEV, ServicePath.FAVORITE_ADDRESS_MANAGER_PROD})
    @RequestMapping(value = "/createFavoriteAddress/{userid}", method = {RequestMethod.POST, RequestMethod.OPTIONS})
    public ResponseEntity<?> createFavoriteAddress(@RequestBody HashMap<String, Object>[] data, HttpServletRequest request, @PathVariable String userid) throws SQLException {
        return  addressManagerService.createFavoriteAddress(data, userid);
    }
    
    @CrossOrigin(origins = {ServicePath.FAVORITE_ADDRESS_MANAGER_DEV, ServicePath.FAVORITE_ADDRESS_MANAGER_PROD})
    @RequestMapping(value = "/deleteFavoriteAddress/{userid}", method = {RequestMethod.POST, RequestMethod.OPTIONS})
    public ResponseEntity<?> deleteFavoriteAddress(@RequestBody HashMap<String, Object>[] data, HttpServletRequest request, @PathVariable String userid){
        return  addressManagerService.deleteFavoriteAddress(data, userid);
    }
    
    @CrossOrigin(origins = {ServicePath.FAVORITE_ADDRESS_MANAGER_DEV, ServicePath.FAVORITE_ADDRESS_MANAGER_PROD})
    @RequestMapping(value = "/updateFavoriteAddress/{userid}", method = {RequestMethod.POST, RequestMethod.OPTIONS})
    public ResponseEntity<?> updateFavoriteAddress(@RequestBody HashMap<String, Object>[] data, HttpServletRequest request, @PathVariable String userid){
        return  addressManagerService.updateFavoriteAddress(data, userid);
    }
}