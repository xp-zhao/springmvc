package com.example.demo.controller;

import com.example.demo.entity.Contest;
import com.example.demo.entity.ContestBase;
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
  public String index(){
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
  public List<ContestBase> listData() {
    List<ContestBase> list = Arrays.asList(
        ContestBase.builder().baseId("001").baseCode("001").baseName("001测试").build(),
        ContestBase.builder().baseId("001").baseCode("001").baseName("002测试").build(),
        ContestBase.builder().baseId("001").baseCode("003").baseName("003测试").build());
    return list;
  }
}
