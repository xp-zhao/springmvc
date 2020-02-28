package com.example.demo.entity;

import java.math.BigDecimal;
import java.util.List;
import lombok.Builder;
import lombok.Data;

/**
 * @author zhaoxiaoping
 * @Description: 赛事基础数据
 * @Date 2020/2/27
 **/
@Data
@Builder
public class ContestBase {

  /**
   * 比赛id
   */
  private String baseId;
  /**
   * 编号
   */
  private String baseCode;
  /**
   * 比赛名称
   */
  private String baseName;
  /**
   * 展演号前缀
   */
  private String basePrefixes;
  /**
   * 选拔赛前缀
   */
  private String selectionPrefixes;
  /**
   * 是否自动赛场(1.是2.否)
   */
  private String isAuto;
  /**
   * 状态(1.启用 2.暂停)
   */
  private String baseStatus;
  /**
   * 报名费用
   */
  private BigDecimal entryFee;
  private List<Round> roundList;
}
