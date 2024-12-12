package model;

import java.io.Serializable;
import java.text.DecimalFormat;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Table;

@Entity
@Table(name = "TBOOKS") 
public class Book implements Serializable {

    @Id
    @Column(name = "ISBN") 
    private String isbn;

    @Column(name = "TITLE") 
    private String title;

    @Column(name = "AUTHOR")
    private String author;

    @Column(name = "PRICE")
    private double price;

    // No-argument constructor
    public Book() {
    }

    // Parameterized constructor
    public Book(String isbn, String title, String author, double price) {
        this.isbn = isbn;
        this.author = author;
        this.title = title;
        this.price = price;
    }

    // Getters and Setters
    public String getIsbn() {
        return isbn;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

    public double getPrice() {
        return price;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    

    // Additional methods
    @Override
    public String toString() {
        return "Title: " + title;
    }

    public String getDollarPrice() {
        DecimalFormat formatter = new DecimalFormat("0.00");
        return "$" + formatter.format(this.price);
    }
}
