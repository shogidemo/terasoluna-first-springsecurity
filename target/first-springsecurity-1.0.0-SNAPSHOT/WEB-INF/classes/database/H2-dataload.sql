INSERT INTO account(
    username
   ,password
   ,first_name
   ,last_name
)
VALUES(
    'demo'
   ,'{pbkdf2}1dd84f42a7a9a173f8f806d736d34939bed6a36e2948e8bfe88801ee5e6e61b815efc389d03165a4'
   ,'Taro'
   ,'Yamada'
);
-- (1)ブランクプロジェクトの設定では、
-- applicationContext.xmlにパスワードをハッシュ化するためのクラスとしてPbkdf2アルゴリズムでハッシュ化を行う、
-- org.springframework.security.crypto.password.DelegatingPasswordEncoderが設定されている。
-- 本チュートリアルでは、DelegatingPasswordEncoderを使用してパスワードのハッシュ化を行うため、
-- パスワードにはdemoという文字列をPbkdf2アルゴリズムでハッシュ化した文字列を投入する。
COMMIT;