package servlet;

import manager.CategoryManager;
import manager.ItemManager;
import manager.UserManager;
import model.Category;
import model.Item;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/items/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1mb
        maxFileSize = 1024 * 1024 * 10, // 10mb
        maxRequestSize = 1024 * 1024 * 100 //100mb
)
public class AddItemServlet extends HttpServlet {
    private ItemManager itemManager = new ItemManager();
    private CategoryManager categoryManager = new CategoryManager();
    private UserManager userManager = new UserManager();
    private static final String IMAGE_PATH = "\\C:\\Users\\Noname\\IdeaProjects\\MyItems\\projectImages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = categoryManager.getAll();
        List<User> users = userManager.getAllUsers();
        req.setAttribute("categories", categories);
        req.setAttribute("users", users);
        req.getRequestDispatcher("/WEB-INF/addItem.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF8");
        String title = req.getParameter("title");
        Double price = Double.valueOf(req.getParameter("price"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        int userId = Integer.parseInt(req.getParameter("userId"));

        Part profilePicPart = req.getPart("pictureUrl");
        String fileName = null;
        if (profilePicPart != null) {
            long nanoTime = System.nanoTime();
            fileName = nanoTime + "_" + profilePicPart.getSubmittedFileName();
            profilePicPart.write(IMAGE_PATH + fileName);
        }
        Item item = Item.builder()
                .title(title)
                .price(price)
                .category(categoryManager.getById(categoryId))
                .pictureUrl(fileName)
                .user(userManager.getById(userId))
                .build();
        itemManager.addItem(item);
        resp.sendRedirect("/my/items");

    }
}

