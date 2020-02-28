package com.example.demo.controller;

import com.example.demo.entity.Round;
import java.util.Arrays;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zhaoxiaoping
 * @Description: 比赛轮次控制层
 * @Date 2020/2/26
 **/
@Controller
@RequestMapping("/round")
public class RoundController {

  @RequestMapping("/list")
  @ResponseBody
  public List<Round> list(String baseCode) {
    System.out.println(baseCode);
    List<Round> list = Arrays.asList(
        Round.builder().roundName("初赛").startTime("2019-01-01").endTime("2020-01-01").build(),
        Round.builder().roundName("复赛").startTime("2019-01-01").endTime("2020-01-01").build(),
        Round.builder().roundName("决赛").startTime("2019-01-01").endTime("2020-01-01").build());
    return list;
  }

}
