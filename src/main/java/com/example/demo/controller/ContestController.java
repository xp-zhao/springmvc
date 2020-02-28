package com.example.demo.controller;

import com.example.demo.entity.Contest;
import com.example.demo.entity.ContestBase;
import com.example.demo.entity.ContestBasePage;
import com.example.demo.entity.Round;
import java.util.Arrays;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author zhaoxiaoping
 * @Description: 比赛控制层
 * @Date 2020/2/26
 **/
@Controller
@RequestMapping("/contest")
public class ContestController {

  @RequestMapping("/add")
  public String add(Contest contest, Model model) {
    model.addAttribute("contest", contest);
    return "addContest";
  }

  @RequestMapping("/index")
  public String index() {
    return "index";
  }

  @RequestMapping("/save")
  public String save(Contest contest, Model model) {
    System.out.println(contest.getName());
    model.addAttribute("list", contest.getRoundList());
    model.addAttribute("list1", contest.getRoundList());
    model.addAttribute("contest", contest);
    return "listContest";
  }

  @RequestMapping("/list")
  public String list(Model model) {
    List<ContestBase> list = Arrays.asList(
        ContestBase.builder().baseId("001").baseCode("001").baseName("001测试").build(),
        ContestBase.builder().baseId("001").baseCode("001").baseName("001测试").build(),
        ContestBase.builder().baseId("001").baseCode("001").baseName("001测试").build());
    model.addAttribute("contestList", list);
    return "listContest";
  }

  @RequestMapping("/listData")
  @ResponseBody
  public ContestBasePage listData(Integer pageSize, Integer pageNumber) {
    List<Round> rounds = Arrays.asList(
        Round.builder().roundName("初赛").startTime("2019-01-01").endTime("2020-01-01").build(),
        Round.builder().roundName("复赛").startTime("2019-01-01").endTime("2020-01-01").build(),
        Round.builder().roundName("决赛").startTime("2019-01-01").endTime("2020-01-01").build());
    List<ContestBase> list = Arrays.asList(
        ContestBase.builder().baseId("001").baseCode("001").baseName("001测试").roundList(rounds).build(),
        ContestBase.builder().baseId("001").baseCode("001").baseName("002测试").roundList(rounds).build(),
        ContestBase.builder().baseId("001").baseCode("001").baseName("003测试").roundList(rounds).build(),
        ContestBase.builder().baseId("002").baseCode("002").baseName("002测试").roundList(rounds).build(),
        ContestBase.builder().baseId("003").baseCode("003").baseName("002测试").roundList(rounds).build(),
        ContestBase.builder().baseId("003").baseCode("003").baseName("003测试").roundList(rounds).build(),
        ContestBase.builder().baseId("004").baseCode("001").baseName("002测试").roundList(rounds).build(),
        ContestBase.builder().baseId("005").baseCode("003").baseName("003测试").roundList(rounds).build());
    int size = pageSize * pageNumber;
    List<ContestBase> pageList = list
        .subList((pageNumber - 1) * pageSize, size > list.size() ? list.size() : size);
    return ContestBasePage.builder().rows(pageList).total(list.size()).build();
  }
}
