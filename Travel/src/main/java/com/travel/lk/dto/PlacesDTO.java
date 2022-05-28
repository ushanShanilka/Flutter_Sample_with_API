package com.travel.lk.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import java.util.Date;

/**
 * @author Ushan Shanilka <ushanshanilka80@gmail.com>
 * @since 5/28/2022
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlacesDTO {
    private Long id;
    private String name;
    private String description;
    private  double price;
    private int stars;
    private int people;
    private int selectedPeople;
    private String img;
    private String proPic;
    private String location;
    private Date createDate;
    private Date updateDate;
}
