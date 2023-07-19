CREATE TABLE Clientes (
  IDCliente INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100),
  RUC VARCHAR(50)
);

CREATE TABLE EmpleadosAutorizados (
  IDEmpleado INT PRIMARY KEY,
  IDCliente INT,
  Nombre VARCHAR(50),
  FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);

CREATE TABLE Pedidos (
  IDPedido INT PRIMARY KEY,
  IDCliente INT,
  NumeroPedido INT,
  FechaPedido DATE,
  FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);

CREATE TABLE Cortes (
  IDCorte INT PRIMARY KEY,
  Nombre VARCHAR(50),
  FOREIGN KEY (IDCorte) REFERENCES Cortes(IDCorte)
);

CREATE TABLE PedidosCortes (
  IDPedido INT,
  IDCorte INT,
  NumeroPiezas INT,
  PesoTotal DECIMAL(10,2),
  FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido),
  FOREIGN KEY (IDCorte) REFERENCES Cortes(IDCorte)
);

CREATE TABLE Distribuidores (
  IDDistribuidor INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100)
);

CREATE TABLE ClientesDistribuidores (
  IDCliente INT,
  IDDistribuidor INT,
  FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
  FOREIGN KEY (IDDistribuidor) REFERENCES Distribuidores(IDDistribuidor)
);

CREATE TABLE Entregas (
  IDEntrega INT PRIMARY KEY,
  IDPedido INT,
  IDDistribuidor INT,
  NumeroEntrega INT,
  FechaEntrega DATE,
  FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido),
  FOREIGN KEY (IDDistribuidor) REFERENCES Distribuidores(IDDistribuidor)
);

CREATE TABLE PiezasCarne (
  IDPieza INT PRIMARY KEY,
  IDEntrega INT,
  IDCorte INT,
  NumeroPiezas INT,
  PesoTotal DECIMAL(10,2),
  FOREIGN KEY (IDEntrega) REFERENCES Entregas(IDEntrega),
  FOREIGN KEY (IDCorte) REFERENCES Cortes(IDCorte)
);
