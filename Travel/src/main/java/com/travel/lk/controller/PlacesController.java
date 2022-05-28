package com.travel.lk.controller;

import com.travel.lk.dto.PlacesDTO;
import com.travel.lk.service.PlacesService;
import com.travel.lk.util.StandardResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author Ushan Shanilka <ushanshanilka80@gmail.com>
 * @since 5/28/2022
 **/
@RestController
@RequestMapping("/api/v1/places")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class PlacesController {

    @Autowired
    private PlacesService service;

    @PostMapping
    public ResponseEntity<StandardResponse> savePlace(@RequestBody PlacesDTO placesDTO){
        service.savePlaces(placesDTO);
        return new ResponseEntity<>(
                new StandardResponse(200,"Success", null), HttpStatus.CREATED
        );
    }

    @GetMapping
    public List<PlacesDTO> getAllPlaces(){
        System.out.println("Call");
        List<PlacesDTO> allPlaces = service.getAllPlaces();
        return allPlaces;
//        return new ResponseEntity<>(
//                new StandardResponse(200,"Success", allPlaces),HttpStatus.OK
//        );
    }

}
