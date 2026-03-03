-- 1. Número total de alumnas
SELECT COUNT(*) AS total_alumnas 
FROM persona 
WHERE tipo = 'alumno' AND sexo = 'M';

-- 2. Alumnos nacidos en 1999
SELECT COUNT(*) AS total_alumnos_1999 
FROM persona 
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3. Profesores por departamento
SELECT d.nombre, COUNT(p.id_profesor) AS total_profesores
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY total_profesores DESC;

-- 4. Todos los departamentos
SELECT d.nombre, COUNT(p.id_profesor) AS total_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre;

-- 5. Grados y número de asignaturas
SELECT g.nombre, COUNT(a.id) AS total_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY total_asignaturas DESC;

-- 6. Grados con más de 40 asignaturas
SELECT g.nombre, COUNT(a.id) AS total_asignaturas
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40;

-- 7. Créditos por grado y tipo de asignatura
SELECT g.nombre AS grado, a.tipo, SUM(a.creditos) AS total_creditos
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo
ORDER BY total_creditos DESC;

-- 8. Alumnos matriculados por curso 
SELECT c.anyo_inicio, COUNT(DISTINCT m.id_alumno) AS total_alumnos
FROM curso_escolar c
JOIN alumno_se_matricula_asignatura m ON c.id = m.id_curso_escolar
GROUP BY c.anyo_inicio;

-- 9. Asignaturas por profesor
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS total_asignaturas
FROM persona p
LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE p.tipo = 'profesor'
GROUP BY p.id, p.nombre, p.apellido1, p.apellido2
ORDER BY total_asignaturas DESC;