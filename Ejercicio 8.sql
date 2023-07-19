-- Tabla de llamados
CREATE TABLE Llamados (
  IDLlamado INT PRIMARY KEY,
  Numero INT,
  Descripcion VARCHAR(100),
  FechaAparicion DATE,
  FechaLimite DATE,
  EmpresaNombre VARCHAR(100),
  FiguraEnAviso BIT,
  InstitucionNombre VARCHAR(100),
  InstitutoOficina VARCHAR(100)
);

-- Tabla de estudiantes
CREATE TABLE Estudiantes (
  IDEstudiante INT PRIMARY KEY,
  CI INT,
  Nombre VARCHAR(50),
  FechaNacimiento DATE,
  Direccion VARCHAR(100),
  Email VARCHAR(50),
  Curriculum VARCHAR(1000),
  Telefono VARCHAR(20),
  CarreraAvanzada VARCHAR(50)
);

-- Tabla de inscripciones a los llamados
CREATE TABLE Inscripciones (
  IDEstudiante INT,
  IDLlamado INT,
  FechaInscripcion DATE,
  PRIMARY KEY (IDEstudiante, IDLlamado),
  FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
  FOREIGN KEY (IDLlamado) REFERENCES Llamados(IDLlamado)
);

-- Tabla de resultados de los llamados
CREATE TABLE Resultados (
  IDResultado INT PRIMARY KEY,
  IDLlamado INT,
  IDEstudiante INT,
  MotivoDesierto VARCHAR(200),
  FOREIGN KEY (IDLlamado) REFERENCES Llamados(IDLlamado),
  FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante)
);
