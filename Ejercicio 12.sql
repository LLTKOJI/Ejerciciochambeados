CREATE TABLE Barcos (
  IDBarco INT PRIMARY KEY,
  Matricula VARCHAR(50),
  Bandera VARCHAR(50),
  Nombre VARCHAR(50),
  Tonelaje DECIMAL(10,2),
  Calado DECIMAL(10,2),
  FechaBotadura DATE
);

CREATE TABLE BarcosPasajeros (
  IDBarco INT PRIMARY KEY,
  CantidadPasajeros INT,
  FOREIGN KEY (IDBarco) REFERENCES Barcos(IDBarco)
);

CREATE TABLE BarcosPesca (
  IDBarco INT PRIMARY KEY,
  TipoBarco VARCHAR(50),
  FOREIGN KEY (IDBarco) REFERENCES Barcos(IDBarco)
);

CREATE TABLE BarcosCarga (
  IDBarco INT PRIMARY KEY,
  CapacidadCarga DECIMAL(10,2),
  FOREIGN KEY (IDBarco) REFERENCES Barcos(IDBarco)
);

CREATE TABLE ZonasPesca (
  IDZonaPesca INT PRIMARY KEY,
  Codigo VARCHAR(50),
  FOREIGN KEY (IDZonaPesca) REFERENCES BarcosPesca(IDBarco)
);

CREATE TABLE Coordenadas (
  IDCoordenada INT PRIMARY KEY,
  Latitud DECIMAL(9,6),
  Longitud DECIMAL(9,6),
  IDZonaPesca INT,
  FOREIGN KEY (IDZonaPesca) REFERENCES ZonasPesca(IDZonaPesca)
);

CREATE TABLE EspeciesPermitidas (
  IDEspecie INT PRIMARY KEY,
  Nombre VARCHAR(50),
  IDZonaPesca INT,
  FOREIGN KEY (IDZonaPesca) REFERENCES ZonasPesca(IDZonaPesca)
);

CREATE TABLE Puertos (
  IDPuerto INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Pais VARCHAR(50),
  Profundidad DECIMAL(10,2),
  TiposGruas VARCHAR(100),
  CapacidadBarcos INT,
  TipoAgua VARCHAR(20)
);

CREATE TABLE MovimientosCarga (
  IDMovimiento INT PRIMARY KEY,
  IDBarco INT,
  IDPuerto INT,
  FechaMovimiento DATE,
  CantidadCarga INT,
  CantidadDescarga INT,
  FOREIGN KEY (IDBarco) REFERENCES BarcosCarga(IDBarco),
  FOREIGN KEY (IDPuerto) REFERENCES Puertos(IDPuerto)
);

CREATE TABLE Mercaderias (
  IDMecaderia INT PRIMARY KEY,
  Codigo VARCHAR(50),
  Unidad VARCHAR(50),
  PesoMetroCubico DECIMAL(10,2)
);

CREATE TABLE PuertosZonasPesca (
  IDPuerto INT,
  IDZonaPesca INT,
  FOREIGN KEY (IDPuerto) REFERENCES Puertos(IDPuerto),
  FOREIGN KEY (IDZonaPesca) REFERENCES ZonasPesca(IDZonaPesca)
);

CREATE TABLE DistanciasPuertos (
  IDDistancia INT PRIMARY KEY,
  IDPuertoOrigen INT,
  IDPuertoDestino INT,
  Distancia DECIMAL(10,2),
  FOREIGN KEY (IDPuertoOrigen) REFERENCES Puertos(IDPuerto),
  FOREIGN KEY (IDPuertoDestino) REFERENCES Puertos(IDPuerto)
);
