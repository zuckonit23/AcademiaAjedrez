-- Insertar profesores en la tabla Usuario
INSERT INTO Usuario (username, password, tipoUsuario) VALUES
('juan_prof', 'passjuan', 'Profesor'),
('roman_prof', 'passroman', 'Profesor');

-- Insertar profesores en la tabla Profesor
-- Supongamos que los idUsuario generados son 1 y 2
INSERT INTO Profesor (idProfesor, nombreCompleto, correoElectronico, experiencia) VALUES
(1, 'Juan Gómez', 'juan.gomez@academia.com', 12),
(2, 'Román Díaz', 'roman.diaz@academia.com', 9);

-- Insertar alumnos en la tabla Usuario
INSERT INTO Usuario (username, password, tipoUsuario) VALUES
('francisco_alum', 'passfrancisco', 'Alumno'),
('esteban_alum', 'passesteban', 'Alumno');

-- Insertar alumnos en la tabla Alumno
-- Supongamos que los idUsuario generados son 3 y 4
INSERT INTO Alumno (idAlumno, nombreCompleto, edad, eloFIDE, eloVirtual, fechaIngreso, idProfesor) VALUES
(3, 'Francisco Pérez', 16, 1250, 1300, '2023-01-10', 1),
(4, 'Esteban Ruiz', 18, 1350, 1400, '2023-01-15', 2);

-- Insertar torneos en la tabla Torneo
INSERT INTO Torneo (nombre, ritmoDeJuego, categoria, fechaInicio, fechaFin, ubicacion) VALUES
('Torneo Otoño', 'Clásico', 'Juvenil', '2023-02-01', '2023-02-05', 'Sevilla'),
('Torneo Invierno', 'Rapid', 'Adulto', '2023-03-10', '2023-03-12', 'Valencia');

-- Registrar la participación de Francisco y Esteban en sus respectivos torneos
INSERT INTO ParticipacionTorneo (idAlumno, idTorneo) VALUES
(3, 1),  -- Francisco participa en el Torneo Otoño
(4, 2);  -- Esteban participa en el Torneo Invierno

-- Insertar partidas jugadas por Francisco y Esteban
INSERT INTO Partida (idAlumno, jugadorBlancas, jugadorNegras, resultado, movimientos, fecha) VALUES
(3, 'Francisco Pérez', 'Rival C', '1-0', '1.e4 e5 2.Nf3 Nc6 3.Bc4 Bc5...', '2023-02-02'),
(4, 'Esteban Ruiz', 'Rival D', '0-1', '1.d4 Nf6 2.c4 g6 3.Nc3 d5...', '2023-03-11');

-- Insertar análisis realizados por los profesores Juan y Román
INSERT INTO Analisis (idPartida, idProfesor, fecha, comentarios, sugerencias) VALUES
(1, 1, '2023-02-03', 'Excelente control del centro, sigue así.', 'Practicar finales de partida.'),
(2, 2, '2023-03-12', 'Debes mejorar en aperturas, especialmente contra la Defensa Grunfeld.', 'Estudiar variantes contra Nf6.');
