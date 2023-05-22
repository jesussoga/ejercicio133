package com.inserta.ejercicio133.controllers;


import com.inserta.ejercicio133.models.User;
import com.inserta.ejercicio133.services.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ApiController {
    private final UserService userService;

    public ApiController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/api/usuarios")
    public List<User> getUsuarios(){
        return userService.listaUsuarios();
    }
}
