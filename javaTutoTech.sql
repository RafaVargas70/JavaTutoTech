--ROLE--------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbROLE (
idRole NUMBER GENERATED AS IDENTITY START WITH 1 INCREMENT BY 1 PRIMARY KEY,
nombreRole VARCHAR2(25) NOT NULL  CHECK (nombreRole IN ('admin', 'tutor', 'tutorado'))
);

-- Insercion de datos en la tabla tbROLE
INSERT INTO tbROLE (nombreRole) VALUES ('admin');
INSERT INTO tbROLE (nombreRole) VALUES ('tutor');
INSERT INTO tbROLE (nombreRole) VALUES ('tutorado');
 
select * from tbROLE;
drop table tbROLE;
delete from tbROLE;
 
--USUARIO--------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbUsuario (
idUsuario VARCHAR2(100) PRIMARY KEY,
nombreUsuario VARCHAR2(15) NOT NULL,
edadUsuario INT NOT NULL,
correoUsuario VARCHAR2(200) NOT NULL unique,
contrasenaUsuario VARCHAR2(100) NOT NULL,
fotoUsuario varchar2(1000), -- Foto de perfil
idRole NUMBER NOT NULL,
 
CONSTRAINT FK_Role FOREIGN KEY (idRole) REFERENCES tbROLE(idRole)
);

-- Inserciones a la tabla tbUsuario
INSERT INTO tbUsuario (idUsuario, nombreUsuario, edadUsuario, correoUsuario, contrasenaUsuario, fotoUsuario, idRole) 
VALUES ('asosdsdusado', 'Juan Perez', 20, '20220721@ricaldone.edu.sv', 'contrasena123', null, 1);
INSERT INTO tbUsuario (idUsuario, nombreUsuario, edadUsuario, correoUsuario, contrasenaUsuario, fotoUsuario, idRole) 
VALUES ('ddfgdfbcvbfg', 'Pedro Lopez', 29, 'pedrolopez@gmail.com', 'contrasena124', null, 2);
INSERT INTO tbUsuario (idUsuario, nombreUsuario, edadUsuario, correoUsuario, contrasenaUsuario, fotoUsuario, idRole) 
VALUES ('lkjilgvnyjhn', 'Pepe Diaz', 42, 'pepediaz@gmail.com', 'contrasena125', null, 2);
INSERT INTO tbUsuario (idUsuario, nombreUsuario, edadUsuario, correoUsuario, contrasenaUsuario, fotoUsuario, idRole) 
VALUES ('fbncsvbffgdf', 'Juan Gonzalez', 16, 'juangonzalez@gmail.com', 'contrasena126', null, 3);
INSERT INTO tbUsuario (idUsuario, nombreUsuario, edadUsuario, correoUsuario, contrasenaUsuario, fotoUsuario, idRole) 
VALUES ('jmdfbbtygnfg', 'Pago Gomez', 17, 'pacogomez@gmail.com', 'contrasena127', null, 3);

update tbUsuario set contrasenaUsuario = 'fe3a646a168c88a7ad70522485aed3c74d0cb7223bf5a5274d26c8a09f743e7b' where correoUsuario = '20220721@ricaldone.edu.sv'
commit

select * from tbUsuario;
drop table tbUsuario;
delete from tbUsuario;

--TUTORIA--------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbTutoria (
idTutoria VARCHAR2(100) PRIMARY KEY,
nombreTutoria VARCHAR2(50) NOT NULL,
descripcionTutoria VARCHAR2(200) NOT NULL,
imagenTutoria varchar2(1000), -- Foto de la tutoria
idUsuario VARCHAR2(100),
 
CONSTRAINT FK_Usuario FOREIGN KEY (idUsuario) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
);


-- Inserciones a la tabla tbTutoria
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria)
VALUES ('sfsdssdvsd', 'Tutor?a de Matem?ticas', 'En esta tutoria aprenderas sobre algebra');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('sdvsdvsdvd', 'Tutor?a de F?sica', 'En esta tutoria aprenderas sobre conceptos b?sicos de la f?sica', NULL, 'ddfgdfbcvbfg');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('mhgnhnmda3', 'Tutor?a de Qu?mica', 'En esta tutoria aprenderas sobre conceptos b?sicos de la qu?mica', NULL, 'lkjilgvnyjhn');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('k-kgkjutyj', 'Tutor?a de Historia', 'En esta tutoria aprenderas sobre periodos de tiempo', NULL, 'fbncsvbffgdf');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('fghyujujut', 'Tutor?a de Literatura', 'En esta tutoria aprenderas sobre conceptos obras literarias', NULL, 'jmdfbbtygnfg');
 
