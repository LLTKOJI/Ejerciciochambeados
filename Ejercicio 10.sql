CREATE TABLE Locales (
  IDLocal INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Ciudad VARCHAR(50),
  Calle VARCHAR(50),
  Numero VARCHAR(10)
);

CREATE TABLE Consultorios (
  IDConsultorio INT PRIMARY KEY,
  Numero INT,
  IDLocal INT,
  FOREIGN KEY (IDLocal) REFERENCES Locales(IDLocal)
);

CREATE TABLE Equipamiento (
  IDEquipamiento INT PRIMARY KEY,
  NumeroSerie VARCHAR(50),
  Tipo VARCHAR(50),
  UltimaFechaMantenimiento DATE
);

CREATE TABLE AfiliadosIndividuales (
  IDAfiliadoIndividual INT PRIMARY KEY,
  CI INT,
  Nombre VARCHAR(50),
  Telefono VARCHAR(20)
);

CREATE TABLE AfiliadosGrupales (
  IDAfiliadoGrupal INT PRIMARY KEY,
  NombreConvenio VARCHAR(50),
  PorcentajeRebaja DECIMAL(5,2)
);

CREATE TABLE PlanesAfiliacion (
  IDPlanAfiliacion INT PRIMARY KEY,
  IDAfiliadoIndividual INT,
  IDAfiliadoGrupal INT,
  FOREIGN KEY (IDAfiliadoIndividual) REFERENCES AfiliadosIndividuales(IDAfiliadoIndividual),
  FOREIGN KEY (IDAfiliadoGrupal) REFERENCES AfiliadosGrupales(IDAfiliadoGrupal)
);

CREATE TABLE Tratamientos (
  IDTratamiento INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Costo DECIMAL(10,2)
);

CREATE TABLE Odontologos (
  IDOdontologo INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Especialidad VARCHAR(50)
);

CREATE TABLE HorariosAtencion (
  IDHorario INT PRIMARY KEY,
  DiaSemana VARCHAR(20),
  HoraComienzo TIME,
  HoraFinalizacion TIME
);

CREATE TABLE Atencion (
  IDAtencion INT PRIMARY KEY,
  IDAfiliadoIndividual INT,
  IDOdontologo INT,
  IDLocal INT,
  IDHorario INT,
  FOREIGN KEY (IDAfiliadoIndividual) REFERENCES AfiliadosIndividuales(IDAfiliadoIndividual),
  FOREIGN KEY (IDOdontologo) REFERENCES Odontologos(IDOdontologo),
  FOREIGN KEY (IDLocal) REFERENCES Locales(IDLocal),
  FOREIGN KEY (IDHorario) REFERENCES HorariosAtencion(IDHorario)
);

CREATE TABLE TratamientosRealizados (
  IDTratamiento INT,
  IDAtencion INT,
  FechaInicio DATE,
  Finalizado	BIT,
  IDOdontologo INT,
  PRIMARY KEY (IDTratamiento, IDAtencion),
  FOREIGN KEY (IDTratamiento) REFERENCES Tratamientos(IDTratamiento),
  FOREIGN KEY (IDAtencion) REFERENCES Atencion(IDAtencion),
  FOREIGN KEY (IDOdontologo) REFERENCES Odontologos(IDOdontologo)
);

CREATE TABLE HistoriasClinicas (
  IDHistoriaClinica INT PRIMARY KEY,
  IDAfiliadoIndividual INT,
  IDAtencion INT,
  IDTratamiento INT,
  FOREIGN KEY (IDAfiliadoIndividual) REFERENCES AfiliadosIndividuales(IDAfiliadoIndividual),
  FOREIGN KEY (IDAtencion) REFERENCES Atencion(IDAtencion),
  FOREIGN KEY (IDTratamiento) REFERENCES Tratamientos(IDTratamiento)
);

CREATE TABLE CuentasCorrientes (
  IDCuentaCorriente INT PRIMARY KEY,
  IDAfiliadoIndividual INT,
  Saldo DECIMAL(10,2),
  FOREIGN KEY (IDAfiliadoIndividual) REFERENCES AfiliadosIndividuales(IDAfiliadoIndividual)
);
