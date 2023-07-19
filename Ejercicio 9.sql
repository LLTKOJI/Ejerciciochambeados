
CREATE TABLE Asociaciones (
  IDAsociacion INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100),
  Telefono VARCHAR(20)
);


CREATE TABLE Colonias (
  IDColonia INT PRIMARY KEY,
  Codigo VARCHAR(20),
  Ubicacion VARCHAR(100),
  IDAsociacion INT,
  FOREIGN KEY (IDAsociacion) REFERENCES Asociaciones(IDAsociacion)
);


CREATE TABLE Lideres (
  IDLider INT PRIMARY KEY,
  CI INT,
  Nombre VARCHAR(50),
  Telefono VARCHAR(20)
);

CREATE TABLE Certificaciones (
  IDCertificacion INT PRIMARY KEY,
  IDLider INT,
  Fecha DATE,
  Grado VARCHAR(50),
  IDAsociacion INT,
  FOREIGN KEY (IDLider) REFERENCES Lideres(IDLider),
  FOREIGN KEY (IDAsociacion) REFERENCES Asociaciones(IDAsociacion)
);

CREATE TABLE Actividades (
  IDActividad INT PRIMARY KEY,
  Descripcion VARCHAR(100),
  Tipo VARCHAR(50)
);

CREATE TABLE Coordinacion (
  IDLider INT,
  IDActividad INT,
  IDColonia INT,
  PRIMARY KEY (IDLider, IDActividad, IDColonia),
  FOREIGN KEY (IDLider) REFERENCES Lideres(IDLider),
  FOREIGN KEY (IDActividad) REFERENCES Actividades(IDActividad),
  FOREIGN KEY (IDColonia) REFERENCES Colonias(IDColonia)
);

CREATE TABLE Clientes (
  IDCliente INT PRIMARY KEY,
  NumeroCliente INT,
  Nombre VARCHAR(50),
  CI INT,
  Telefono VARCHAR(20),
  Edad INT,
  IDColonia INT,
  FOREIGN KEY (IDColonia) REFERENCES Colonias(IDColonia)
);

CREATE TABLE ActividadesClientes (
  IDCliente INT,
  IDActividad INT,
  Antiguedad INT,
  FechasCompeticion VARCHAR(100),
  PRIMARY KEY (IDCliente, IDActividad),
  FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
  FOREIGN KEY (IDActividad) REFERENCES Actividades(IDActividad)
);
