<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarVehiculo.aspx.cs"
    Inherits="SISCONET.Modulos.Transporte.Administracion.GestionarVehiculo" UICulture="es"
    Culture="es-CO" %>

<%@ Register Src="../../../Componentes/TituloCampoForma.ascx" TagName="TituloCampoForma"
    TagPrefix="uc1" %>
<%@ Register Src="../../../Componentes/Calendario.ascx" TagName="Calendario" TagPrefix="uc2" %>
<%@ Register Src="../../../Componentes/TituloPagina.ascx" TagName="TituloPagina"
    TagPrefix="uc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="AyudaTercero.ascx" TagName="AyudaTercero" TagPrefix="uc4" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<link href="../../../css/jcss/jccs.css" rel="stylesheet" />
<link href="../../../css/jcss/fa-all.css" rel="stylesheet" />


<head id="Head1" runat="server">
    <style type="text/css">
        .oculto {
            visibility: hidden;
        }

        .style4 {
            width: 880px;
        }

        .boton {
        }
        .image-container {
            width: 200px;
            height: 200px;
            border: 1px solid #ccc;
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        
        #popupImage {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 90%;
            max-height: 90%;
            border: 2px solid #ccc;
            background-color: white;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            z-index: 9999;
            cursor: pointer;
        }
    </style>




    <script src="../../../Scripts/JSBloqueo.js" type="text/javascript"></script>
</head>
<form id="FormMisDatos" runat="server">



    <div class="row">
        <div class="col-md-12">
            <div class="col-md-12 ">
                <div class="panel panel-defaultj">
                    <div class="panel-heading">Gestionar Vehículo</div>
                    <div class="panel-body">


                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3"
                            CssClass="Tab">
                            <cc1:TabPanel ID="TabPanel1" runat="server">
                                <HeaderTemplate>
                                    Licencia de tránsito
                                
</HeaderTemplate>
                                
