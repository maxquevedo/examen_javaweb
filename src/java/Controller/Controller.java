package Controller;

import Config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.*;
import Config.*;
import ModeloDAO.*;
import javax.servlet.RequestDispatcher;

public class Controller extends HttpServlet {
    
    int id;
    Boleta bo = new Boleta();
    Pedido pe = new Pedido();
    Queries q = new Queries();
    String listar = "pedidos.jsp";
    String boleta = "boleta.jsp";
    String editar = "editar.jsp";
    String acceso = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String action = request.getParameter("accion");
        
        if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            bo.setId_boleta(id);
            q.eliminarBOL(id);
            acceso = listar;
        }else if (action.equalsIgnoreCase("editar")) {

            request.setAttribute("id_boleta", request.getParameter("id"));
            acceso = editar;

        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("Agregar")) {
            int rut = Integer.parseInt(request.getParameter("txtrut"));
            String nombre = request.getParameter("txtnombre");
            String direccion = request.getParameter("txtdireccion");
            String comprador = request.getParameter("txtcomprador");
            String opc_pago = request.getParameter("pago");
            String opc_retiro = request.getParameter("envio");
            int total = Integer.parseInt(request.getParameter("total"));
            
            
            bo.setId_boleta(0);
            bo.setRut_empresa(rut);
            bo.setNombre_empresa(nombre);
            bo.setDireccion_empresa(direccion);
            bo.setComprador(comprador);
            bo.setOpc_pago(opc_pago);
            bo.setOpc_retiro(opc_retiro);
            bo.setTotal(total);
            q.addBOL(bo);
            
            acceso = boleta;
        }else if(action.equalsIgnoreCase("buscar")) {
            int rut = Integer.parseInt(request.getParameter("txtrut"));
            
        }else if (action.equalsIgnoreCase("Actualizar")) {

            
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            bo.setId_boleta(id);
            q.eliminarBOL(id);
            acceso = listar;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
