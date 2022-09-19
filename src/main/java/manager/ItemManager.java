package manager;

import db.DBConnectionProvider;
import model.Item;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ItemManager {
    Connection connection = DBConnectionProvider.getInstance().getConnection();
    private CategoryManager categoryManager = new CategoryManager();
    private UserManager userManager = new UserManager();

    public void addItem(Item item) {
        String sql = "Insert into item (title,price,category_id,picture_url,user_id) Values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, item.getTitle());
            ps.setDouble(2, item.getPrice());
            ps.setInt(3, item.getCategory().getId());
            ps.setString(4, item.getPictureUrl());
            ps.setInt(5, item.getUser().getId());
            ps.executeUpdate();

            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                item.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Item> getItems() {
        String sql = "SELECT * FROM  item ";
        List<Item> items = new LinkedList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                items.add(getItemFromResulSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return items;
    }

    public List<Item> getLast20Items() {
        String sql = "SELECT * FROM  item ORDER BY id desc LIMIT 20";
        List<Item> items = new LinkedList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                items.add(getItemFromResulSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return items;
    }

    public List<Item> userAllItems(int userId) {
        String sql = "SELECT * FROM  item ORDER BY id desc LIMIT 20 where id = " + userId;
        List<Item> items = new LinkedList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                items.add(getItemFromResulSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return items;
    }

    public List<Item> get20ItemByCategory(int categoryId) {
        String sql = "SELECT * FROM  item ORDER BY id LIMIT 20 where id = " + categoryId;
        List<Item> items = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                items.add(getItemFromResulSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return items;
    }

    public Item getById(int id) {
        String sql = "SELECT * FROM item  WHERE id = " + id;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                return getItemFromResulSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    public void removeItemById(int itemId) {
        String sql = "DELETE  FROM  item WHERE id = " + itemId;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Item getItemFromResulSet(ResultSet resultSet) throws SQLException {
        int categoryId = resultSet.getInt("category_id");
        int userId = resultSet.getInt("user_id");
        return Item.builder()
                .id(resultSet.getInt("id"))
                .title(resultSet.getString("title"))
                .category(categoryManager.getById(categoryId))
                .price(resultSet.getDouble("price"))
                .pictureUrl(resultSet.getString("picture_url"))
                .user(userManager.getById(userId))
                .build();

    }

}

