package Modelo;

public class Boleta {
    private int id_boleta;
    private int rut_empresa;
    private String nombre_empresa;
    private String direccion_empresa;
    private String comprador;
    private String opc_pago;
    private String opc_retiro;
    private int total;

    public Boleta() {
    }

    public Boleta(int id_boleta, int rut_empresa, String nombre_empresa, String direccion_empresa, String comprador, String opc_pago, String opc_retiro, int total) {
        this.id_boleta = id_boleta;
        this.rut_empresa = rut_empresa;
        this.nombre_empresa = nombre_empresa;
        this.direccion_empresa = direccion_empresa;
        this.comprador = comprador;
        this.opc_pago = opc_pago;
        this.opc_retiro = opc_retiro;
        this.total = total;
    }

    public int getId_boleta() {
        return id_boleta;
    }

    public void setId_boleta(int id_boleta) {
        this.id_boleta = id_boleta;
    }

    public int getRut_empresa() {
        return rut_empresa;
    }

    public void setRut_empresa(int rut_empresa) {
        this.rut_empresa = rut_empresa;
    }

    public String getNombre_empresa() {
        return nombre_empresa;
    }

    public void setNombre_empresa(String nombre_empresa) {
        this.nombre_empresa = nombre_empresa;
    }

    public String getDireccion_empresa() {
        return direccion_empresa;
    }

    public void setDireccion_empresa(String direccion_empresa) {
        this.direccion_empresa = direccion_empresa;
    }

    public String getComprador() {
        return comprador;
    }

    public void setComprador(String comprador) {
        this.comprador = comprador;
    }

    public String getOpc_pago() {
        return opc_pago;
    }

    public void setOpc_pago(String opc_pago) {
        this.opc_pago = opc_pago;
    }

    public String getOpc_retiro() {
        return opc_retiro;
    }

    public void setOpc_retiro(String opc_retiro) {
        this.opc_retiro = opc_retiro;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    
}
