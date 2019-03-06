package Interface;

import Modelo.*;
import java.util.List;

public interface CRUD {
    public List listarBOL();
    public Boleta listBOL(int id);
    public boolean addBOL(Boleta bol);
    public boolean eliminarBOL(int id);
    
    public List listarPED();
    public Pedido listPED(int rut);
    public boolean addPED(Pedido ped);
}
