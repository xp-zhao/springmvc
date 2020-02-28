package com.example.demo.entity;

import java.util.List;
import lombok.Builder;
import lombok.Data;

/**
 * @author zhaoxiaoping
 * @Description: 赛事分页对象
 * @Date 2020/2/28
 **/
@Data
@Builder
public class ContestBasePage {

  private Integer total;
  private List<ContestBase> rows;
}
