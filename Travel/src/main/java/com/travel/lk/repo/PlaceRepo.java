package com.travel.lk.repo;

import com.travel.lk.entity.Places;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @author Ushan Shanilka <ushanshanilka80@gmail.com>
 * @since 5/28/2022
 **/
public interface PlaceRepo extends JpaRepository<Places, Long> {
}
