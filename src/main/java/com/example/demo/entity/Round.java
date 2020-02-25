package com.example.demo.entity;

import java.time.LocalDateTime;
import lombok.Data;

/**
 * @author zhaoxiaoping
 * @Description: 轮次信息
 * @Date 2020/2/25
 **/
@Data
public class Round {

  private String roundName;
  private LocalDateTime startTime;
  private LocalDateTime endTime;
}
