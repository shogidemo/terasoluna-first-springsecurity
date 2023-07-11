<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/styles.css">
</head>
<body>
<div id="wrapper">
    <h3>Login with Username and Password</h3>

    <!-- (1)
    認証が失敗した場合、/login/loginForm?error=trueが呼び出され、ログインページを表示する。 そのため、認証エラー後の表示の時のみエラーメッセージが表示されるようにc:ifタグを使用する。
    -->
    <c:if test="${param.containsKey('error')}">
        <!-- (2)
        共通ライブラリから提供されているt:messagesPanelタグを使用してエラーメッセージを表示する。
        認証が失敗した場合、Spring Securityのデフォルトの設定で使用される、org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandlerでは、
        認証エラー時に発生した例外オブジェクトをSPRING_SECURITY_LAST_EXCEPTIONという属性名で、リダイレクト時はセッション、フォワード時はリクエストスコープに格納する。
        ここでは、認証エラー時にはリダイレクトするため、認証エラー時に発生した例外オブジェクトは、セッションスコープに格納される。
        -->
        <t:messagesPanel messagesType="error"
                         messagesAttributeName="SPRING_SECURITY_LAST_EXCEPTION" />
    </c:if>

    <!-- (3)
    "form:form"タグのaction属性に、認証処理用のURL(/login)を設定する。このURLはSpring Securityのデフォルトである。
    認証処理に必要なパラメータ(ユーザー名とパスワード)をPOSTメソッドで送信する。
    -->
    <form:form action="${pageContext.request.contextPath}/login">
        <table>
            <tr>
                <td><label for="username">User:</label></td>
                <td><input type="text" id="username"
                           name="username" value="demo">(demo)</td><!-- (4)
                            	                                   ユーザー名を指定するテキストボックスを作成する。
                                                                   Spring Securityのデフォルトのパラメータ名はusernameである。
                                                                   -->
            </tr>
            <tr>
                <td><label for="password">Password:</label></td>
                <td><input type="password" id="password"
                           name="password" value="demo" />(demo)</td><!-- (5)
                                                                     パスワードを指定するテキストボックス(パスワード用のテキストボックス)を作成する。
                                                                     Spring Securityのデフォルトのパラメータ名はpasswordである。
                                                                     -->
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input name="submit" type="submit" value="Login" /></td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>