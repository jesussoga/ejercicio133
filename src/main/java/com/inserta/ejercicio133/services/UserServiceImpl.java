package com.inserta.ejercicio133.services;

import com.inserta.ejercicio133.models.User;
import com.inserta.ejercicio133.repos.UserRepo;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    private final UserRepo userRepo;

    public UserServiceImpl(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public List<User> listaUsuarios() {
        return userRepo.findAll();
    }
}
