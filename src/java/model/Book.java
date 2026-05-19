package model;

public class Book {
    private int id;
    private String title;
    private double price;
    private String imageName;
    private String tacgia;
    private String mota;
    private int soluong;

    
    public Book(int id, String title, double price, String imageName, String mota, String tacgia, int soluong) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.imageName = imageName;
        this.mota = mota;
        this.tacgia = tacgia;
        this.soluong = soluong;
    }

    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    
    public String getImageName() { return imageName; }
    public void setImageName(String imageName) { this.imageName = imageName; }
    
    public String getMota() { return mota; }
    public void setMota(String mota) { this.mota = mota; }
    
    public String getTacgia() { return tacgia; }
    public void setTacgia(String tacgia) { this.tacgia = tacgia; }
    
    public int getSoluong() { return soluong; }
    public void setSoluong(int soluong) { this.soluong = soluong; }
}