<ContentTemplate>
                                    <asp:hiddenfield runat="server" id="hfIdVehiculo" />
                                    <div class="form-inline">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloPlaca" runat="server" Titulo="Placa: " Vineta="../../images/vineta.gif" />
                                                    </label>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtPlaca" bordercolor="#01A9F4" runat="server" maxlength="6" cssclass="form-control" placeholder="ABC123 *" style="text-transform: uppercase"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvPlaca" runat="server" controltovalidate="txtPlaca"
                                                        errormessage='Ingrese placa del vehiculo' setfocusonerror="True" text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <cc1:FilteredTextBoxExtender ID="ftePlaca" runat="server" TargetControlID="txtPlaca"
                                                        FilterType="Numbers, UppercaseLetters, LowercaseLetters" Enabled="True" />
                                                    <asp:regularexpressionvalidator runat="server" id="revPlaca" errormessage="La placa no tiene la estructura válida."
                                                        controltovalidate="txtPlaca" setfocusonerror="True" validationgroup="btnAdicionar"
                                                        validationexpression="^([A-Za-z]{3}\d{3})$" display="Dynamic"  forecolor="Red">*</asp:regularexpressionvalidator>
                                                </div>
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloMarca" runat="server" Titulo="Marca: " Vineta="../../images/vineta.gif" />
                                                    </label>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlMarca" runat="server" bordercolor="#01A9F4" cssclass="form-control" onselectedindexchanged="ddlMarca_SelectedIndexChanged"
                                                        autopostback="True"></asp:dropdownlist>
                                                    <asp:requiredfieldvalidator id="rfvMarca" runat="server" controltovalidate="ddlMarca"
                                                        errormessage='Ingrese marca del vehiculo' setfocusonerror="True" text="*" initialvalue="-1"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:label id="lblMarca" runat="server" visible="False"></asp:label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                 <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloLinea" runat="server" Titulo="L&iacute;nea: " Vineta="../../images/vineta.gif" />
                                                    </label>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlLinea" runat="server" placeholder="OPCIONAL: 11 GTL" cssclass="form-control"></asp:dropdownlist>
                                                </div>
                                                 <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloModelo" runat="server" Titulo="Modelo: " Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlModelo" bordercolor="#01A9F4" runat="server" cssclass="form-control" autopostback="True"
                                                        onselectedindexchanged="ddlModelo_SelectedIndexChanged"></asp:dropdownlist>

                                                    <asp:requiredfieldvalidator id="rfvModelo" runat="server" controltovalidate="ddlModelo"
                                                        errormessage='Ingrese modelo' setfocusonerror="True" text="*" initialvalue="-1"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCilindraje" runat="server" Titulo="Cilindraje (cm&sup3;) : "
                                                            Vineta="../../images/vineta.gif" />
                                                    </label>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtCilindraje" placeholder="Opcional: 1390" runat="server" cssclass="form-control" maxlength="9"></asp:textbox>
                                                    <cc1:FilteredTextBoxExtender ID="fteCilindraje" runat="server" TargetControlID="txtCilindraje"
                                                        FilterType="Numbers" Enabled="True" />
                                                </div>
                                                                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaColor" runat="server" Titulo="Color: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlColor" bordercolor="#01A9F4" runat="server" class="form-control"></asp:dropdownlist>
                                                    <asp:requiredfieldvalidator id="rfvColor" runat="server" controltovalidate="ddlColor"
                                                        errormessage="Ingrese color del vehiculo" initialvalue="-1" setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                            <div class="row">    
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma7" runat="server" Titulo="Clase de Vehiculo: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlClaseVehiculo" bordercolor="#01A9F4" runat="server" cssclass="form-control"></asp:dropdownlist>
                                                    <asp:requiredfieldvalidator id="rfvClaseVehiculo" runat="server" controltovalidate="ddlClaseVehiculo"
                                                        errormessage='Ingrese clase de vehiculo' setfocusonerror="True" text="*" initialvalue="-1"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaCarroceria" runat="server" Titulo="Carroceria: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlCarroceria" bordercolor="#01A9F4" runat="server" class="form-control"></asp:dropdownlist>
                                                    <asp:requiredfieldvalidator id="rfvCarroceria" runat="server" controltovalidate="ddlCarroceria"
                                                        errormessage="Ingrese tipo de carroceria del vehiculo" initialvalue="-1" setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaCombustible" runat="server" Titulo="Tipo de Combustible: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlTipoCombustible" runat="server" class="form-control"></asp:dropdownlist>

                                                </div>
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaCapacidad" runat="server" Titulo="Capacidad pasajeros: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtCapacidad" placeholder="10 *" bordercolor="#01A9F4" runat="server" maxlength="9" cssclass="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvCapacidad" runat="server" controltovalidate="txtCapacidad"
                                                        errormessage="Ingrese capacidad de pasajeros del vehiculo" setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <cc1:FilteredTextBoxExtender ID="fteCapacidad" runat="server" Enabled="True" FilterType="Numbers"
                                                        TargetControlID="txtCapacidad">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>                                                
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma5Registro" runat="server" Titulo="Registro Motor: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtRegistro" runat="server" maxlength="30" class="form-control"></asp:textbox>
                                                    <cc1:FilteredTextBoxExtender ID="fteRegistro" runat="server" Enabled="True" FilterType="Numbers,UppercaseLetters,LowercaseLetters"
                                                        TargetControlID="txtRegistro">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>

                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaSerie" runat="server" Titulo="Serie chasis: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtSerie" runat="server" maxlength="25" class="form-control"></asp:textbox>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaPropietario" runat="server" Titulo="Propietario: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">

                                                    <div class="input-group">
                                                        <asp:textbox id="txtPropietario" runat="server" class="form-control"  onkeydown="return (event.keyCode!=13);"></asp:textbox>

                                                        <asp:linkbutton id="btnTerceroProp" runat="server" cssclass="input-group-addon" causesvalidation="False"
                                                            usesubmitbehavior="False" onclick="btnTerceroProp_Click" tooltip="Seleccione un propietario de la lupa">
                                                                <span class="fas fa-search" aria-hidden="true"></span> 
                                                                    </asp:linkbutton>


                                                    </div>



                                                </div>

                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaTenedor" runat="server" Titulo="Tenedor: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <div class="input-group">
                                                        <asp:textbox id="txtTenedor" runat="server" class="form-control" ></asp:textbox>
                                                        <asp:linkbutton id="btnTerceroTenedor" runat="server" cssclass="input-group-addon" causesvalidation="False"
                                                            usesubmitbehavior="False" onclick="btnTerceroTenedor_Click" tooltip="Seleccione un tenedor de la lupa">
                                                    <span class="fas fa-search" aria-hidden="true"></span> 
                                                        </asp:linkbutton>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoCiudadMatricula" runat="server" Titulo="Ciudad de Matricula: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:dropdownlist id="ddlCiudadMatricula" bordercolor="#01A9F4" runat="server" class="form-control"></asp:dropdownlist>
                                                    <asp:requiredfieldvalidator id="rfvCiudadMatricula" runat="server" controltovalidate="ddlCiudadMatricula"
                                                        errormessage='Ingrese Ciudad de Matricula' setfocusonerror="True"
                                                        text="*" initialvalue="-1" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:requiredfieldvalidator id="rfvCiudadMatricula2" runat="server" controltovalidate="ddlCiudadMatricula"
                                                        errormessage='Ingrese Ciudad de Matricula' setfocusonerror="True"
                                                        text="*" initialvalue="-1" validationgroup="btnActualizar"></asp:requiredfieldvalidator>
                                                </div>

                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFechaMatricula" runat="server" Titulo="Fecha Matricula: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaMatricula" placeholder="12/31/2000 *" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="txtFechaMatricula_CalendarExtender" runat="server"
                                                        Enabled="True" PopupButtonID="txtFechaMatricula" TargetControlID="txtFechaMatricula" />
                                                    <asp:comparevalidator id="cmpFechaMatricula" runat="server" validationgroup="btnAdicionar"
                                                       controltovalidate="txtFechaMatricula" errormessage="Debe ingresar una fecha de matricula válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                     <asp:comparevalidator id="todayValidator" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFechaMatricula" 
                                                        errormessage="Debe ingresar una fecha de matricula válida." operator="LessThan" 
                                                        type="Date">*</asp:comparevalidator>
                                                    <asp:requiredfieldvalidator id="rfvFechaMatricula" runat="server" controltovalidate="txtFechaMatricula"                                                        errormessage='Ingrese fecha de matricula' setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:requiredfieldvalidator id="rfvFechaMatricula2" runat="server" controltovalidate="txtFechaMatricula"
                                                        errormessage='Ingrese fecha de matricula' setfocusonerror="True"
                                                        text="*" validationgroup="btnActualizar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaNumeroInterno" runat="server" Titulo="N&uacute;mero interno (Movil): "
                                                            Vineta="../../images/vineta.gif" />
                                                    </label>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtNumeroInterno" placeholder="151 *" bordercolor="#01A9F4" runat="server" cssclass="form-control" maxlength="18"></asp:textbox>
                                                    <cc1:FilteredTextBoxExtender ID="fteNumeroInterno" runat="server" TargetControlID="txtNumeroInterno"
                                                        FilterType="Numbers" Enabled="True" />
                                                    <asp:requiredfieldvalidator id="rfvNumeroInterno" runat="server" controltovalidate="txtNumeroInterno"
                                                        errormessage='Ingrese n&uacute;mero interno del vehiculo' setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloVehiculoServicio" runat="server" Titulo="Veh&iacute;culo de servicio: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </label>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:radiobuttonlist id="rbServicio" runat="server"></asp:radiobuttonlist>
                                                </div>
                                                <input type="file" id="imageInput" accept="image/*"  runat="server" onchange="previewImage(event)" style="margin-bottom: 10px;" />
                                                <div class="image-container" id="imagePreview" runat="server" onclick="showPopupImage()">
                                                    <img src="" alt="Imagen" id="popupImage" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
