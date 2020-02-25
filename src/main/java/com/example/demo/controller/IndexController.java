package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhaoxiaoping
 * @Description: 首页控制层
 * @Date 2020/2/25
 **/
@Controller
@RequestMapping("/home")
public class IndexController {

  @RequestMapping("/index")
  public String index(){
    return "index";
  }
}
