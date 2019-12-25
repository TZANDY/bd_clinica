create database db_clinica;
use db_clinica;

CREATE TABLE tb_departamento(
    id_dep int primary key auto_increment,
    descripcion varchar(40)
);
/*
insert into tb_departamento(,descripcion) values insert into tb_departamento(descripcion) values ('AMAZONAS'),('ANCASH'),('APURIMAC'),('AYACUCHO'),('CAJAMARCA'),('CUSCO'),('HUANCAVELICA'),('HUANUCO'),('ICA'),('JUNIN'),('LA LIBERTAD'),('LAMBAYEQUE'),('LORETO'),('MADRE DE DIOS'),('MOQUEGUA'),('PASCO'),('PIURA'),('PUNO'),('SAN MARTIN'),('TACNA'),('TUMBES'),('UCAYALI')
*/
Create table tb_provincia(
    id_pro int primary key auto_increment,
    id_departamento int,
    descripcion varchar(40),
    foreign key (id_departamento) references tb_departamento(id_dep)
);

/*
insert into tb_provincia(id_departamento,descripcion) values (1,'BARRANCA'),(1,'CAJATAMBO'),(1,'CANTA'),(1,'CAÑETE'),(1,'HUARAL'),(1,'HUAROCHIRÍ'),(1,'HUAURA'),(1,'LIMA'),(1,'OYÓN'),(1,'YAUYOS');
insert into tb_provincia(id_departamento,descripcion) values (2,'CALLAO');
insert into tb_provincia(id_departamento,descripcion) values (3,'AREQUIPA'),(3,'CAMANÁ'),(3,'CARAVELÍ'),(3,'CASTILLA'),(3,'CAYLLOMA'),(3,'CONDESUYOS'),(3,'ISLAY MOLLENDO'),(3,'LA UNIÓN');
insert into tb_provincia(id_departamento,descripcion) values (4,'BAGUA'),(4,'BONGARÁ'),(4,'CHACHAPOYAS'),(4,'CONDORCANQUI'),(4,'LUYA'),(4,'RODRÍGUEZ DE MENDOZA'),(4,'UTCUBAMBA');
insert into tb_provincia(id_departamento,descripcion) values (5,'AIJA'),(5,'ANTONIO RAIMONDI'),(5,'ASUNCIÓN'),(5,'BOLOGNESI'),(5,'CARHUAZ'),(5,'CARLOS FERMÍN FITZCARRALD'),(5,'CASMA'),(5,'CORONGO'),(5,'HUARAZ'),(5,'HUARI'),(5,'HUARMEY'),(5,'HUAYLAS'),(5,'MARISCAL LUZURIAGA'),(5,'OCROS'),(5,'PALLASCA'),(5,'POMABAMBA'),(5,'RECUAY'),(5,'SANTA'),(5,'SIHUAS'),(5,'YUNGAY')
*/

Create table tb_distrito(
    id_dis int primary key auto_increment,
    id_provincia int,
    descripcion varchar(40),
    foreign key (id_provincia) references tb_provincia(id_pro)
);
/*
insert into tb_distrito(id_provincia,descripcion) 
values 
(53,'CALLAO'),(53,'BELLAVISTA'),(53,'CARMEN DE LA LEGUA-REYNOSO'),(53,'LA PERLA'),(53,'LA PUNTA'),(53,'VENTANILLA'),(53,'MI PERÚ'),
(8,'CERCADO DE LIMA'),(8,'ATE'),(8,'BARRANCO'),(8,'BREÑA'),(8,'COMAS'),(8,'CHORRILLOS'),(8,'EL AGUSTINO'),(8,'JESÚS MARÍA'),(8,'LA MOLINA'),(8,'LA VICTORIA'),(8,'LINCE'),(8,'MAGDALENA DEL MAR'),(8,'MIRAFLORES'),(8,'PUEBLO LIBRE'),(8,'PUENTE PIEDRA'),(8,'RIMAC'),(8,'SAN ISIDRO'),(8,'INDEPENDENCIA'),(8,'SAN JUAN DE MIRAFLORES'),(8,'SAN LUIS'),(8,'SAN MARTIN DE PORRES'),(8,'SAN MIGUEL'),(8,'SANTIAGO DE SURCO'),(8,'SURQUILLO'),(8,'VILLA MARÍA DEL TRIUNFO'),(8,'SAN JUAN DE LURIGANCHO'),(8,'SANTA ROSA'),(8,'LOS OLIVOS'),(8,'SAN BORJA'),(8,'VILLA EL SAVADOR'),(8,'SANTA ANITA')
*/

CREATE TABLE tb_especialidad
(
    id_esp int primary key auto_increment,
    id_cargo int,
    descripcion varchar(50),
    fecha_registro date,
    min_emp int(3),
    max_emp int(3)
);

CREATE TABLE tb_usuario
(
    id_usu int primary key auto_increment,
    dni char(8),
    nombre varchar(30),
    apellido varchar(20),
    direccion varchar(50),
    id_distrito int,
    correo varchar(30),
    fnacimiento varchar(20),
    celular varchar(20),
    estadocivil varchar(20),
    id_cargo int,
    fecha_registro date
);

CREATE TABLE tb_empleado
(
    id_emp int primary key auto_increment,
    dni char(8),
    nombre varchar(30),
    apellido varchar(20),
    direccion varchar(50),
    id_distrito int,
    correo varchar(30),
    fnacimiento varchar(20),
    celular varchar(20),
    estadocivil varchar(20),
    id_cargo int,
    fecha_registro date
);
CREATE TABLE tb_login_usuario(
    id_log_usu int primary key auto_increment,
    id_usuario int,
    usuario varchar(100),
    clave varchar(100),
    estado varchar(20),
    fecha_acceso date
);
CREATE TABLE tb_login_empleado(
    id_log_emp int primary key auto_increment,
    id_empleado int,
    usuario varchar(100),
    clave varchar(100),
    estado varchar(20),
    fecha_acceso date
);
CREATE TABLE tb_turno_empleado(
    id_tur_emp int primary key auto_increment,
    descripcion varchar(20),
    min_emp_turno int(3),
    max_emp_turno int(3),
    fecha_registro date,
    fecha_actualizacion date
);

CREATE TABLE tb_horario_empleado(
    id_hor_emp int primary key auto_increment,
    id_empleado int,
    hora_inicio varchar(10),
    hora_fin varchar(10),
    rango_horas_dia int,
    rango_horas_semana int,
    cambio_hor_emp int(2),
    fecha_registro date
);

CREATE TABLE tb_ficha_cita(
    id_fic_cit int primary key auto_increment,
    id_usuario int,
    id_sede int,
    estado_cita varchar(50),
    fecha_registro date,
    fecha_actualizacion date
);

CREATE TABLE tb_atencion(
    id_ate int primary key auto_increment,
    id_fic_cit int,
    id_empleado int,
    estado_atencion varchar(50),
    id_tipo_atencion int(5),
    fecha_registro date
);

CREATE TABLE tb_tipo_atencion(
    id_tip_ate int primary key auto_increment,
    descripcion varchar(50),
    nota double
);

CREATE TABLE tb_historial_clinico(
    id_his_cli int primary key auto_increment,
    id_atencion int,
    fecha_registro date
);

CREATE TABLE tb_historial_clinico_detalle(
    id_his_cli_det int primary key auto_increment,
    id_historial_clinico int,
    descripcion_1 varchar(100),
    descripcion_2 varchar(100),
    descripcion_3 varchar(100),
    descripcion_4 varchar(100),
    descripcion_5 varchar(100),
    fecha_registro date
);