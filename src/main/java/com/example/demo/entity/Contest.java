package com.example.demo.entity;

import java.util.List;
import lombok.Data;

/**
 * @author zhaoxiaoping
 * @Description: 比赛对象
 * @Date 2020/2/26
 **/
@Data
public class Contest {

  private String name;
  private List<Round> roundList;
}