</ContentTemplate>
                            
</cc1:TabPanel>

                            <cc1:TabPanel ID="TabPanel2" runat="server">
                                <HeaderTemplate>
                                    Datos Complementarios
                                
</HeaderTemplate>
                                
<ContentTemplate>


                                    <div class="form-inline">

                                        <div class="container-fluid">

                                            <div class="row"></div>
                                            <div class="row"></div>                                            
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma1" runat="server" Titulo="Ciudad Ope: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">

                                                    <asp:dropdownlist id="lstCiudadOpe" runat="server" class="form-control"></asp:dropdownlist>
                                                

                                                </div>

                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaPeso" runat="server" Titulo="Peso:" Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">

                                                    <div class="input-group">
                                                        <asp:textbox id="txtPeso" aria-label="..." class="form-control" style="width: 48%" runat="server" maxlength="9"></asp:textbox>
                                                        <asp:dropdownlist id="ddlUnidad" runat="server" class="form-control" style="width: 47%"></asp:dropdownlist>
                                                    </div>
                                                    <cc1:FilteredTextBoxExtender ID="ftePeso" runat="server" Enabled="True" FilterType="Numbers"
                                                        TargetControlID="txtPeso">
                                                    </cc1:FilteredTextBoxExtender>
                                                </div>

                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaConfiguracion" runat="server" Titulo="Tipo de Configuración: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:dropdownlist id="ddlTipoConfiguracion" bordercolor="#01A9F4" runat="server" class="form-control"></asp:dropdownlist>
                                                    <asp:requiredfieldvalidator id="rfvConfiguracion" runat="server" controltovalidate="ddlTipoConfiguracion"
                                                        errormessage="Ingrese tipo de configuración del vehiculo" initialvalue="-1" setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                            <div class="row">                                                
                                                                                              
                                            </div>                                            
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaProveedor" runat="server" Titulo="Empresa transportadora: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">

                                                    <div class="input-group">
                                                        <asp:textbox id="txtProveedor" runat="server" class="form-control"  onkeydown="return (event.keyCode!=13);"></asp:textbox>
                                                        <asp:linkbutton id="btnTerceroProveedor" runat="server" cssclass="input-group-addon" causesvalidation="False"
                                                            usesubmitbehavior="False" onclick="btnTerceroProveedor_Click" tooltip="Seleccione una empresa transportadora de la lupa">
                                                    <span class="fas fa-search" aria-hidden="true"></span> 
                                                        </asp:linkbutton>
                                                    </div>
                                                </div> 
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaEstado" runat="server" Titulo="Estado: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:radiobuttonlist runat="server" id="rbEstado" />
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaDesvinculacion" runat="server" Titulo="Desvinculacion: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:radiobuttonlist runat="server" id="rbDesvinculacion" />
                                                </div>
                                            </div>
											 <div class="row">


                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFechaInicioConvenio" runat="server" Titulo="Inicio Convenio: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtFechaInicioConvenio" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="ceFechaInicioConvenio_CalendarExtender" runat="server" Enabled="True"
                                                        PopupButtonID="txtFechaInicioConvenio" TargetControlID="txtFechaInicioConvenio" Format="MM/dd/yyyy" />
                                                    <asp:comparevalidator id="cmpFechaInicioConvenio" runat="server" validationgroup="btnAdicionar"
                                                        controltovalidate="txtFechaInicioConvenio" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>

                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFechaCaducidadConvenio" runat="server" Titulo="Caducidad Convenio: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtFechaCaducidadConvenio" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="ceFechaCaducidadConvenio_CalendarExtender" runat="server" Enabled="True"
                                                        PopupButtonID="txtFechaCaducidadConvenio" TargetControlID="txtFechaCaducidadConvenio" Format="MM/dd/yyyy" />
                                                    <asp:comparevalidator id="cmpFechaCaducidadConvenio" runat="server" validationgroup="btnAdicionar"
                                                        controltovalidate="txtFechaCaducidadConvenio" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>
												<div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoConvenio" runat="server" Titulo="Convenio: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtConvenio" runat="server" maxlength="50" class="form-control"></asp:textbox>
                                                </div>

                                            </div>
                                            <div class="row">             
                                                

                                            </div>
                                            <!--Inicio campo Cantidad Fuec-->
                                            <div class="row">
                                                 <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="tituloCampoCantidad" runat="server" Titulo="Cantidad De Fuec: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtCantiadFuec" runat="server" maxlength="3" cssclass="form-control"></asp:textbox>
                                                </div>
                                            </div>
                                            <!--Fin Cantidad Fuec-->
                                        </div>
                                    </div>

                                
