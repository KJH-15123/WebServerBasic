package com.kh.controller;

public class Book {
	private int book_no;
	private String book_title;
	private String author;
	private String category;
	private int price;
	
	public Book() {
		
	}

	public Book(int book_no, String book_title, String author, String category, int price) {
		super();
		this.book_no = book_no;
		this.book_title = book_title;
		this.author = author;
		this.category = category;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Book [book_no=" + book_no + ", book_title=" + book_title + ", author=" + author + ", category="
				+ category + ", price=" + price + "]";
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
