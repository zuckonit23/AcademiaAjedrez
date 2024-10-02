-- Consultar los profesores y los alumnos asignados a cada uno
SELECT
    p.nombreCompleto AS Profesor,
    a.nombreCompleto AS Alumno
FROM
    Profesor p
INNER JOIN
    Alumno a ON p.idProfesor = a.idProfesor
ORDER BY
    p.nombreCompleto;

-- Consultar las partidas jugadas por Francisco y Esteban
SELECT
    a.nombreCompleto AS Alumno,
    p.jugadorBlancas,
    p.jugadorNegras,
    p.resultado,
    p.fecha
FROM
    Partida p
INNER JOIN
    Alumno a ON p.idAlumno = a.idAlumno
WHERE
    a.nombreCompleto IN ('Francisco Pérez', 'Esteban Ruiz');

-- Consultar los análisis realizados por los profesores
SELECT
    pr.nombreCompleto AS Profesor,
    al.nombreCompleto AS Alumno,
    an.fecha,
    an.comentarios,
    an.sugerencias
FROM
    Analisis an
INNER JOIN
    Profesor pr ON an.idProfesor = pr.idProfesor
INNER JOIN
    Partida pa ON an.idPartida = pa.idPartida
INNER JOIN
    Alumno al ON pa.idAlumno = al.idAlumno
WHERE
    al.nombreCompleto IN ('Francisco Pérez', 'Esteban Ruiz');

-- Consultar los alumnos y los torneos en los que participan
SELECT
    al.nombreCompleto AS Alumno,
    t.nombre AS Torneo,
    t.fechaInicio,
    t.fechaFin,
    t.ubicacion
FROM
    ParticipacionTorneo pt
INNER JOIN
    Alumno al ON pt.idAlumno = al.idAlumno
INNER JOIN
    Torneo t ON pt.idTorneo = t.idTorneo
WHERE
    al.nombreCompleto IN ('Francisco Pérez', 'Esteban Ruiz')
ORDER BY
    al.nombreCompleto;
