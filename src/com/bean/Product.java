package com.bean;

/**
 * Created by zxy on 2016/12/29.
 */
public class Product {
    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getMateriacode() {
        return materiacode;
    }

    public void setMateriacode(String materiacode) {
        this.materiacode = materiacode;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public Product(String applicant, String department, String materiacode, String model, Integer number, String ordernumber, String productname, String project) {
        this.applicant = applicant;
        this.department = department;
        this.materiacode = materiacode;
        this.model = model;
        this.number = number;
        this.ordernumber = ordernumber;
        this.productname = productname;
        this.project = project;
    }

    private String ordernumber;
    private String productname;
    private String materiacode;
    private String model;
    private Integer number;
    private String department;
    private String applicant;
    private String project;


    public String toString() {
        return "Product{" +
                "applicant='" + applicant + '\'' +
                ", ordernumber='" + ordernumber + '\'' +
                ", productname='" + productname + '\'' +
                ", materiacode='" + materiacode + '\'' +
                ", model='" + model + '\'' +
                ", number=" + number +
                ", department='" + department + '\'' +
                ", project='" + project + '\'' +
                '}';
    }

    public Product() {
    }
}