</ContentTemplate>
                            
</cc1:TabPanel>

                            <cc1:TabPanel ID="TabPanel3" runat="server">
                                <HeaderTemplate>
                                    SOAT
                                
</HeaderTemplate>
                                
<ContentTemplate>
                                    <div class="form-inline">
                                        <div class="container-fluid">
                                            <div class="row"></div>
                                            <div class="row"></div>
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaAseg" runat="server" Titulo="Aseguradora SOAT: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <asp:dropdownlist id="ddlAseguradora" bordercolor="#01A9F4" runat="server" class="form-control"></asp:dropdownlist>
                                                    <asp:requiredfieldvalidator id="rfvAseguradora" runat="server" controltovalidate="ddlAseguradora"
                                                        initialvalue="-1" errormessage='Ingrese aseguradora del vehiculo' setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>

                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaFvSoat" runat="server" Titulo="Fecha vencimiento SOAT: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtFechaVencSoat" bordercolor="#01A9F4" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="txtFechaVencSoat_CalendarExtender" runat="server" Enabled="True"
                                                        PopupButtonID="txtFechaVencSoat" TargetControlID="txtFechaVencSoat" />
                                                                                                      													
													<asp:comparevalidator id="CmpLessDate" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.AddYears(1).ToShortDateString() %>" controltovalidate="txtFechaVencSoat" 
                                                        errormessage="Debe ingresar una fecha de vencimiento soat válida." operator="LessThan" 
                                                         type="Date">*</asp:comparevalidator>
                                                    <asp:comparevalidator id="CmpGreatDate" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFechaVencSoat" 
                                                        errormessage="Debe ingresar una fecha de vencimiento soat válida." operator="GreaterThan" 
                                                         type="Date">*</asp:comparevalidator>                                                    
                                                    <asp:comparevalidator
                                                        id="cmpFechaVencSoat" runat="server" validationgroup="btnAdicionar" controltovalidate="txtFechaVencSoat"
                                                        errormessage="Debe ingresar una fecha válida." operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                    <asp:requiredfieldvalidator
                                                        id="rfvFechaVencSoat" runat="server" controltovalidate="txtFechaVencSoat" errormessage='Ingrese fecha de vencimiento del SOAT del vehiculo'
                                                        setfocusonerror="True" text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>

                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoNoSoat" runat="server" Titulo="No. Soat: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>

                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtNoSoat" bordercolor="#01A9F4" runat="server" maxlength="50" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvNoSoat" runat="server" controltovalidate="txtNoSoat"
                                                        errormessage='Ingrese los nombres del conductor' setfocusonerror="True" text="*"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:requiredfieldvalidator id="rfvNoSoat2" runat="server" controltovalidate="txtNoSoat"
                                                        errormessage='Ingrese los nombres del conductor' setfocusonerror="True" text="*"
                                                        validationgroup="btnActualizar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaTecnicomecanica" runat="server" Titulo="Fecha vencimiento revisi&oacute;n tecnicomec&aacute;nica: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtFechaVencTecnicomecanica" bordercolor="#01A9F4" runat="server" class="form-control" maxlength="10"
                                                        autopostback="True" ontextchanged="txtFechaVencTecno_TextChanged"></asp:textbox>
                                                    <cc1:CalendarExtender ID="txtFechaVencTecnicomecanica_CalendarExtender" runat="server"
                                                        Enabled="True" PopupButtonID="txtFechaVencTecnicomecanica" TargetControlID="txtFechaVencTecnicomecanica" />                                                 

                                                    <asp:comparevalidator id="CmpGreatDateTecno" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFechaVencTecnicomecanica" 
                                                        errormessage="Debe ingresar una fecha de vencimiento Tecnomecanica válida." operator="GreaterThan" 
                                                         type="Date">*</asp:comparevalidator>                                                    
                                                    <asp:comparevalidator id="cmpFechaVencTecnicomecanica" runat="server" validationgroup="btnAdicionar"
                                                        controltovalidate="txtFechaVencTecnicomecanica" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoCDA" runat="server" Titulo="CDA Tecnomecanica: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtCDA" bordercolor="#01A9F4" runat="server" maxlength="50" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvCDA" runat="server" controltovalidate="txtCDA"
                                                        errormessage='Ingrese CDA' setfocusonerror="True" text="*"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:requiredfieldvalidator id="rfvCDA2" runat="server" controltovalidate="txtCDA"
                                                        errormessage='Ingrese CDA' setfocusonerror="True" text="*"
                                                        validationgroup="btnActualizar"></asp:requiredfieldvalidator>
                                                </div>
                                                 <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoNoTecnomecanica" runat="server" Titulo="No. Tecnomecanica: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtNoTecnomecanica" bordercolor="#01A9F4" runat="server" maxlength="50" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvNoTecnomecanica" runat="server" controltovalidate="txtNoTecnomecanica"
                                                        errormessage='Ingrese No. Tecnomecanica' setfocusonerror="True" text="*"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:requiredfieldvalidator id="rfvNoTecnomecanica2" runat="server" controltovalidate="txtNoTecnomecanica"
                                                        errormessage='Ingrese No. Tecnomecanica' setfocusonerror="True" text="*"
                                                        validationgroup="btnActulizar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                            <div class="row"></div>
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloFechaVencimientoPreventivo" runat="server" Titulo="Fecha vencimiento preventiva: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtFechaVenPreventiva" bordercolor="#01A9F4" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="txtFechaVencPreventiva_CalendarExtender" runat="server"
                                                        Enabled="True" PopupButtonID="txtFechaVenPreventiva" TargetControlID="txtFechaVenPreventiva" />
                                                    <asp:requiredfieldvalidator id="rfvFechaPreventiva" runat="server" controltovalidate="txtFechaVenPreventiva"
                                                        errormessage='Ingrese fecha preventiva del vehiculo' setfocusonerror="True" text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:comparevalidator id="cmpFechaVenPreventiva" runat="server" validationgroup="btnAdicionar"
                                                        controltovalidate="txtFechaVenPreventiva" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoCiudadPreventiva" runat="server" Titulo="CDA Preventiva: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtCDAPreventiva" bordercolor="#01A9F4" runat="server" maxlength="50" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvCDAPreventiva" runat="server" controltovalidate="txtCDAPreventiva"
                                                        errormessage='Ingrese CDA Preventiva' setfocusonerror="True" text="*"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:requiredfieldvalidator id="rfvCDAPreventiva2" runat="server" controltovalidate="txtCDAPreventiva"
                                                        errormessage='Ingrese CDA Preventiva' setfocusonerror="True" text="*"
                                                        validationgroup="btnActualizar"></asp:requiredfieldvalidator>
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoNoPreventiva" runat="server" Titulo="No. Preventiva: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtNoPreventiva" bordercolor="#01A9F4" runat="server" maxlength="50" class="form-control"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvNoPreventiva" runat="server" controltovalidate="txtNoPreventiva"
                                                        errormessage='Ingrese No. Preventiva' setfocusonerror="True" text="*"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <asp:requiredfieldvalidator id="rfvNoPreventiva2" runat="server" controltovalidate="txtNoPreventiva"
                                                        errormessage='Ingrese No. Preventiva' setfocusonerror="True" text="*"
                                                        validationgroup="btnActualizar"></asp:requiredfieldvalidator>
                                                </div>                                                
                                            </div>
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaTarjetaOp" runat="server" Titulo="Tarjeta de operaci&oacute;n: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtTarjetaOperacion" bordercolor="#01A9F4" runat="server" class="form-control" maxlength="18"></asp:textbox>
                                                    <asp:requiredfieldvalidator id="rfvTarjetaOp" runat="server" controltovalidate="txtTarjetaOperacion"
                                                        errormessage='Ingrese tarjeta de operacion del vehiculo' setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                    <cc1:FilteredTextBoxExtender ID="fteTarjetaOperacion" runat="server" TargetControlID="txtTarjetaOperacion"
                                                        FilterType="Numbers" Enabled="True" />
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoFormaFecTarjOper" runat="server" Titulo="Fecha vencimiento t.operación: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-2 ">
                                                    <asp:textbox id="txtFechaTarjOperac" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="txtFechaTarjOperac_CalendarExtender" runat="server" Enabled="True"
                                                        PopupButtonID="txtFechaTarjOperac" TargetControlID="txtFechaTarjOperac" />

                                                    <asp:comparevalidator id="CmpLessDateTOP" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.AddYears(2).ToShortDateString() %>" controltovalidate="txtFechaTarjOperac" 
                                                        errormessage="Debe ingresar una fecha de vencimiento Tarjeta válida." operator="LessThan" 
                                                         type="Date">*</asp:comparevalidator>
                                                    <asp:comparevalidator id="CmpGreatDateTOP" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFechaTarjOperac" 
                                                        errormessage="Debe ingresar una fecha de vencimiento Tarjeta válida." operator="GreaterThan" 
                                                         type="Date">*</asp:comparevalidator>
                                                    <asp:comparevalidator id="cmpFechaTarjOperact" runat="server" validationgroup="btnAdicionar"                                                        controltovalidate="txtFechaTarjOperac" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
