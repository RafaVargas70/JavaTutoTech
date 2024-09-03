--TABLA ROLE--------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbROLE (
idRole NUMBER GENERATED AS IDENTITY START WITH 1 INCREMENT BY 1 PRIMARY KEY,
nombreRole VARCHAR2(25) NOT NULL  CHECK (nombreRole IN ('admin', 'tutor', 'tutorado'))
);

-- Insercion de datos en la tabla tbROLE
INSERT INTO tbROLE (nombreRole) VALUES ('admin');
INSERT INTO tbROLE (nombreRole) VALUES ('tutor');
INSERT INTO tbROLE (nombreRole) VALUES ('tutorado');

--Procedimientos almacenados para eliminar datos en la tabla tbROLE--
CREATE OR REPLACE PROCEDURE eliminar_role (
    p_nombreRole in tbROLE.nombreRole%type
) AS
BEGIN
DELETE FROM tbROLE WHERE nombreRole = p_nombreRole;
END;

-- Eliminación de datos en la tabla tbROLE
BEGIN
eliminar_role('admin');
eliminar_role('tutor');
eliminar_role('tutorado');
END;

select * from tbROLE;
drop table tbROLE;
delete from tbROLE;
 
--TABLA USUARIO------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbUsuario (
idUsuario VARCHAR2(100) PRIMARY KEY,
nombreUsuario VARCHAR2(15) NOT NULL,
edadUsuario INT NOT NULL,
correoUsuario VARCHAR2(200) NOT NULL unique,
contrasenaUsuario VARCHAR2(100) NOT NULL,
fotoUsuario VARCHAR2(1000), -- Foto de perfil
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

--Procedimientos almacenados para eliminar datos en la tabla tbUsuario
CREATE OR REPLACE PROCEDURE eliminar_usuario (
    p_idUsuario in tbUsuario.idUsuario%type
) AS
BEGIN
DELETE FROM tbUsuario WHERE idUsuario = p_idUsuario;
END;

--Eliminacion de datos en la tabla tbUsuario
BEGIN
eliminar_usuario('asosdsdusado');
eliminar_usuario('ddfgdfbcvbfg');
eliminar_usuario('lkjilgvnyjhn');
eliminar_usuario('fbncsvbffgdf');
eliminar_usuario('jmdfbbtygnfg');
END;

//Comando para iniciar sesión en la aplicación de Java 
update tbUsuario set contrasenaUsuario = 'fe3a646a168c88a7ad70522485aed3c74d0cb7223bf5a5274d26c8a09f743e7b' where correoUsuario = '20220721@ricaldone.edu.sv';
commit;

drop procedure eliminar_usuario
select * from tbUsuario;
drop table tbUsuario;
delete from tbUsuario;

--TABLA TUTORIA------------------------------------------------------------------------------------------------------------------------------------------------
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
VALUES ('sfsdssdvsd', 'Tutoria de Matematicas', 'En esta tutoria aprenderas sobre algebra');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('sdvsdvsdvd', 'Tutoria de Fisica', 'En esta tutoria aprenderas sobre conceptos basicos de la fisica', NULL, 'ddfgdfbcvbfg');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('mhgnhnmda3', 'Tutoria de Quimica', 'En esta tutoria aprenderas sobre conceptos basicos de la quimica', NULL, 'lkjilgvnyjhn');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('k-kgkjutyj', 'Tutoria de Historia', 'En esta tutoria aprenderas sobre periodos de tiempo', NULL, 'fbncsvbffgdf');
INSERT INTO tbTutoria (idTutoria, nombreTutoria, descripcionTutoria, imagenTutoria, idUsuario)
VALUES ('fghyujujut', 'Tutoria de Literatura', 'En esta tutoria aprenderas sobre conceptos obras literarias', NULL, 'jmdfbbtygnfg');

--Procedimiento almacenado para eliminar datos en tbTutoria
CREATE OR REPLACE PROCEDURE eliminar_tutoria (
    p_idTutoria in tbTutoria.idTutoria%type
) AS
BEGIN
DELETE FROM tbTutoria WHERE idTutoria = p_idTutoria;
END;

--Eliminacion de datos en la tabla tbTutoria
BEGIN
eliminar_tutoria('sfsdssdvsd');
eliminar_tutoria('sdvsdvsdvd');
eliminar_tutoria('mhgnhnmda3');
eliminar_tutoria('k-kgkjutyj');
eliminar_tutoria('fghyujujut');
END;
    
select * from tbTutoria;
drop table tbTutoria;
delete from tbTutoria;

--TABLA LECCION------------------------------------------------------------------------------------------------------------------------------------------------ 
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
VALUES ('Relleno1', 'Introduccion a Matematicas', TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Contenido de la leccion de introduccion a matematicas.', 1, 'sfsdssdvsd');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno2', 'Fisica Basica', TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'Contenido de la leccion de fisica basica.', 1, 'sdvsdvsdvd');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno3', 'Quimica Organica', TO_DATE('2024-07-03', 'YYYY-MM-DD'), 'Contenido de la leccion de quimica organica.', 1, 'mhgnhnmda3');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno4', 'Historia Mundial', TO_DATE('2024-07-04', 'YYYY-MM-DD'), 'Contenido de la leccion de historia mundial.', 1, 'k-kgkjutyj');
INSERT INTO tbLeccion (idLeccion, tituloLeccion, fechaLeccion, contenidoLeccion, statusLeccion, idTutoria)
VALUES ('Relleno5', 'Literatura Clasica', TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'Contenido de la leccion de literatura clasica.', 1, 'fghyujujut');

