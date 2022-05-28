package com.travel.lk.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;


/**
 * @author Ushan Shanilka <ushanshanilka80@gmail.com>
 * @since 5/28/2022
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity(name = "places")
public class Places {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name", nullable = false)
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "price")
    private  double price;
    @Column(name = "stars")
    private int stars;
    @Column(name = "people")
    private int people;
    @Column(name = "selected_People")
    private int selectedPeople;
    @Column(name = "img")
    private String img;
    @Column(name = "pro_pic")
    private String proPic;
    @Column(name = "location")
    private String location;
    @Column(name = "create_date")
    private Date createDate;
    @Column(name = "update_date")
    private Date updateDate;

}
