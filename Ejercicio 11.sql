CREATE TABLE Paises (
  IDPais INT PRIMARY KEY,
  Nombre VARCHAR(50),
  TipoPais VARCHAR(50),
  IDPaisColonizador INT,
  FOREIGN KEY (IDPaisColonizador) REFERENCES Paises(IDPais)
);

CREATE TABLE Gobiernos (
  IDGobierno INT PRIMARY KEY,
  Nombre VARCHAR(50),
  IDPais INT,
  FOREIGN KEY (IDPais) REFERENCES Paises(IDPais)
);

CREATE TABLE Productos (
  IDProducto INT PRIMARY KEY,
  Codigo VARCHAR(50),
  Nombre VARCHAR(50)
);

CREATE TABLE Comercio (
  IDComercio INT PRIMARY KEY,
  IDPaisOrigen INT,
  IDPaisDestino INT,
  IDProducto INT,
  TipoComercio VARCHAR(50),
  FOREIGN KEY (IDPaisOrigen) REFERENCES Paises(IDPais),
  FOREIGN KEY (IDPaisDestino) REFERENCES Paises(IDPais),
  FOREIGN KEY (IDProducto) REFERENCES Productos(IDProducto)
);

CREATE TABLE Limites (
  IDLimite INT PRIMARY KEY,
  IDPais1 INT,
  IDPais2 INT,
  FOREIGN KEY (IDPais1) REFERENCES Paises(IDPais),
  FOREIGN KEY (IDPais2) REFERENCES Paises(IDPais)
);

CREATE TABLE Rios (
  IDRio INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Caudal DECIMAL(10,2),
  Longitud DECIMAL(10,2),
  TipoRio VARCHAR(50)
);
