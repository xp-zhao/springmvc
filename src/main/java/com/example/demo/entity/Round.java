package com.example.demo.entity;

import lombok.Builder;
import lombok.Data;

/**
 * @author zhaoxiaoping
 * @Description: 轮次信息
 * @Date 2020/2/25
 **/
@Data
@Builder
public class Round {

  private String roundName;
  private String startTime;
  private String endTime;
}