</ContentTemplate>
                            
</cc1:TabPanel>
                            <%-------BSSR 20170502  Campos adicionales Solicitud Fondocoo---------------%>
                            <cc1:TabPanel ID="TabPanel4" runat="server">
                                <HeaderTemplate>
                                    Pólizas RCC Y RCE
                                
</HeaderTemplate>
                                
<ContentTemplate>
                                    <div class="form-inline">
                                        <div class="container-fluid">
                                            <div class="row"></div>
                                            <div class="row"></div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloAseguradoraRCC" runat="server" Titulo="Aseguradora RCC/RCE: "
                                                            Vineta="../../images/vineta.gif" />

                                                    </labe>
                                                </div>
                                                <div class="col-md-6 ">
                                                    <asp:dropdownlist id="ddlAseguradoraRCC" bordercolor="#01A9F4" runat="server" class="form-control"></asp:dropdownlist>

                                                    <asp:requiredfieldvalidator id="rfvAseguradoraRCC" runat="server" controltovalidate="ddlAseguradoraRCC"
                                                        initialvalue="-1" errormessage='Ingrese aseguradora de RCC' setfocusonerror="True"
                                                        text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>

                                                </div>
                                            </div>                                         
                                            

                                            <div class="row">
                                                

                                                

                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloRCC" runat="server" Titulo="Fecha vencimiento RCC: "
                                                            Vineta="../../images/vineta.gif" />

                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaVenRCC" runat="server" class="form-control" maxlength="10"
                                                            autopostback="True" ontextchanged="txtFechaVenRCC_TextChanged"></asp:textbox>


                                                        <cc1:CalendarExtender ID="txtFechaVencRCC_CalendarExtender" runat="server"
                                                            Enabled="True" PopupButtonID="txtFechaVenRCC" TargetControlID="txtFechaVenRCC" />


                                                         <asp:comparevalidator id="CmpLessDateRCC"  runat="server" validationgroup="btnAdicionar" 
                                                            ValuetoCompare="<%# DateTime.Today.AddYears(1).ToShortDateString() %>" controltovalidate="txtFechaVenRCC" 
                                                            errormessage="Debe ingresar una fecha de vencimiento RCC válida." operator="LessThan" 
                                                             type="Date">*</asp:comparevalidator>

                                                        <asp:comparevalidator id="CmpGreatDateRCC" runat="server" validationgroup="btnAdicionar" 
                                                            ValuetoCompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFechaVenRCC" 
                                                            errormessage="Debe ingresar una fecha de vencimiento RCC válida." operator="GreaterThan" 
                                                             type="Date">*</asp:comparevalidator>

                                                        <asp:comparevalidator id="cmpFechaVenRCC" runat="server" validationgroup="btnAdicionar"
                                                            controltovalidate="txtFechaVenRCC" errormessage="Debe ingresar una fecha válida."
                                                            operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                    
                                                           
                                                   </div>

                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloRCE" runat="server" Titulo="Fecha vencimiento RCE: "
                                                            Vineta="../../images/vineta.gif" />

                                                    </labe>
                                                </div>

                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaVenRCE" runat="server" class="form-control" maxlength="10"></asp:textbox>

                                                    <cc1:CalendarExtender ID="txtFechaVencRCE_CalendarExtender" runat="server"
                                                        Enabled="True" PopupButtonID="txtFechaVenRCE" TargetControlID="txtFechaVenRCE" />

                                                    <asp:comparevalidator id="cmpFechaVenRCE" runat="server" validationgroup="btnAdicionar"
                                                        controltovalidate="txtFechaVenRCE" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>

                                                </div>
                                            </div>
                                            <div class="row">  
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoNoRCC" runat="server" Titulo="No. RCC: "
                                                            Vineta="../../images/vineta.gif" />

                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtNoRCC" bordercolor="#01A9F4" runat="server" maxlength="50" class="form-control"></asp:textbox>

                                                    <asp:requiredfieldvalidator id="rfvNoRCC" runat="server" controltovalidate="txtNoRCC"
                                                        errormessage='Ingrese No. RCC' setfocusonerror="True" text="*"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>

                                                    <asp:requiredfieldvalidator id="rfvNoRCC2" runat="server" controltovalidate="txtNoRCC"
                                                        errormessage='Ingrese No. RCC' setfocusonerror="True" text="*"
                                                        validationgroup="btnActualizar"></asp:requiredfieldvalidator>

                                                </div>
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoNoRCE" runat="server" Titulo="No. RCE: "
                                                            Vineta="../../images/vineta.gif" />

                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtNoRCE" bordercolor="#01A9F4" runat="server" maxlength="50" class="form-control"></asp:textbox>

                                                    <asp:requiredfieldvalidator id="rfvNoRCE" runat="server" controltovalidate="txtNoRCE"
                                                        errormessage='Ingrese No. RCE' setfocusonerror="True" text="*"
                                                        validationgroup="btnAdicionar"></asp:requiredfieldvalidator>

                                                    <asp:requiredfieldvalidator id="rfvNoRCE2" runat="server" controltovalidate="txtNoRCE"
                                                        errormessage='Ingrese No. RCE' setfocusonerror="True" text="*"
                                                        validationgroup="btnActualizar"></asp:requiredfieldvalidator>

                                                </div>
                                            </div>    

                                            
                                        </div>
                                    </div>




                                
