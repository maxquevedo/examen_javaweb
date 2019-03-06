package Modelo;

public class Carretera {
    private int id_carretera;
    private String nombre_carretera;
    private int precio_carretera;

    public Carretera() {
    }

    public Carretera(int id_carrtetera, String nombre_carretera, int precio_carretera) {
        this.id_carretera = id_carrtetera;
        this.nombre_carretera = nombre_carretera;
        this.precio_carretera = precio_carretera;
    }

    public int getId_carretera() {
        return id_carretera;
    }

    public void setId_carretera(int id_carretera) {
        this.id_carretera = id_carretera;
    }

    public String getNombre_carretera() {
        return nombre_carretera;
    }

    public void setNombre_carretera(String nombre_carretera) {
        this.nombre_carretera = nombre_carretera;
    }

    public int getPrecio_carretera() {
        return precio_carretera;
    }

    public void setPrecio_carretera(int precio_carretera) {
        this.precio_carretera = precio_carretera;
    }
}
