package ModeloDAO;

import Config.Conexion;
import Interface.CRUD;
import Modelo.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Queries implements CRUD{
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Boleta bo = new Boleta();
    Pedido pe = new Pedido();

    //<editor-fold defaultstate="collapsed" desc="BOLETA">
    @Override
    public List listarBOL() {
        ArrayList<Boleta> list = new ArrayList<>();
        String sql = "select * from boleta";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Boleta boleta = new Boleta();
                boleta.setId_boleta(rs.getInt("id_boleta"));
                boleta.setRut_empresa(rs.getInt("rut_empresa"));
                boleta.setNombre_empresa(rs.getString("nombre_empresa"));
                boleta.setDireccion_empresa(rs.getString("direccion_empresa"));
                boleta.setComprador(rs.getString("comprador"));
                boleta.setOpc_pago(rs.getString("opc_pago"));
                boleta.setOpc_retiro(rs.getString("opc_retiro"));
                boleta.setTotal(rs.getInt("total"));
                list.add(boleta);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    @Override
    public Boleta listBOL(int id) {
        String sql = "select * from boleta where id_boleta=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                bo.setId_boleta(rs.getInt("id_boleta"));
                bo.setRut_empresa(rs.getInt("rut_empresa"));
                bo.setNombre_empresa(rs.getString("nombre_empresa"));
                bo.setDireccion_empresa(rs.getString("direccion_empresa"));
                bo.setComprador(rs.getString("comprador"));
                bo.setOpc_pago(rs.getString("opc_pago"));
                bo.setOpc_retiro(rs.getString("opc_retiro"));
                bo.setTotal(rs.getInt("total"));
            }
        } catch (Exception e) {
        }
        return bo;
    }
    
    @Override
    public boolean addBOL(Boleta bol) {
        String sql = "insert into boleta(rut_empresa, nombre_empresa, direccion_empresa, comprador, opc_pago, opc_retiro, total) values " + "(" + bol.getRut_empresa() + ", '" + bol.getNombre_empresa() + "','" + bol.getDireccion_empresa() + "','" + bol.getComprador() + "','" + bol.getOpc_pago() + "', '" + bol.getOpc_retiro() + "', " + bol.getTotal() + ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    @Override
    public boolean eliminarBOL(int id) {
        String sql = "delete from boleta where id_boleta=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
//</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="PEDIDO">
    @Override
    public List listarPED() {
        ArrayList<Pedido> list = new ArrayList<>();
        String sql = "select * from pedido";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setId_pedido(rs.getInt("id_carretera"));
                pedido.setCantidad(rs.getInt("cantidad"));
                pedido.setId_carretera_fk(rs.getInt("id_carretera_fk"));
                pedido.setId_boleta_fk(rs.getInt("id_boleta_fk"));
                list.add(pedido);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    @Override
    public Pedido listPED(int rut) {
        String sql = "SELECT CAR.NOMBRE_CARRETERA, BO.TOTAL\n" +
                "FROM CARRETERA CAR\n" +
                "JOIN PEDIDO PED ON (CAR.id_carretera = ped.id_carretera_fk)\n" +
                "JOIN BOLETA BO ON (PED.id_boleta_fk = BO.id_boleta\n" +
                "AND BO.rut_empresa= " + rut + ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                pe.setId_pedido(rs.getInt("id_carretera"));
                pe.setCantidad(rs.getInt("cantidad"));
                pe.setId_carretera_fk(rs.getInt("id_carretera_fk"));
                pe.setId_boleta_fk(rs.getInt("id_boleta_fk"));
            }
        } catch (Exception e) {
        }
        return pe;
    }
    
    @Override
    public boolean addPED(Pedido ped) {
        String sql = "insert into pedido(id_pedido, cantidad, id_carretera_fk, id_boleta_fk) values " + "(" + ped.getId_pedido() + ", " + ped.getCantidad() + "," + ped.getId_carretera_fk() + "," + ped.getId_boleta_fk() + ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
//</editor-fold>
    
}
