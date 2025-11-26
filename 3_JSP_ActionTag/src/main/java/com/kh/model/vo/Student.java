package com.kh.model.vo;

public class Student {
	
	private String name;
	private int age;
	private String gender;
	
	
	
	public Student() {
		super();
	}
	
	
	public Student(String name, int age, String gender) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
	}


	public synchronized String getName() {
		return name;
	}
	public synchronized void setName(String name) {
		this.name = name;
	}
	public synchronized int getAge() {
		return age;
	}
	public synchronized void setAge(int age) {
		this.age = age;
	}
	public synchronized String getGender() {
		return gender;
	}
	public synchronized void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String toString() {
		return "Student [name=" + name + ", age=" + age + ", gender=" + gender + "]";
	}
	
	

}
