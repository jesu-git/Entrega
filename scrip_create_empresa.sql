CREATE SCHEMA empresa;
USE empresa;

CREATE TABLE clientes(
 n_cliente INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 dni INT NOT NULL,
 email VARCHAR(50),
 PRIMARY KEY(n_cliente));
 
CREATE TABLE  sectores(
 n_sector INT NOT NULL auto_increment,
 nombre VARCHAR(50),
 PRIMARY KEY(n_sector));
 
 
CREATE TABLE   empleados(
 n_empleado INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 DNI INT NOT NULL,
 n_sector INT NOT NULL,
 email VARCHAR(50),
 PRIMARY KEY(n_empleado),
 FOREIGN KEY(n_sector) REFERENCES sectores(n_sector));
 
CREATE TABLE  productos(
 n_producto INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 precio INT NOT NULL,
 n_proeevedor INT NOT NULL,
 PRIMARY KEY(n_producto));
 
CREATE TABLE proveedores(
 n_proveedor INT NOT NULL auto_increment,
 nombre VARCHAR(30) NOT NULL,
 n_producto INT NOT NULL,
 PRIMARY KEY(n_proveedor),
 FOREIGN KEY(n_producto)REFERENCES productos(n_producto));
 
CREATE TABLE  stock(
 n_producto INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(30) NOT NULL,
 cantidad INT NOT NULL,
 vencimiento DATETIME,
 n_proveedor INT NOT NULL,
 PRIMARY KEY(n_producto,n_proveedor),
 FOREIGN KEY(n_producto) REFERENCES productos(n_producto),
 FOREIGN KEY(n_proveedor)REFERENCES proveedores(n_proveedor));
 
CREATE TABLE  pedidos(
 n_pedido INT NOT NULL AUTO_INCREMENT,
 n_cliente INT NOT NULL,
 n_producto INT NOT NULL,
 fecha_hora DATETIME,
 PRIMARY KEY(n_pedido),
 FOREIGN KEY(n_cliente) REFERENCES clientes(n_cliente),
 FOREIGN KEY(n_producto)REFERENCES productos(n_producto));
 
CREATE TABLE ventas(
 n_venta INT NOT NULL AUTO_INCREMENT,
 n_empleado INT NOT NULL,
 n_pedido INT NOT NULL,
 n_cliente INT NOT NULL,
 fecha_hora DATETIME,
 PRIMARY KEY(n_venta),
 FOREIGN KEY(n_pedido) REFERENCES pedidos(n_pedido),
 FOREIGN KEY(n_empleado) REFERENCES empleados(n_empleado),
 FOREIGN KEY(n_cliente) REFERENCES clientes(n_cliente));
  
CREATE TABLE  decomisos(
 n_decomiso INT NOT NULL AUTO_INCREMENT,
 n_empleado INT NOT NULL,
 cantidad INT NOT NULL,
 motivo VARCHAR(250) NOT NULL,
 n_producto INT NOT NULL,
 fecha_hora DATETIME,
 PRIMARY KEY(n_decomiso),
 FOREIGN KEY(n_empleado) REFERENCES empleados(n_empleado),
 FOREIGN KEY(n_producto) REFERENCES productos(n_producto));
 
CREATE TABLE  ingresos(
 n_ingreso INT NOT NULL AUTO_INCREMENT,
 n_empleado INT NOT NULL,
 n_proveedor INT NOT NULL,
 n_producto INT NOT NULL,
 cantidad INT NOT NULL,
 fecha_hora DATETIME,
 PRIMARY KEY(n_ingreso),
 FOREIGN KEY(n_empleado) REFERENCES empleados(n_empleado),
 FOREIGN KEY(n_proveedor) REFERENCES proveedores(n_proveedor),
 FOREIGN KEY(n_producto) REFERENCES productos(n_producto));