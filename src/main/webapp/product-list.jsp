<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background-image: url('https://cdn-media.sforum.vn/storage/app/media/THANHAN/hinh-nen-dong-dep-32.gif'); 
            background-size: cover; background-position: center; background-attachment: fixed;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            color: #ffffff; padding: 40px 20px; min-height: 100vh;
        }
        .container {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.02) 100%);
            backdrop-filter: blur(15px); -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 15px 45px rgba(0, 0, 0, 0.4);
            border-radius: 20px; max-width: 1000px; margin: 0 auto; padding: 30px 40px;
        }
        .header-flex { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        h2 { font-size: 28px; text-shadow: 0 2px 4px rgba(0, 0, 0, 0.5); letter-spacing: 1px; }
        
        .header-buttons { display: flex; gap: 15px; } 
        
        .btn-add {
            background: linear-gradient(45deg, #fc00b0, #7a00ff); color: white; padding: 12px 24px; 
            text-decoration: none; border-radius: 12px; font-weight: 600;
            box-shadow: 0 6px 15px rgba(252, 0, 176, 0.3); transition: all 0.3s ease;
        }
        .btn-add:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(252, 0, 176, 0.6); }

        .btn-logout {
            background: rgba(255, 255, 255, 0.15); color: #ffffff; padding: 12px 24px; 
            text-decoration: none; border-radius: 12px; font-weight: 600; border: 1px solid rgba(255,255,255,0.4);
            transition: all 0.3s ease;
        }
        .btn-logout:hover {
            background: rgba(220, 53, 69, 0.8); border-color: #ff6b6b;
            transform: translateY(-2px); box-shadow: 0 8px 20px rgba(220, 53, 69, 0.4);
        }
        
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 16px; text-align: left; border-bottom: 1px solid rgba(255, 255, 255, 0.1); }
        th { background-color: rgba(0, 0, 0, 0.4); color: #fff; text-transform: uppercase; font-size: 13px; letter-spacing: 1px; }
        tr { transition: background-color 0.2s ease; }
        tr:hover { background-color: rgba(255, 255, 255, 0.15); }
        
        .action-links a {
            display: inline-block; padding: 6px 14px; margin-right: 5px; border-radius: 8px;
            text-decoration: none; font-size: 13px; font-weight: bold; transition: all 0.3s ease;
        }
        .btn-edit { background: rgba(0, 123, 255, 0.2); color: #66b2ff; border: 1px solid rgba(0, 123, 255, 0.5); }
        .btn-edit:hover { background: rgba(0, 123, 255, 0.8); color: white; box-shadow: 0 0 10px rgba(0, 123, 255, 0.5); }
        
        .btn-delete { background: rgba(220, 53, 69, 0.2); color: #ff6b6b; border: 1px solid rgba(220, 53, 69, 0.5); }
        .btn-delete:hover { background: rgba(220, 53, 69, 0.8); color: white; box-shadow: 0 0 10px rgba(220, 53, 69, 0.5); }
        
        .highlight { color: #00ffcc; font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2> Danh sách Sản phẩm</h2>
            
            <div class="header-buttons">
                <a href="products?action=new" class="btn-add">+ Thêm Mới</a>
                <a href="login.jsp" class="btn-logout" onclick="return confirm('Bạn có muốn đăng xuất không?');">Đăng xuất</a>
            </div>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Mô tả</th>
                    <th style="text-align: center;">Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${listProduct}">
                    <tr>
                        <td>#<c:out value="${product.id}" /></td>
                        <td style="font-weight: 600; font-size: 16px;"><c:out value="${product.name}" /></td>
                        <td class="highlight"><fmt:formatNumber value="${product.price}" pattern="#,###" /> đ</td>
                        <td><c:out value="${product.quantity}" /></td>
                        <td style="color: rgba(255,255,255,0.7);"><c:out value="${product.description}" /></td>
                        <td class="action-links" style="text-align: center;">
                            <a href="products?action=edit&id=${product.id}" class="btn-edit">Sửa</a>
                            <a href="products?action=delete&id=${product.id}" class="btn-delete" onclick="return confirm('Xác nhận xóa sản phẩm: ${product.name}?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>