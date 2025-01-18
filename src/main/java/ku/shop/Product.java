package ku.shop;

import javax.naming.InsufficientResourcesException;

public class Product {
    private double price;
    private String name;
    private int stock;

    public Product(String name, double price, int stock) {
        this.name = name;
        this.price = price;
        this.stock = stock;
    }

    public void cutStock(int quantity) throws InsufficientResourcesException {
        if (quantity > stock) {
            throw new InsufficientResourcesException("Not enough stock");
        }
        stock -= quantity;
    }

    public String getName() {
        return name;
    }
    public double getPrice() {
        return price;
    }
    public int getStock() {
        return stock;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setPrice(double price) {
        this.price = price;
    }
}
