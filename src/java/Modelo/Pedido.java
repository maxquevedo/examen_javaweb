package Modelo;

public class Pedido {
    private int id_pedido;
    private int cantidad;
    private int id_carretera_fk;
    private int id_boleta_fk;

    public Pedido() {
    }

    public Pedido(int id_pedido, int cantidad, int id_carretera_fk, int id_boleta_fk) {
        this.id_pedido = id_pedido;
        this.cantidad = cantidad;
        this.id_carretera_fk = id_carretera_fk;
        this.id_boleta_fk = id_boleta_fk;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getId_carretera_fk() {
        return id_carretera_fk;
    }

    public void setId_carretera_fk(int id_carretera_fk) {
        this.id_carretera_fk = id_carretera_fk;
    }

    public int getId_boleta_fk() {
        return id_boleta_fk;
    }

    public void setId_boleta_fk(int id_boleta_fk) {
        this.id_boleta_fk = id_boleta_fk;
    }
    
    
}
