package com.travel.lk.service;

import com.travel.lk.dto.PlacesDTO;

import java.util.List;

/**
 * @author Ushan Shanilka <ushanshanilka80@gmail.com>
 * @since 5/28/2022
 **/
public interface PlacesService {
    void savePlaces (PlacesDTO placesDTO);
    List<PlacesDTO> getAllPlaces ();
}
