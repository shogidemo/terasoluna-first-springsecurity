package com.example.security.domain.service.userdetails;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.terasoluna.gfw.common.exception.ResourceNotFoundException;

import com.example.security.domain.model.Account;
import com.example.security.domain.service.account.AccountSharedService;

@Service
public class SampleUserDetailsService implements UserDetailsService { // (1)org.springframework.security.core.userdetails.UserDetailsServiceインタフェースを実装する。
    @Inject
    AccountSharedService accountSharedService; // (2)AccountSharedServiceをインジェクションする。

    @Transactional(readOnly=true)
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            Account account = accountSharedService.findOne(username); // (3)usernameからAccountオブジェクトを取得する処理をAccountSharedServiceに委譲する。
            return new SampleUserDetails(account); // (4)取得したAccountオブジェクトを使用して、本プロジェクト用のUserDetailsオブジェクトを作成し、メソッドの返り値として返却する。
        } catch (ResourceNotFoundException e) {
            throw new UsernameNotFoundException("user not found", e); // (5)対象のユーザーが見つからない場合は、UsernameNotFoundExceptionがスローする。
        }
    }

}