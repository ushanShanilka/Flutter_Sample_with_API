package com.travel.lk.service.impl;

import com.travel.lk.dto.PlacesDTO;
import com.travel.lk.entity.Places;
import com.travel.lk.repo.PlaceRepo;
import com.travel.lk.service.PlacesService;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Ushan Shanilka <ushanshanilka80@gmail.com>
 * @since 5/28/2022
 **/
@Service
public class PlacesServiceImpl implements PlacesService {

    @Autowired
    private PlaceRepo repo;

    @Autowired
    private ModelMapper mapper;

    @Override
    public void savePlaces(PlacesDTO placesDTO) {
        placesDTO.setCreateDate(new Date(System.currentTimeMillis()));
        repo.save(mapper.map(placesDTO, Places.class));
    }

    @Override
    public ArrayList<PlacesDTO> getAllPlaces() {
        List<Places> all = repo.findAll();
        return mapper.map(all,new TypeToken<ArrayList<PlacesDTO>>(){}.getType());
    }
}
