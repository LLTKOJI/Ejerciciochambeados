CREATE TABLE Hospitales (
  IDHospital INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100),
  Telefono VARCHAR(20),
  CantidadCamas INT
);

CREATE TABLE Salas (
  IDSala INT PRIMARY KEY,
  IDHospital INT,
  Nombre VARCHAR(50),
  CantidadCamas INT,
  FOREIGN KEY (IDHospital) REFERENCES Hospitales(IDHospital)
);

CREATE TABLE Medicos (
  CedulaIdentidad VARCHAR(20) PRIMARY KEY,
  IDHospital INT,
  Nombre VARCHAR(50),
  Especialidad VARCHAR(50),
  FOREIGN KEY (IDHospital) REFERENCES Hospitales(IDHospital)
);

CREATE TABLE Laboratorios (
  IDLaboratorio INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100),
  Telefono VARCHAR(20)
);

CREATE TABLE ServiciosLaboratorio (
  IDServicio INT PRIMARY KEY,
  IDHospital INT,
  IDLaboratorio INT,
  Descripcion VARCHAR(100),
  FechaRealizacion DATE,
  FOREIGN KEY (IDHospital) REFERENCES Hospitales(IDHospital),
  FOREIGN KEY (IDLaboratorio) REFERENCES Laboratorios(IDLaboratorio)
);

CREATE TABLE Pacientes (
  CedulaIdentidad VARCHAR(20) PRIMARY KEY,
  NumeroRegistro INT,
  IDSala INT,
  NumeroCama INT,
  Nombre VARCHAR(50),
  Direccion VARCHAR(100),
  FechaNacimiento DATE,
  Sexo VARCHAR(10),
  FOREIGN KEY (IDSala) REFERENCES Salas(IDSala)
);

CREATE TABLE AtencionesMedicas (
  CedulaIdentidadPaciente VARCHAR(20),
  CedulaIdentidadMedico VARCHAR(20),
  FechaAtencion DATE,
  FOREIGN KEY (CedulaIdentidadPaciente) REFERENCES Pacientes(CedulaIdentidad),
  FOREIGN KEY (CedulaIdentidadMedico) REFERENCES Medicos(CedulaIdentidad)
);

CREATE TABLE Diagnosticos (
  IDDiagnostico INT PRIMARY KEY,
  CedulaIdentidadPaciente VARCHAR(20),
  FechaDiagnostico DATE,
  Tipo VARCHAR(50),
  Complicaciones VARCHAR(100),
  FOREIGN KEY (CedulaIdentidadPaciente) REFERENCES Pacientes(CedulaIdentidad)
);
