package items;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Items_Dao {
    private Connection conn;
    private ResultSet rs;

    public Items_Dao() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/caps";
            String dbID = "root";
            String dbPassword = "0000";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Item> getRecentItems(int limit) {
        List<Item> list = new ArrayList<>();

        String laptopSQL = "SELECT 'laptop' AS type, lapID AS id, lapName AS name, lapPrice AS price, userName AS seller FROM Items_laptop ORDER BY lapID DESC LIMIT ?";
        String tpSQL = "SELECT 'tp' AS type, tpID AS id, tpName AS name, tpPrice AS price, userName AS seller FROM Items_tp ORDER BY tpID DESC LIMIT ?";

        try (PreparedStatement laptopStmt = conn.prepareStatement(laptopSQL);
             PreparedStatement tpStmt = conn.prepareStatement(tpSQL)) {
            laptopStmt.setInt(1, limit);
            tpStmt.setInt(1, limit);

            try (ResultSet laptopRs = laptopStmt.executeQuery();
                 ResultSet tpRs = tpStmt.executeQuery()) {

                while (laptopRs.next()) {
                    Item item = new Item();
                    item.setType(laptopRs.getString("type"));
                    item.setId(laptopRs.getInt("id"));
                    item.setName(laptopRs.getString("name"));
                    item.setPrice(laptopRs.getInt("price"));
                    item.setSeller(laptopRs.getString("seller"));
                    list.add(item);
                }

                while (tpRs.next()) {
                    Item item = new Item();
                    item.setType(tpRs.getString("type"));
                    item.setId(tpRs.getInt("id"));
                    item.setName(tpRs.getString("name"));
                    item.setPrice(tpRs.getInt("price"));
                    item.setSeller(tpRs.getString("seller"));
                    list.add(item);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Collections.sort(list, new Comparator<Item>() {
            @Override
            public int compare(Item o1, Item o2) {
                return o2.getId() - o1.getId();
            }
        });

        if (list.size() > limit) {
            return list.subList(0, limit);
        }

        return list;
    }

    public class Item {
        private String type;
        private int id;
        private String name;
        private int price;
        private String seller;

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public int getPrice() {
            return price;
        }

        public void setPrice(int price) {
            this.price = price;
        }

        public String getSeller() {
            return seller;
        }

        public void setSeller(String seller) {
            this.seller = seller;
        }
    }
}
