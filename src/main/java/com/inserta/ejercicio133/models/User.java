package com.inserta.ejercicio133.models;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString

@Entity
@Table(name = "usuarios")
public class User {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int idRol;
    private String nombre;
    private String correo;
    private String clave;
}
