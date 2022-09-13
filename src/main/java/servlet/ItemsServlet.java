package servlet;

import manager.ItemManager;
import model.Category;
import model.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/items")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1mb
        maxFileSize = 1024 * 1024 * 10, // 10mb
        maxRequestSize = 1024 * 1024 * 100 //100mb
)
public class ItemsServlet extends HttpServlet {
    private ItemManager itemManager = new ItemManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Item> list = itemManager.getItems();
        req.setAttribute("items", list);
        req.getRequestDispatcher("/WEB-INF/items.jsp").forward(req, resp);
    }
}
