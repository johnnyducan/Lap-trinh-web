<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${product != null ? 'Sửa Sản Phẩm' : 'Thêm Sản Phẩm'}</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            background-image: url('https://cdn-media.sforum.vn/storage/app/media/THANHAN/hinh-nen-dong-dep-32.gif'); 
            background-size: cover; background-position: center; background-attachment: fixed;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            color: #ffffff; display: flex; align-items: center; justify-content: center; min-height: 100vh;
        }
        .container {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 100%);
            backdrop-filter: blur(25px); -webkit-backdrop-filter: blur(25px);
            border: 1px solid rgba(255, 255, 255, 0.2); border-top: 1px solid rgba(255, 255, 255, 0.5);
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.4); border-radius: 24px;
            width: 100%; max-width: 450px; padding: 40px 30px;
        }
        h2 { text-align: center; margin-bottom: 30px; font-weight: 700; text-shadow: 0 2px 4px rgba(0, 0, 0, 0.4); }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: 600; font-size: 14px; text-shadow: 0 1px 2px rgba(0,0,0,0.4); }
        input[type="text"], input[type="number"], textarea {
            background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.2);
            border-top: 1px solid rgba(255, 255, 255, 0.4); border-radius: 12px;
            display: block; width: 100%; padding: 12px 15px; font-size: 15px; color: #ffffff;
            transition: all 0.3s ease; box-shadow: inset 0 2px 6px rgba(0, 0, 0, 0.15); font-family: inherit;
        }
        input:focus, textarea:focus {
            outline: none; background: rgba(255, 255, 255, 0.25); border-color: #ffffff;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3), inset 0 2px 6px rgba(0, 0, 0, 0.1);
        }
        button {
            cursor: pointer; background: linear-gradient(45deg, #fc00b0, #7a00ff); border: none; color: white;
            font-size: 16px; font-weight: 600; margin-top: 10px; padding: 14px; border-radius: 14px;
            width: 100%; transition: all 0.3s ease; box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
        }
        button:hover { transform: translateY(-2px); box-shadow: 0 8px 20px rgba(252, 0, 176, 0.6); }
        a.back-link {
            display: block; text-align: center; margin-top: 20px; text-decoration: none; 
            color: rgba(255,255,255,0.7); font-size: 14px; transition: color 0.3s;
        }
        a.back-link:hover { color: #ffffff; text-decoration: underline; }
    </style>
</head>
<body>
    <div class="container">
        <h2>${product != null ? 'Sửa Sản Phẩm' : 'Thêm Sản Phẩm'}</h2>
        
        <form action="products?action=${product != null ? 'update' : 'insert'}" method="POST">
            <c:if test="${product != null}">
                <input type="hidden" name="id" value="${product.id}" />
            </c:if>

            <div class="form-group">
                <label>Tên sản phẩm</label>
                <input type="text" name="name" value="${product.name}" required>
            </div>
            
            <div style="display: flex; gap: 15px;">
                <div class="form-group" style="flex: 1;">
                    <label>Giá (VNĐ)</label>
                    <input type="number" name="price" value="${product.price}" required>
                </div>
                <div class="form-group" style="flex: 1;">
                    <label>Số lượng</label>
                    <input type="number" name="quantity" value="${product.quantity}" required>
                </div>
            </div>

            <div class="form-group">
                <label>Mô tả</label>
                <textarea name="description" rows="3">${product.description}</textarea>
            </div>
            
            <button type="submit">${product != null ? 'Cập Nhật' : 'Lưu Sản Phẩm'}</button>
        </form>
        
        <a href="products" class="back-link">← Quay lại danh sách</a>
    </div>
</body>
</html>