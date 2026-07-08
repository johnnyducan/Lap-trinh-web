package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) { action = "list"; }

        switch (action) {
            case "new":
                request.getRequestDispatcher("product-form.jsp").forward(request, response);
                break;
            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Product existingProduct = productDAO.getProductById(editId);
                request.setAttribute("product", existingProduct);
                request.getRequestDispatcher("product-form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                productDAO.deleteProduct(deleteId);
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().print("<script>window.location.href='products';</script>");
                break;
            default:
                List<Product> listProduct = productDAO.getAllProducts();
                request.setAttribute("listProduct", listProduct);
                request.getRequestDispatcher("product-list.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        if ("insert".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");

            Product newProduct = new Product(0, name, price, quantity, description);
            productDAO.insertProduct(newProduct);
            
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>window.location.href='products';</script>");
            
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");

            Product product = new Product(id, name, price, quantity, description);
            productDAO.updateProduct(product);

            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>window.location.href='products';</script>");
        }
    }
}