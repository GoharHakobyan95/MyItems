package servlet;

import manager.CategoryManager;
import model.Category;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/categories")
public class CategoriesServlet extends HttpServlet {
    private CategoryManager categoryManager = new CategoryManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryManager.getAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/WEB-INF/categories.jsp").forward(req, resp);
    }
}
