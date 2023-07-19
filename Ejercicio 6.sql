CREATE TABLE Personas (
  IDPersona INT PRIMARY KEY,
  CI INT,
  Nombre VARCHAR(50),
  RestauranteFrecuente VARCHAR(50)
);


CREATE TABLE Restaurantes (
  IDRestaurante INT PRIMARY KEY,
  Nombre VARCHAR(50)
);

CREATE TABLE Comidas (
  IDComida INT PRIMARY KEY,
  Nombre VARCHAR(50),
  TiempoPreparacion INT,
  Ingredientes VARCHAR(100),
  IDRestaurante INT,
  FOREIGN KEY (IDRestaurante) REFERENCES Restaurantes(IDRestaurante)
);


CREATE TABLE Preferencias (
  IDPreferencia INT PRIMARY KEY,
  IDPersona INT,
  IDComida INT,
  IDRestaurante INT,
  FOREIGN KEY (IDPersona) REFERENCES Personas(IDPersona),
  FOREIGN KEY (IDComida) REFERENCES Comidas(IDComida),
  FOREIGN KEY (IDRestaurante) REFERENCES Restaurantes(IDRestaurante)
);


ALTER TABLE Comidas
ADD CONSTRAINT CK_Restaurantes_Comidas
CHECK ((SELECT COUNT(*) FROM Comidas WHERE IDRestaurante = Restaurantes.IDRestaurante) <= 10);
