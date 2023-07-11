package com.example.security.domain.service.userdetails;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.example.security.domain.model.Account;

//org.springframework.security.core.userdetails.UserDetailsインタフェースを実装する。
//ここではUserDetailsを実装したorg.springframework.security.core.userdetails.User クラスを継承し、本プロジェクト用のUserDetailsクラスを実装する。
public class SampleUserDetails extends User {
    private static final long serialVersionUID = 1L;

    private final Account account; // Springの認証ユーザークラスに、本プロジェクトのアカウント情報を保持させる。

    public SampleUserDetails(Account account) {
        //Userクラスのコンストラクタを呼び出す。第1引数はユーザー名、第2引数はパスワード、第3引数は権限リストである。
        super(account.getUsername()
             ,account.getPassword()
             ,AuthorityUtils.createAuthorityList("ROLE_USER")); //簡易実装として、ROLE_USERというロールのみ持つ権限を作成する。
        this.account = account;
    }

    public Account getAccount() { // アカウント情報のgetterを用意する。これにより、ログインユーザーのAccountオブジェクトを取得することができる。
        return account;
    }

}