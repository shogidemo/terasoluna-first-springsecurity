package com.example.security.domain.repository.account;

import com.example.security.domain.model.Account;

import java.util.Optional;

public interface AccountRepository {
    Optional<Account> findById(String username);
}
