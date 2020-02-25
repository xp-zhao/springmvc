package com.example.demo.controller;

import com.example.demo.entity.Round;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhaoxiaoping
 * @Description: 动态添加 div 控制层
 * @Date 2020/2/25
 **/
@Controller
@RequestMapping("/div")
public class DivController {

  @RequestMapping("/index")
  public String index(Round round, Model model) {
    model.addAttribute("round", round);
    return "addDiv";
  }

  @RequestMapping("/save")
  public String save(Round round) {
    System.out.println(round.getRoundName());
    return "index";
  }
}
