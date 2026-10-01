CREATE DATABASE sistema_tiendas;
USE sistema_tiendas;

CREATE TABLE Tiendas (
    id_tienda INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tienda VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100)
);

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20)
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    id_categoria INT, 
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE Inventarios (
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_tienda INT,   
    id_producto INT, 
    cantidad_en_stock INT,
    FOREIGN KEY (id_tienda) REFERENCES Tiendas(id_tienda),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT, 
    id_tienda INT,    
    fecha_pedido DATE,
    estado_pedido VARCHAR(50),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
    FOREIGN KEY (id_tienda) REFERENCES Tiendas(id_tienda)
);