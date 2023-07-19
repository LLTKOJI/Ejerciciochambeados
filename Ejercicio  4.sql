-- Tabla de empresas
CREATE TABLE Empresas (
  IDEMPRESA INT PRIMARY KEY,
  NOMBRE VARCHAR(50)
);

-- Tabla de productos
CREATE TABLE Productos (
  IDPRODUCTO INT PRIMARY KEY,
  IDEMPRESA INT,
  IDPROMOTOR INT,
  NOMBRE VARCHAR(50),
  FOREIGN KEY (IDEMPRESA) REFERENCES Empresas(IDEMPRESA),
  FOREIGN KEY (IDPROMOTOR) REFERENCES Promotores(IDPROMOTOR)
);

-- Tabla de promotores
CREATE TABLE Promotores (
  IDPROMOTOR INT PRIMARY KEY,
  IDEMPRESA INT,
  NOMBRE VARCHAR(50),
  FOREIGN KEY (IDEMPRESA) REFERENCES Empresas(IDEMPRESA)
);

-- Restricción para asegurar que todos los productos tienen un promotor asociado
ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Promotores
FOREIGN KEY (IDPROMOTOR) REFERENCES Promotores(IDPROMOTOR)
NOT NULL;
