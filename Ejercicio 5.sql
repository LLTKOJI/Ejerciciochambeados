-- Tabla de personas
CREATE TABLE Personas (
  IDPersona INT PRIMARY KEY,
  Nombre VARCHAR(50)
);

-- Tabla de parentesco
CREATE TABLE Parentesco (
  IDPadre INT,
  IDHijo INT,
  Relacion VARCHAR(50),
  FOREIGN KEY (IDPadre) REFERENCES Personas(IDPersona),
  FOREIGN KEY (IDHijo) REFERENCES Personas(IDPersona)
);
