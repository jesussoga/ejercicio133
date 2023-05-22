package com.inserta.ejercicio133.controllers;

import com.inserta.ejercicio133.models.User;
import com.inserta.ejercicio133.repos.UserRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {
    private final UserRepo userRepo;

    public HomeController(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("listaUser", userRepo.findAll());
        return "index";
    }


}