--Procedimiento almacenado para eliminar datos en la tabla tbLeccion
CREATE OR REPLACE PROCEDURE eliminar_leccion (
    p_idLeccion in tbLeccion.idLeccion%type
) AS
BEGIN
DELETE FROM tbLeccion WHERE idLeccion = p_idLeccion;
END;

--Eliminacion de datos en tbLeccion
BEGIN
eliminar_leccion('Relleno1');
eliminar_leccion('Relleno2');
eliminar_leccion('Relleno3');
eliminar_leccion('Relleno4');
eliminar_leccion('Relleno5');
END;

--Trigger para que podamos automatizar el proceso de una auditoria de cambios de estado, o impedir cambios no permitidos
CREATE OR REPLACE TRIGGER TrigSTATUS
BEFORE UPDATE OF statusLeccion ON tbLeccion
FOR EACH ROW
DECLARE
    v_fecha DATE := SYSDATE;
BEGIN
    -- Inserta un registro en una tabla de auditoría (por ejemplo, tbAuditLeccion)
    INSERT INTO tbAuditLeccion (idLeccion, oldStatus, newStatus, fechaCambio)
    VALUES (:OLD.idLeccion, :OLD.statusLeccion, :NEW.statusLeccion, v_fecha);
END;

select * from tbLeccion;
drop table tbLeccion;
delete from tbLeccion;

--TABLA AUDITORIA-----------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbAuditLeccion (
idAudit NUMBER GENERATED AS IDENTITY PRIMARY KEY,
nombreAudit VARCHAR2(100) NOT NULL,
idLeccion VARCHAR2(100) NOT NULL,
oldStatus NUMBER(1),
newStatus NUMBER(1),
fechaCambio DATE NOT NULL,

CONSTRAINT FK_Leccion2 FOREIGN KEY (idLeccion) REFERENCES tbLeccion(idLeccion)
);

--Inserción de datos: En algunas lecciones, se cambia de estado activo (0) a estado inactivo (0), estos datos se registran de manera automática mediante el trigger
--Esta es la forma manual
INSERT INTO tbAuditLeccion (idLeccion, nombreAudit, oldStatus, newStatus, fechaCambio)
VALUES ('Relleno1', 1, 1, 'Mantenimiento', TO_DATE('2024-09-02 10:30:00', 'YYYY-MM-DD'));
INSERT INTO tbAuditLeccion (idLeccion, nombreAudit, oldStatus, newStatus, fechaCambio)
VALUES ('Relleno2', 1, 0, 'Deshabilitación temporal', TO_DATE('2024-09-02 11:00:00', 'YYYY-MM-DD'));
INSERT INTO tbAuditLeccion (idLeccion, nombreAudit, oldStatus, newStatus, fechaCambio)
VALUES ('Relleno3', 1, 1, 'Mantenimiento', TO_DATE('2024-09-02 11:30:00', 'YYYY-MM-DD'));
INSERT INTO tbAuditLeccion (idLeccion, nombreAudit, oldStatus, newStatus, fechaCambio)
VALUES ('Relleno4', 1, 0, 'Deshabilitación temporal', TO_DATE('2024-09-02 12:00:00', 'YYYY-MM-DD'));
INSERT INTO tbAuditLeccion (idLeccion, nombreAudit, oldStatus, newStatus, fechaCambio)
VALUES ('Relleno5', 1, 1, 'Mantenimiento', TO_DATE('2024-09-02 12:30:00', 'YYYY-MM-DD'));

--Procedimiento almacenado para eliminar datos en la tabla de auditoria
CREATE OR REPLACE PROCEDURE eliminar_auditoria (
    p_nombreAudit in tbAuditLeccion.nombreAudit%type
) AS
BEGIN
DELETE FROM tbAuditLeccion WHERE nombreAudit = p_nombreAudit;
END;

--Eliminacion de datos en la tabla de auditoria
BEGIN
eliminar_auditoria('Mantenimiento');
eliminar_auditoria('Deshabilitación temporal');
eliminar_auditoria('Mantenimiento');
eliminar_auditoria('Deshabilitación temporal');
eliminar_auditoria('Mantenimiento');
END;

