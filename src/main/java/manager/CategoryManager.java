package manager;

import db.DBConnectionProvider;
import model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryManager {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void addCategory(Category category) {
        String sql = "Insert into category (`name`) Values(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, category.getName());
            ps.executeUpdate();

            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                category.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Category> getAll() {
        String sql = "SELECT * FROM  category";
        List<Category> categories = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                categories.add(getCategoryFromResultSet(resultSet));
            }
        } catch (SQLException | RuntimeException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public Category getById(int id) {
        String sql = "SELECT * FROM  category where id = " + id;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery(sql);
            if (resultSet.next()) {
                return getCategoryFromResultSet(resultSet);
            }
        } catch (SQLException | RuntimeException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteById(int id) {
        String sql = "DELETE FROM category where id = " + id;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate(sql);
        } catch (SQLException | RuntimeException e) {
            e.printStackTrace();
        }
    }


    private Category getCategoryFromResultSet(ResultSet resultSet) throws SQLException {
        return Category.builder()
                .id(resultSet.getInt("id"))
                .name(resultSet.getString("name"))
                .build();
    }

}