</ContentTemplate>
                            
</cc1:TabPanel>
                            <%--------------------------------------------------------------------------%>
                            <cc1:TabPanel ID="TabPanel5" runat="server">
                                <HeaderTemplate>
                                    Datos Kilometraje
                                
</HeaderTemplate>
                                
<ContentTemplate>
                                    <div class="form-inline">
                                        <div class="container-fluid">
                                            <div class="row"></div>
                                            <div class="row"></div>
                                            <div class="row">
                                                 <div class="col-md-3 text-center">
                                                    <label>
                                                         <uc1:TituloCampoForma ID="tituloKilometraje" runat="server" Titulo="Kilometraje Incial: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </label>
                                                 </div>
                                                <div class="col-md-3">
                                                    <asp:textbox id="txtKilometraje" runat="server" class="form-control"></asp:textbox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
</ContentTemplate>
                            
</cc1:TabPanel>

                            <cc1:TabPanel ID="TabPanel6" runat="server" Visible="false">
                                <HeaderTemplate>
                                    Operacionales Carga
                                
</HeaderTemplate>
                                
<ContentTemplate>

                                    <div class="form-inline">

                                        <div class="container-fluid">

                                            <div class="row"></div>
                                            <div class="row"></div>

                                            <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma3" runat="server" Titulo="Fecha vencimiento Certificado Sanitario: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaVencCertSani" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True"
                                                        PopupButtonID="txtFechaVencCertSani" TargetControlID="txtFechaVencCertSani" />
                                                                                                      													
													<asp:comparevalidator id="Comparevalidator1" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.AddYears(1).ToShortDateString() %>" controltovalidate="txtFechaVencCertSani" 
                                                        errormessage="Debe ingresar una fecha de vencimiento válida." operator="LessThan" 
                                                         type="Date">*</asp:comparevalidator>
                                                    <asp:comparevalidator id="Comparevalidator2" runat="server" validationgroup="btnAdicionar" 
                                                        ValuetoCompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFechaVencCertSani" 
                                                        errormessage="Debe ingresar una fecha de vencimiento válida." operator="GreaterThan" 
                                                         type="Date">*</asp:comparevalidator>                                                    
                                                    <asp:comparevalidator
                                                        id="Comparevalidator3" runat="server" validationgroup="btnAdicionar" controltovalidate="txtFechaVencCertSani"
                                                        errormessage="Debe ingresar una fecha válida." operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma4" runat="server" Titulo="Fecha Cambio Aceite: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </label>
                                                </div>                                                
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaCamAceite" runat="server" class="form-control" maxlength="10"
                                                            autopostback="True"></asp:textbox>

                                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server"
                                                            Enabled="True" PopupButtonID="txtFechaCamAceite" TargetControlID="txtFechaCamAceite" />

                                                         <asp:comparevalidator id="Comparevalidator4" runat="server" validationgroup="btnAdicionar" 
                                                            ValuetoCompare="<%# DateTime.Today.AddYears(1).ToShortDateString() %>" controltovalidate="txtFechaCamAceite" 
                                                            errormessage="Debe ingresar una fecha de Cambio Aceite valida" operator="LessThan" 
                                                             type="Date">*</asp:comparevalidator>
                                                        <asp:comparevalidator id="Comparevalidator5" runat="server" validationgroup="btnAdicionar" 
                                                            ValuetoCompare="<%# DateTime.Today.ToShortDateString() %>" controltovalidate="txtFechaCamAceite" 
                                                            errormessage="Debe ingresar una fecha de cambio Valido." operator="GreaterThan" 
                                                             type="Date">*</asp:comparevalidator>
                                                        <asp:comparevalidator id="Comparevalidator6" runat="server" validationgroup="btnAdicionar"
                                                            controltovalidate="txtFechaCamAceite" errormessage="Debe ingresar una fecha válida."
                                                            operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                    <br />
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma8" runat="server" Titulo="KMS: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </label>
                                                    <asp:textbox id="txtaceitekms" runat="server" class="form-control" maxlength="8"
                                                            autopostback="True"></asp:textbox>
                                                    </div>                                                
                                            </div>
                                            <div class="row">                                                
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma5" runat="server" Titulo="Fecha de Fumigación: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaFumigacion" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="CalendarExtender3" runat="server"
                                                        Enabled="True" PopupButtonID="txtFechaFumigacion" TargetControlID="txtFechaFumigacion" />
                                                    <asp:comparevalidator id="Comparevalidator7" runat="server" validationgroup="btnAdicionar"
                                                        controltovalidate="txtFechaFumigacion" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma2" runat="server" Titulo="Fecha de Vencimiento Fumigación: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaFumigacionVencimiento" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="CalendarExtender7" runat="server"
                                                        Enabled="True" PopupButtonID="txtFechaFumigacionVencimiento" TargetControlID="txtFechaFumigacionVencimiento" />
                                                    <asp:comparevalidator id="Comparevalidator14" runat="server" validationgroup="btnAdicionar"
                                                        controltovalidate="txtFechaFumigacionVencimiento" errormessage="Debe ingresar una fecha válida."
                                                        operator="DataTypeCheck" type="Date">*</asp:comparevalidator>
                                                </div>
                                            </div>
                                              <div class="row">
                                                <div class="col-md-3 text-center">
                                                    <label>
                                                        <uc1:TituloCampoForma ID="TituloCampoForma6" runat="server" Titulo="Fecha vencimiento Certificado Termo: "
                                                            Vineta="../../images/vineta.gif" />
                                                    </labe>
                                                </div>
                                                <div class="col-md-3 ">
                                                    <asp:textbox id="txtFechaVencimientoTermo" runat="server" class="form-control" maxlength="10"></asp:textbox>
                                                    <cc1:CalendarExtender ID="CalendarExtender4" runat="server"
                                                        Enabled="True" PopupButtonID="txtFechaVencimientoTermo" TargetControlID="txtFechaVencimientoTermo" />
                                                    <asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" controltovalidate="txtFechaVencimientoTermo"
                                                        errormessage='Ingrese fecha preventiva del vehiculo' setfocusonerror="True" text="*" validationgroup="btnAdicionar"></asp:requiredfieldvalidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
