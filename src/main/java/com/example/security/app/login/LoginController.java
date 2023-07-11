package com.example.security.app.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping("/loginForm") // (1)ログインページである、login/loginFormを返す。
    public String view() {
        return "login/loginForm";
    }
}