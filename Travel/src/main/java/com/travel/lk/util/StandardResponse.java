package com.travel.lk.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Ushan Shanilka <ushanshanilka80@gmail.com>
 * @since 5/28/2022
 **/
@NoArgsConstructor
@AllArgsConstructor
@Data
public class StandardResponse {
    private int code;
    private String message;
    private Object data;
}
