<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { background-image: url('https://cdn-media.sforum.vn/storage/app/media/THANHAN/hinh-nen-dong-dep-32.gif'); background-size: cover; background-position: center; background-attachment: fixed; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; display: flex; align-items: center; justify-content: center; min-height: 100vh; }
        .container { background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%); backdrop-filter: blur(25px); -webkit-backdrop-filter: blur(25px); border: 1px solid rgba(255, 255, 255, 0.2); border-top: 1px solid rgba(255, 255, 255, 0.6); box-shadow: 0 15px 45px rgba(0, 0, 0, 0.3); border-radius: 24px; width: 100%; max-width: 400px; padding: 40px 30px; }
        h1 { text-align: center; color: #ffffff; margin-bottom: 20px; font-weight: 700; text-shadow: 0 2px 4px rgba(0,0,0,0.4); }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 8px; color: #ffffff; font-weight: 600; font-size: 14px; text-shadow: 0 1px 2px rgba(0,0,0,0.4); }
        input[type="text"], input[type="password"] { background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.2); border-top: 1px solid rgba(255, 255, 255, 0.4); border-radius: 12px; display: block; width: 100%; padding: 12px 15px; font-size: 15px; color: #ffffff; transition: all 0.3s ease; box-shadow: inset 0 2px 6px rgba(0,0,0,0.15); }
        input:focus { outline: none; background: rgba(255, 255, 255, 0.25); border-color: #ffffff; box-shadow: 0 0 10px rgba(255,255,255,0.3); }
        button { cursor: pointer; background: linear-gradient(45deg, #fc00b0, #7a00ff); border: none; color: white; font-size: 16px; font-weight: 600; margin-top: 10px; padding: 14px; border-radius: 14px; width: 100%; transition: all 0.3s ease; box-shadow: 0 6px 15px rgba(0,0,0,0.4); }
        button:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(252,0,176,0.6); }
        .login-link { text-align: center; margin-top: 20px; font-size: 14px; color: rgba(255,255,255,0.8); }
        .login-link a { color: #ffffff; font-weight: bold; text-decoration: none; transition: 0.3s; }
        .login-link a:hover { text-decoration: underline; color: #fc00b0; }
        .error-message { color: #ff6b6b; text-align: center; margin-bottom: 15px; font-weight: bold; font-size: 14px; background: rgba(255,0,0,0.1); padding: 10px; border-radius: 8px;}
    </style>
</head>
<body>
    <div class="container">
        <form action="register" method="POST">
            <h1>Đăng ký</h1>
            
            <% String error = (String) request.getAttribute("error"); 
               if (error != null) { %>
                <div class="error-message"><%= error %></div>
            <% } %>

            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Nhập Username" required autocomplete="off">
            </div>
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Tạo mật khẩu" required>
            </div>
            <div class="form-group">
                <label>Xác nhận mật khẩu</label>
                <input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
            </div>
            
            <button type="submit">Tạo tài khoản</button> 
            <div class="login-link">
                Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
            </div>
        </form>
    </div>
</body>
</html>