</ContentTemplate>
                            
</cc1:TabPanel>
                        </cc1:TabContainer>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div style="width: 700px">
        <blockquote>
            <table width="100%" border="0">
                <tbody>
                    <tr>
                        <td colspan="3">
                            <asp:label runat="server" id="lblResultado"></asp:label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:validationsummary id="ValidationSummary1" runat="server" headertext="Los siguientes campos son requeridos:"
                                showmessagebox="false" displaymode="BulletList" showsummary="true" validationgroup="btnAdicionar"></asp:validationsummary>
                            <asp:validationsummary id="ValidationSummary2" runat="server" headertext="Los siguientes campos son requeridos:"
                                showmessagebox="false" displaymode="BulletList" showsummary="true" validationgroup="btnActualizar"></asp:validationsummary>
                        </td>
                    </tr>
                </tbody>
            </table>
        </blockquote>
        <table>
            <tbody>
                <tr>
                    <td align="left" class="style4">
                        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                        </cc1:ToolkitScriptManager>
                        <div style="width: 880px">
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <table id="Table2" width="95%">
        <tr>
            <td align="center">

                <span id="PanAdicionar" runat="server">
                    <asp:button id="btnAdicionar" runat="server" text="Grabar" cssclass="boton" onclick="btnAdicionar_Click"
                        validationgroup="btnAdicionar"
                        onclientclick="disableBtn(this.id, 'Grabando...')"
                        usesubmitbehavior="false"></asp:button>
                </span>
                <span id="PanActualizar" runat="server">
                    <asp:button id="btnActualizar" runat="server" text="Actualizar" cssclass="boton" onclick="btnActualizar_Click"
                        validationgroup="btnActualizar" visible="False"
                        onclientclick="disableBtn(this.id, 'Actualizando...')" usesubmitbehavior="False">
                </asp:button>
                    <asp:button id="btnBorrar" runat="server" text="Limpiar" cssclass="boton" causesvalidation="False"
                        onclick="btnBorrar_Click"></asp:button>
                    <asp:button id="btnEliminar" onclientclick="javascript:if (!confirm('¿Desea eliminar el registro?')) return false;"
                        runat="server" text="Eliminar" cssclass="boton" causesvalidation="False" onclick="btnEliminar_Click"
                        visible="False"></asp:button>
                    <asp:button runat="server" id="btnRetornar" text="Retornar" cssclass="boton" onclick="btnRetornar_Click" />
                </span>
                <%--<asp:button id="btnCancelar" runat="server" text="Cancelar" cssclass="boton" causesvalidation="False"
                onclick="btnCancelar_Click"></asp:button>--%>
            </td>
        </tr>
    </table>
    <div>
        <div>
            <asp:panel id="ModalPanelTerceroProp" runat="server" style="display: none; width: 700px; height: 500px; background-color: White; border-width: 1px; border-color: black; border-style: solid; padding: 10px;">
                    <div align="right">
                        <asp:ImageButton ID="OKButtonTerceroProp" runat="server" ImageUrl="~/images/bt-eliminar.gif" style="width:20px;height:20px" />
                    </div>
                        
                       <uc4:AyudaTercero ID="AyudaTercero1" runat="server" />    
                    
                </asp:panel>
            <cc1:ModalPopupExtender ID="mpeTerceroProp" runat="server" TargetControlID="btnModalTerceroProp"
                PopupControlID="ModalPanelTerceroProp" BehaviorID="pmpbCC" OkControlID="OKButtonTerceroProp"
                BackgroundCssClass="modalBackground" RepositionMode="None" />
            <asp:imagebutton id="btnModalTerceroProp" runat="server" cssclass="oculto" />
        </div>
    </div>