select * from tbAuditLeccion;
drop table tbAudiLeccion;
delete from tbAudiLeccion;

--RECORDATORIO--------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE tbRecordatorio (
idRecordatorio VARCHAR2(100) PRIMARY KEY,
nombreRecordatorio VARCHAR2(100) NOT NULL,
fechaRecordatorio DATE NOT NULL,
detalleRecordatorio VARCHAR2(300) NOT NULL,
idLeccion VARCHAR2(100) NOT NULL,
 
CONSTRAINT FK_Leccion FOREIGN KEY (idLeccion) REFERENCES tbLeccion(idLeccion)
);
 
-- Inserciones a la tabla tbRecordatorio
INSERT INTO tbRecordatorio (idRecordatorio, nombreRecordatorio, fechaRecordatorio, detalleRecordatorio, idLeccion) 
VALUES ('2nsj', 'Recordatorio 1', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Desarrollo del examen de matemáticas', 'Relleno1');
INSERT INTO tbRecordatorio (idRecordatorio, nombreRecordatorio, fechaRecordatorio, detalleRecordatorio, idLeccion) 
VALUES ('23dsb2', 'Recordatorio 2', TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'Completar el cuestionario de ondas', 'Relleno2');
INSERT INTO tbRecordatorio (idRecordatorio, nombreRecordatorio, fechaRecordatorio, detalleRecordatorio, idLeccion) 
VALUES ('dsb94', 'Recordatorio 3', TO_DATE('2024-09-03', 'YYYY-MM-DD'), 'Leer el manual de quimica organica', 'Relleno3');
INSERT INTO tbRecordatorio (idRecordatorio, nombreRecordatorio, fechaRecordatorio, detalleRecordatorio, idLeccion) 
VALUES ('ds0nd3', 'Recordatorio 4', TO_DATE('2024-08-28', 'YYYY-MM-DD'), 'Realizar la investigacion sobre la historia de El Salvador', 'Relleno4');
INSERT INTO tbRecordatorio (idRecordatorio, nombreRecordatorio, fechaRecordatorio, detalleRecordatorio, idLeccion) 
VALUES ('cb37kq', 'Recordatorio 5', TO_DATE('2024-09-07', 'YYYY-MM-DD'), 'Leer la obra de literatura', 'Relleno5');

--Procedimientos almacenados para eliminar datos en la tabla tbRecordatorio
CREATE OR REPLACE PROCEDURE eliminar_recordatorio (
    p_idRecordatorio in tbRecordatorio.idRecordatorio%type
) AS
BEGIN
DELETE FROM tbRecordatorio WHERE idRecordatorio = p_idRecordatorio;
END;

--Eliminacion de datos en la tabla tbRecordatorio
BEGIN
eliminar_recordatorio('2nsj');
eliminar_recordatorio('23dsb2');
eliminar_recordatorio('dsb94');
eliminar_recordatorio('ds0nd3');
eliminar_recordatorio('cb37kq');
END;

select * from tbRecordatorio;
drop table tbRecordatorio;
delete from tbRecordatorio;
 
--Union de las tablas tbUsuario y tbTutoria en una sola tabla donde el idRole representa a los tutores
SELECT  u.nombreUsuario,  u.correoUsuario,  tu.nombreTutoria, tu.descripcionTutoria,  tu.imagenTutoria 
FROM  tbUsuario u INNER JOIN  tbTutoria tu ON u.idUsuario = tu.idUsuario WHERE u.idRole = 2;
 
--Union de las tablas tbLeccion y tbRecordatorio en una sola tabla
SELECT l.tituloLeccion, l.fechaLeccion, l.contenidoLeccion, l.statusLeccion, r.nombreRecordatorio, r.fechaRecordatorio, r.detalleRecordatorio
FROM tbLeccion l INNER JOIN tbrecordatorio r ON l.idLeccion = r.idLeccion;
 
--Prueba con left join usando tbUsuario y tbTutorado 
--(Supongamos que quieres obtener una lista de todos los tutorados y sus tutorias, incluyendo 
--aquellos tutorados que no tienen tutorias asignadas.)
SELECT u.nombreUsuario, tu.nombreTutoria
FROM tbUsuario u LEFT JOIN  tbTutoria tu ON u.idUsuario = tu.idUsuario WHERE u.idRole = 3;
 
--Prueba con right join usando tbUsuario y tbTutorado 
--(Supongamos que quieres obtener una lista de todas las tutorias y los tutorados asignados a ellas,
--incluyendo aquellas tutor?as que no tienen tutorados asignados.)
SELECT u.nombreUsuario, tu.nombreTutoria
FROM tbUsuario u RIGHT JOIN tbTutoria tu ON tu.idUsuario = u.idUsuario WHERE u.idRole = 3;
 
