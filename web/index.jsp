<%-- 
    Document   : index
    Created on : 29-nov-2018, 20:19:15
    Author     : Informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Highway</title>
        <link rel="stylesheet" href="estilo.css">
        <script src="js/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <h2 align="center">Datos Empresa</h2>
        <br/>
        <form name="ComprarPedido" action="Controller" method="POST">
            <section class="flexbox">
                <nav align="left">
                    <img src="img/logo.jpg" alt="logo" width="230px"/>
                    <ul>
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="pedidos.jsp">Ver Pedidos</a></li>
                        <li><a href="ayuda.jsp">Ayuda</a></li>
                    </ul>
                </nav>
                <table class="formulario" align="center">
                    <tr>
                        <td>Rut</td>
                        <td><input id="rut" type="text" name="txtrut" placeholder="12345678" required/><br/><small>Ingreso sin numero verificador</small></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input id="nombre" type="text" name="txtnombre" required/></td>
                    </tr>
                    <tr>
                        <td>Dirección</td>
                        <td><input id="direccion" type="text" name="txtdireccion" required/></td>
                    </tr>
                    <tr>
                        <td>Comprado por</td>
                        <td><input id="comprado_por" type="text" name="txtcomprador" required/></td>
                    </tr>
                </table>
                <div style="margin-left:10%;">
                    <a href="carreteras.jsp" style="margin-left:17%;">Ver Carreteras</a>
                </div>
            </section>
            <section align="center">
                Seleccione Carretera, indique la cantidad y agregue al pedido
                <br/>
                <select id="carreteras">
                    <option value="Vespucio Sur">Vespucio Sur</option>
                    <option value="Costanera Norte">Costanera Norte</option>
                    <option value="Autopista Central">Autopista Central</option>
                    <option value="Vespucio Norte">Vespucio Norte</option>
                </select>&nbsp;
                <button type="button" id="agregar">Agregar</button>
            </section>
            <br/>
            <section class="flexbox" style="margin-left: 5%;">
                <div>
                    <h4>Opciones de pago</h4>
                    <ul style="list-style: none;">
                        <li class="no"><input id="trasnferencia" type="radio" name="pago" value="trasnferencia" required/><label for="trasnferencia">Transferencia</label></li>
                        <li class="no"><input id="linea" type="radio" name="pago" value="linea" required/><label for="linea">Pago en Linea</label></li>
                        <li class="no"><input id="orden" type="radio" name="pago" value="orden" required/><label for="orden">Orden de Compra</label></li>
                    </ul>
                </div>
                <table id="pedidos" name="pedidos" style="margin-left:25%;">
                    <thead>
                        <th>Carretera</th>
                        <th>Cantidad</th>
                        <th>Quitar</th>
                    </thead>
                    <tbody id="insertar">
                         <tr>
                            <td>Vespucio Sur</td>
                            <td id='primera'>1</td>
                            <td><button id='borraPrimera'  type="button">-</button></td>
                        </tr>  
                        <tr>
                            <td>Costanera Norte</td>
                            <td id='segunda'>0</td>
                            <td><button id='borraSegunda'  type="button">-</button></td>
                        </tr> 
                        <tr>
                            <td>Autopista Central</td>
                            <td id='tercera'>0</td>
                            <td><button id='borraTercera' type="button">-</button></td>
                        </tr> 
                        <tr>
                            <td>Vespicio Norte</td>
                            <td id='cuarta'>0</td>
                            <td><button id='borraCuarta' type="button">-</button></td>
                        </tr> 
                    </tbody>
                </table>
            </section>
            <br/>
            <section class="flexbox" style="margin-left:5%;">
                <div>
                    <h4>Opciones de retiro</h4>
                    <ul style="list-style: none;">
                        <li class="no"><input id="oficina" value="oficina" type="radio" name="envio"/><label for="oficina">Oficina</label></li>
                        <li class="no"><input id="envio" value="envio" type="radio" name="envio"/><label for="envio">Envio Cliente</label></li>
                    </ul>
                </div>
                <div style="margin-left:25%;">
                    <h4>Total a pagar: <span id="pagar" name="totalAPagar">$120.000.</span>
                    </h4>
                </div>
                    <div style="margin-top:1.5%; margin-left: 1%;">
                        <button id="calcular" type="button">Calcular total</button>
                        <button id="pedir" name="accion" type="submit" value="Agregar">Hacer Pedido</button>
                    </div>         
            </section>
            <input type="hidden" id="htotal" name="total"/>
            <input type="hidden" id="hprimera" name="primera"/>
            <input type="hidden" id="hsegunda" name="segunda"/>
            <input type="hidden" id="htercera" name="tercera"/>
            <input type="hidden" id="hcuarta" name="cuarta"/>
        </form>
        <script>
            var pago = false;
            var retiro = false;
            var rut = false;
            var nombre = false;
            var direccion = false;
            var comprado = false;
            var gud = false;  
            var cantidad = 0;
            var arr = [];
            var primera=1;
            var segunda=0;
            var tercera=0;
            var cuarta=0;
            var val_primera= 150000;
            var val_segunda= 200000;
            var val_tercera= 300000;
            var val_cuarta=  180000;
            var total = 0;
            $(document).ready(function(){          
                $("input[name='pago'").click(function(){
                    pago=true;
                });
                
                $("input[name='envio']").click(function(){
                   retiro = true; 
                });
                
                var val_nombre = $("#nombre").value;
                var val_rut = $("#rut").value;
                var val_dir = $("#direccion").value;
                var val_comprado = $("#comprado").value;
                $("#pedir").click(function(e){
                    cantidad = 0;
                    cantidad +=primera;
                    cantidad +=segunda;
                    cantidad +=tercera;
                    cantidad +=cuarta;                   
                    if(pago && retiro ){
                        if(cantidad <= 0){
                           e.preventDefault();
                           alert("No puedes hacer un pedido vacío");
                       }

                       //redireccionar
                   }else{
                       alert("Por favor seleccione metodo de pago y/o envio");
                   }
                });

                $("#agregar").click(function(e){
                        var nombre = $("#carreteras").val();
                        switch(nombre){
                            case "Vespucio Sur":
                                primera+=1;
                                $("#primera").html(primera);
                                break;
                            case "Costanera Norte":
                                segunda +=1;
                                $("#segunda").html(segunda);
                                break;
                            case "Autopista Central":
                                tercera+=1;
                                $("#tercera").html(tercera);
                                break;
                            case "Vespucio Norte":
                                cuarta+=1;
                                $("#cuarta").html(cuarta);
                                break;
                            default: 
                                break;
                        }
                    });
                    
                $("#borraPrimera").click(function(){
                    if(primera > 0){
                      primera-=1;  
                    } 
                    $("#primera").html(primera);
                });
                
                $("#borraSegunda").click(function(){
                      if(segunda > 0){
                      segunda-=1;  
                    }
                    $("#segunda").html(segunda);
                });
                
                $("#borraTercera").click(function(){
                      if(tercera > 0){
                      tercera-=1;  
                    }
                    $("#tercera").html(tercera);
                });
                
                $("#borraCuarta").click(function(){
                      if(cuarta > 0){
                      cuarta-=1;  
                    }
                    $("#cuarta").html(cuarta);
                });
                
                $("#calcular").click(function(){
                    total = 0;
                    total += (primera * val_primera);
                    total += (segunda * val_segunda);
                    total += (tercera * val_tercera);
                    total += (cuarta * val_cuarta);
                    $("#pagar").html("$"+total);   
                    $("#hprimera").val(primera);
                    $("#hsegunda").val(segunda);
                    $("#htercera").val(tercera);
                    $("#hcuarta").val(cuarta);
                    $("#htotal").val(total);
                });
            });
            
        </script>
    </body>
</html>