</form>

<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#<%=txtPropietario.ClientID %>').attr('readonly', 'true');
        $('#<%=txtProveedor.ClientID %>').attr('readonly', 'true');
        //$('#<%=txtPropietario.ClientID %>').attr("disabled", "disabled");
        //        $('#<%=txtProveedor.ClientID %>').attr("disabled", "disabled");
    });
    //    $(document).on("pageload", function () {
    //        alert("pageload event fired!");
    //    });
    //    $('body').keyup(function (e) {
    //        $('#<%=txtPropietario.ClientID %>').attr("disabled", "disabled");
    //        $('#<%=txtProveedor.ClientID %>').attr("disabled", "disabled");
    //    });
    function previewImage(event) {
    var input = event.target;
    var preview = document.getElementById('imagePreview');

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            var img = new Image();
            img.src = e.target.result;

            // Redimensionar la imagen a un tamaño pequeño
            var maxWidth = 200;
            var maxHeight = 200;

            img.onload = function () {
                var width = img.width;
                var height = img.height;

                if (width > height) {
                    if (width > maxWidth) {
                        height *= maxWidth / width;
                        width = maxWidth;
                    }
                } else {
                    if (height > maxHeight) {
                        width *= maxHeight / height;
                        height = maxHeight;
                    }
                }

                // Mostrar la imagen en el recuadro
                preview.innerHTML = '<img src="' + img.src + '" style="width: ' + width + 'px; height: ' + height + 'px;" />';
            };
        };

        reader.readAsDataURL(input.files[0]);
    }
    }
    function showPopupImage() {
        var popup = document.getElementById('popupImage');
        popup.src = document.getElementById('imagePreview').getElementsByTagName('img')[0].src;
        popup.style.display = 'block';
    }

    function hidePopupImage() {
        var popup = document.getElementById('popupImage');
        popup.style.display = 'none';
    }
</script>
