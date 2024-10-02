-- Crear la tabla Usuario (Clase abstracta)
CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    tipoUsuario ENUM('Profesor', 'Alumno') NOT NULL
);

-- Crear la tabla Profesor (Hereda de Usuario)
CREATE TABLE Profesor (
    idProfesor INT PRIMARY KEY,
    nombreCompleto VARCHAR(100) NOT NULL,
    correoElectronico VARCHAR(100) NOT NULL,
    experiencia INT NOT NULL,
    FOREIGN KEY (idProfesor) REFERENCES Usuario(idUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla Alumno (Hereda de Usuario y relaciona con Profesor)
CREATE TABLE Alumno (
    idAlumno INT PRIMARY KEY,
    nombreCompleto VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    eloFIDE INT,
    eloVirtual INT,
    fechaIngreso DATE NOT NULL,
    idProfesor INT NOT NULL,
    FOREIGN KEY (idAlumno) REFERENCES Usuario(idUsuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla Torneo
CREATE TABLE Torneo (
    idTorneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ritmoDeJuego ENUM('Blitz', 'Rapid', 'Clásico') NOT NULL,
    categoria ENUM('Infantil', 'Juvenil', 'Adulto') NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    ubicacion VARCHAR(100) NOT NULL
);

-- Crear la tabla PlanEntrenamiento
CREATE TABLE PlanEntrenamiento (
    idPlan INT AUTO_INCREMENT PRIMARY KEY,
    idProfesor INT NOT NULL,
    fechaCreacion DATE NOT NULL,
    objetivos TEXT NOT NULL,
    actividades TEXT NOT NULL,
    FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla ModuloEntrenamiento
CREATE TABLE ModuloEntrenamiento (
    idModulo INT AUTO_INCREMENT PRIMARY KEY,
    idPlan INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    nivelDificultad ENUM('Fácil', 'Medio', 'Difícil') NOT NULL,
    FOREIGN KEY (idPlan) REFERENCES PlanEntrenamiento(idPlan)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla Partida
CREATE TABLE Partida (
    idPartida INT AUTO_INCREMENT PRIMARY KEY,
    idAlumno INT NOT NULL,
    jugadorBlancas VARCHAR(100) NOT NULL,
    jugadorNegras VARCHAR(100) NOT NULL,
    resultado VARCHAR(10) NOT NULL,
    movimientos TEXT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla Analisis
CREATE TABLE Analisis (
    idAnalisis INT AUTO_INCREMENT PRIMARY KEY,
    idPartida INT NOT NULL,
    idProfesor INT NOT NULL,
    fecha DATE NOT NULL,
    comentarios TEXT,
    sugerencias TEXT,
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idProfesor) REFERENCES Profesor(idProfesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla ParticipacionTorneo (Relación Muchos a Muchos entre Alumno y Torneo)
CREATE TABLE ParticipacionTorneo (
    idAlumno INT NOT NULL,
    idTorneo INT NOT NULL,
    PRIMARY KEY (idAlumno, idTorneo),
    FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idTorneo) REFERENCES Torneo(idTorneo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla AlumnoPlan (Relación Muchos a Muchos entre Alumno y PlanEntrenamiento)
CREATE TABLE AlumnoPlan (
    idAlumno INT NOT NULL,
    idPlan INT NOT NULL,
    PRIMARY KEY (idAlumno, idPlan),
    FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idPlan) REFERENCES PlanEntrenamiento(idPlan)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Crear la tabla AlumnoModulo (Relación Muchos a Muchos entre Alumno y ModuloEntrenamiento)
CREATE TABLE AlumnoModulo (
    idAlumno INT NOT NULL,
    idModulo INT NOT NULL,
    PRIMARY KEY (idAlumno, idModulo),
    FOREIGN KEY (idAlumno) REFERENCES Alumno(idAlumno)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (idModulo) REFERENCES ModuloEntrenamiento(idModulo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
