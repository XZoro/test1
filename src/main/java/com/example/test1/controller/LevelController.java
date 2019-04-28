package com.example.test1.controller;

import com.example.test1.mapper.LevelMapper;
import com.example.test1.pojo.Level;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LevelController {

    @Autowired
    LevelMapper levelMapper;

    @RequestMapping("/listLevel")
    public String listLevel(Model model, HttpServletRequest request){
        List<Level> ls = levelMapper.list();
        model.addAttribute("ls",ls);
        return "listLevel";
    }

    @RequestMapping("/addLevel")
    public String addLevel(Level level){
        levelMapper.add(level);
        return "redirect:listLevel";
    }

    @RequestMapping("/updateLevel")
    public String updateLevel(Level level){
        levelMapper.update(level);
        return "redirect:listLevel";
    }

    @RequestMapping("/deleteLevel")
    public String deleteLevel(int id){
        levelMapper.delete(id);
        return "redirect:listLevel";
    }

    @RequestMapping("/editLevel")
    public String getLevel(int id, Model model){
        Level level = levelMapper.get(id);
        model.addAttribute("level",level);
        return "editLevel";
    }

    @RequestMapping("/addGetLevel")
    public String addGetLevel(int id, Model model){
        Level level = levelMapper.get(id);
        model.addAttribute("level",level);
        return "addGetLevel";
    }

    @RequestMapping("/saveLevel")
    public String saveLevel(Level level,HttpServletRequest request){
        List<Level> levels = levelMapper.list();
        return "redirect: listLevel";
    }
}
