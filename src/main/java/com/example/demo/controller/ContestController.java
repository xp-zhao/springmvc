package com.example.demo.controller;

import com.example.demo.entity.Contest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhaoxiaoping
 * @Description: 比赛控制层
 * @Date 2020/2/26
 **/
@Controller
@RequestMapping("/contest")
public class ContestController {

  @RequestMapping("/index")
  public String index(Contest contest, Model model) {
    model.addAttribute("contest", contest);
    return "addContest";
  }

  @RequestMapping("/save")
  public String save(Contest contest, Model model) {
    System.out.println(contest.getName());
    model.addAttribute("list", contest.getRoundList());
    model.addAttribute("list1", contest.getRoundList());
    model.addAttribute("contest", contest);
    return "listContest";
  }
}