select * from tbTutoria;
drop table tbTutoria;
delete from tbTutoria;



--LECCION-------------------------------------------------------------------------------------------------------------------------------------------------- 
CREATE TABLE tbLeccion (
idLeccion VARCHAR2(100) PRIMARY KEY,
tituloLeccion VARCHAR2(100) NOT NULL,
fechaLeccion DATE NOT NULL,
contenidoLeccion VARCHAR2(2000) NOT NULL,
statusLeccion NUMBER(1) NOT NULL  CHECK (statusLeccion IN (0,1)),
idTutoria VARCHAR2(100) NOT NULL,
 
CONSTRAINT FK_Tutoria FOREIGN KEY (idTutoria) REFERENCES tbTutoria(idTutoria)
);
 
--Inserciones a la tabla tbLeccion
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno1', 'Introducci?n a Matem?ticas', TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Contenido de la lecci?n de introducci?n a matem?ticas.', 1, 'sfsdssdvsd');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno2', 'F?sica B?sica', TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'Contenido de la lecci?n de f?sica b?sica.', 1, 'sdvsdvsdvd');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno3', 'Qu?mica Org?nica', TO_DATE('2024-07-03', 'YYYY-MM-DD'), 'Contenido de la lecci?n de qu?mica org?nica.', 1, 'mhgnhnmda3');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno4', 'Historia Mundial', TO_DATE('2024-07-04', 'YYYY-MM-DD'), 'Contenido de la lecci?n de historia mundial.', 1, 'k-kgkjutyj');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno5', 'Literatura Cl?sica', TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Contenido de la lecci?n de literatura cl?sica.', 1, 'fghyujujut');
 
select * from tbLeccion;
drop table tbLeccion;
delete from tbLeccion;

--RECORDATORIO--------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbRecordatorio (
idRecordatorio VARCHAR2(100) PRIMARY KEY,
idLeccion VARCHAR2(100) NOT NULL,
 
CONSTRAINT FK_Leccion FOREIGN KEY (idLeccion) REFERENCES tbLeccion(idLeccion)
);
 
-- Inserciones a la tabla tbRecordatorio
INSERT INTO tbRecordatorio (idRecordatorio, idLeccion) VALUES ('Cosa1', 'Relleno1');
INSERT INTO tbRecordatorio (idRecordatorio, idLeccion) VALUES ('Cosa2', 'Relleno2');
INSERT INTO tbRecordatorio (idRecordatorio, idLeccion) VALUES ('Cosa3', 'Relleno3');
INSERT INTO tbRecordatorio (idRecordatorio, idLeccion) VALUES ('Cosa4', 'Relleno4');
INSERT INTO tbRecordatorio (idRecordatorio, idLeccion) VALUES ('Cosa5', 'Relleno5');
 
select * from tbRecordatorio;
drop table tbRecordatorio;
delete from tbRecordatorio;
 
--Uni?n de las tablas tbUsuario y tbTutor?a en una sola tabla donde el idRole representa a los tutores
SELECT  u.nombreUsuario,  u.correoUsuario,  tu.nombreTutoria, tu.descripcionTutoria,  tu.imagenTutoria 
FROM  tbUsuario u INNER JOIN  tbTutoria tu ON u.idUsuario = tu.idUsuario WHERE u.idRole = 2;
 
--Uni?n de las tablas tbLeccion y tbRecordatorio en una sola tabla
SELECT l.tituloLeccion, l.fechaLeccion, l.contenidoLeccion, l.statusLeccion, r.idRecordatorio
FROM tbLeccion l INNER JOIN tbrecordatorio r ON l.idLeccion = r.idLeccion;
 
--Prueba con left join usando tbUsuario y tbTutorado 
--(Supongamos que quieres obtener una lista de todos los tutorados y sus tutor?as, incluyendo 
--aquellos tutorados que no tienen tutor?as asignadas.)
SELECT u.nombreUsuario, tu.nombreTutoria
FROM tbUsuario u LEFT JOIN  tbTutoria tu ON u.idUsuario = tu.idUsuario WHERE u.idRole = 3;
 
--Prueba con right join usando tbUsuario y tbTutorado 
--(Supongamos que quieres obtener una lista de todas las tutor?as y los tutorados asignados a ellas,
--incluyendo aquellas tutor?as que no tienen tutorados asignados.)
SELECT u.nombreUsuario, tu.nombreTutoria
FROM tbUsuario u RIGHT JOIN tbTutoria tu ON tu.idUsuario = u.idUsuario WHERE u.idRole = 3;
 
