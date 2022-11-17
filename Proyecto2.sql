set serveroutput on;

create table provincia
(id_provincia number not null,
nombre varchar2(20) not null,
constraint id_provincia_pk
primary key(id_provincia)
);

create table estudiante
(carnet number not null,
nombre varchar2(20) not null,
provincia number not null,
anno_ingreso varchar2(20) not null,
constraint fk_provincia
foreign key (provincia) references provincia (id_provincia),
constraint carnet_pk
primary key(carnet)
);

create table beca
(id_beca number not null,
monto float,
nombre_beca varchar2(20),
constraint id_beca_pk
primary key(id_beca)
);


create table aula
(id_aula number not null,
nombre_aula varchar2(20) not null,
constraint id_aula_pk
primary key(id_aula)
);

create table horario
(id_horario number not null,
dia varchar2(20),
hora_inicio varchar2(20),
hora_fin varchar2(20),
constraint id_horario_pk
primary key(id_horario)
);

create table materia
(id_materia number not null,
creditos number(1),
nombre_materia varchar2(50) not null,
constraint id_materia_pk
primary key(id_materia)
);

create table profesor
(id_profesor number not null,
nombre_profesor varchar2(20) not null,
constraint id_profesor_pk
primary key(id_profesor)
);



create table departamento
(id_depto number not null,
nombre_depto varchar2(20) not null,
constraint id_depto_pk
primary key(id_depto)
);


create table grupo
(num_grupo number not null,
id_profesor_grupo number not null,
id_horario_grupo number not null,
id_aula_grupo number not null,
id_materia_grupo number not null,
constraint fk_id_profesor_grupo
foreign key(id_profesor_grupo) references profesor(id_profesor),
constraint fk_id_horario_grupo
foreign key(id_horario_grupo) references horario(id_horario),
constraint fk_id_aula_grupo
foreign key(id_aula_grupo) references aula(id_aula),
constraint fk_id_materia_grupo
foreign key(id_materia_grupo) references materia(id_materia),
constraint num_grupo_pk
primary key(num_grupo)
);


create table matricula
(id_matricula number not null,
carnet_matricula number not null,
id_grupo_matriculado number not null,
nota_estudiante number(3,2) not null,
constraint fk_carnet_matricula
foreign key(carnet_matricula) references estudiante(carnet),
constraint fk_id_grupo_matriculado
foreign key(id_grupo_matriculado) references grupo(num_grupo),
primary key (id_matricula, carnet_matricula, id_grupo_matriculado)
);

create table periodo
(periodo number(1),
carnet_estudiante number not null,
id_grupo_matriculado number not null,
anno varchar2(4),
nota_final number(3),
estado varchar2(20),
constraint fk_carnet_estudiante_periodo
foreign key(carnet_estudiante) references estudiante(carnet),
constraint fk_id_grupo_matriculado_periodo
foreign key(id_grupo_matriculado) references grupo(num_grupo),
primary key (periodo, carnet_estudiante, id_grupo_matriculado)
);

--N:N
create table estudiante_beca
(carnet_eb number not null,
id_beca_eb number not null,
constraint fk_carnet_eb
foreign key (carnet_eb) references estudiante(carnet),
constraint fk_id_beca_eb
foreign key (id_beca_eb) references beca(id_beca),
primary key(carnet_eb, id_beca_eb)
);

--N:1

alter table profesor
 add (id_departamento_profesor number not null)
 add constraint fk_id_departamento_profesor
 foreign key(id_departamento_profesor) references departamento(id_depto);

alter table materia
 add(id_departamento_materia number not null)
 add constraint fk_id_departamento_materia
 foreign key(id_departamento_materia) references departamento(id_depto);



create table requisito_materia
(id_materia number not null,
id_materia_requisito number not null,
constraint fk_id_materia
foreign key(id_materia) references materia(id_materia),
constraint fk_id_materia_requisito
foreign key(id_materia_requisito) references materia(id_materia),
primary key(id_materia, id_materia_requisito)
);

-- datos de prueba
insert into provincia values(1, 'Guanacaste');
insert into provincia values(2, 'San Jose');
insert into provincia values(3, 'Alajuela');
insert into provincia values(4, 'Cartago');

insert into estudiante values(201700000, 'Juan Perez', 1, '2017' );
insert into estudiante values(201700001, 'Maria Lopez', 2,'2017' );
insert into estudiante values(201700002, 'Pedro Sanchez', 3, '2017');
insert into estudiante values(201700003, 'Jose Jimenez', 4, '2017');
insert into estudiante values(201700004, 'Manuel Mora', 4, '2017');
insert into estudiante values(201700005, 'Ignacio Mendez', 2, '2017');

insert into beca values(1, 1000, 'Beca 1');
insert into beca values(2, 2000, 'Beca 2');

insert into aula values(1, 'Aula 1');
insert into aula values(2, 'Aula 2');
insert into aula values(3, 'Aula 3');
insert into aula values(4, 'Aula 4');
insert into aula values(5, 'Aula 5');

insert into horario values(1, 'Lunes', '9:00', '10:00');
insert into horario values(2, 'Lunes', '10:00', '11:00');
insert into horario values(3, 'Lunes', '12:00', '13:00');
insert into horario values(4, 'Lunes', '14:00', '15:00');
insert into horario values(5, 'Lunes', '15:00', '16:00');

insert into horario values(6, 'Martes', '9:00', '10:00');
insert into horario values(7, 'Martes', '10:00', '11:00');
insert into horario values(8, 'Martes', '12:00', '13:00');
insert into horario values(9, 'Martes', '14:00', '15:00');
insert into horario values(10, 'Martes', '15:00', '16:00');

insert into horario values(11, 'Miercoles', '9:00', '10:00');
insert into horario values(12, 'Miercoles', '10:00', '11:00');
insert into horario values(13, 'Miercoles', '12:00', '13:00');
insert into horario values(14, 'Miercoles', '14:00', '15:00');
insert into horario values(15, 'Miercoles', '15:00', '16:00');

insert into horario values(16, 'Jueves', '9:00', '10:00');
insert into horario values(17, 'Jueves', '10:00', '11:00');
insert into horario values(18, 'Jueves', '12:00', '13:00');
insert into horario values(19, 'Jueves', '14:00', '15:00');
insert into horario values(20, 'Jueves', '15:00', '16:00');


insert into departamento values(1, 'Departamento 1');
insert into departamento values(2, 'Departamento 2');
insert into departamento values(3, 'Departamento 3');
insert into departamento values(4, 'Departamento 4');


insert into materia values(1, 2, 'MATEMATICA GENERAL',1);
insert into materia values(2, 3, 'FUNDAMENTOS DE ORGANIZACION DE COMPUTADORAS',2);
insert into materia values(3, 4, 'ESTRUCTURAS DE DATOS',2);
insert into materia values(4, 3, 'INTRODUCCION A LA PROGRAMACION',4);
insert into materia values(5, 3, 'TALLER DE PROGRAMACION',3);
insert into materia values(6, 2, ' INGLES BASICO',2);
insert into materia values(7, 2, ' INGLES 1',2);
insert into materia values(8, 2, ' INGLES 2',2);
insert into materia values(9, 4, 'ANALISIS DE ALGORITMOS',2);
insert into materia values(10, 4, 'CALCULO DIFERENCIAL E INTEGRAL',2);


insert into profesor values(1, 'Profesor 1',1);
insert into profesor values(2, 'Profesor 2',2);
insert into profesor values(3, 'Profesor 3',3);

insert into grupo values(1, 1, 1, 1, 1);
insert into grupo values(2, 2, 2, 2, 2);
insert into grupo values(3, 3, 3, 3, 3);
insert into grupo values(4, 3, 4, 4, 4);
insert into grupo values(5, 3, 4, 4, 5);
insert into grupo values(6, 3, 4, 4, 6);
insert into grupo values(7, 3, 4, 4, 7);
insert into grupo values(8, 3, 4, 4, 8);
insert into grupo values(9, 3, 4, 4, 9);
insert into grupo values(10, 3, 4, 4, 10);

-- datos de prueba para perido (periodo,carnet_estudiante,id_grupo_matriculado, anno, nota_final, estado)
insert into periodo values(2, 201700001, 1, '2018', 65, 'Reproado');

insert into periodo values(1, 201700002, 2, '2019', 90, 'Aprobado');
insert into periodo values(2, 201700002, 1, '2019', 60, 'Reproado');

insert into periodo values(1, 201700003, 2, '2020', 5, 'Reprobado');
insert into periodo values(1, 201700004, 1, '2020', 80, 'Aprobado');
insert into periodo values(1, 201700005, 3, '2020', 75, 'Aprobado');

insert into periodo values(2, 201700003, 2, '2020', 95, 'Aprobado');
insert into periodo values(2, 201700004, 2, '2020', 80, 'Aprobado');
insert into periodo values(2, 201700005, 2, '2020', 60, 'Reprobado');

insert into periodo values(1, 201700005, 2, '2021', 70, 'Aprobado');
insert into periodo values(1, 201700005, 6, '2021', 90, 'Aprobado');
insert into periodo values(1, 201700005, 7, '2021', 70, 'Aprobado');
insert into periodo values(1, 201700005, 8, '2021', 70, 'Aprobado');
insert into periodo values(1, 201700005, 10, '2021', 70, 'Aprobado');

insert into estudiante_beca values(201700000, 1);
insert into estudiante_beca values(201700001, 2);
insert into estudiante_beca values(201700002, 1);

insert into requisito_materia values(7,6);
insert into requisito_materia values(8,7);
insert into requisito_materia values(9,4);
insert into requisito_materia values(9,10);
insert into requisito_materia values(10,1);



--PARTE 3

--- función para calcular los creditos por grupo

create or replace function obtener_creditos( n_grupo number)
return number is
total_creditos number;
id_ma number;
begin

select id_materia_grupo into id_ma from grupo where  num_grupo = n_grupo;

select creditos into total_creditos from materia where id_materia = id_ma;

return total_creditos;

end;
/

--select obtener_creditos(10)  from dual;

-- funcion para el promedio ponderado

create or replace function promedio_ponderado(n_carnet number)
 return number is 
 total_creditos number;
 sumatoria number;
 total number ;
 creditos number;
 

cursor cur_est is
 select id_grupo_matriculado, nota_final, periodo
 from periodo where carnet_estudiante = n_carnet ;

begin
total_creditos := 0;
sumatoria := 0;
for reg in cur_est
loop
creditos := obtener_creditos(reg.id_grupo_matriculado);
total_creditos := total_creditos + creditos;
sumatoria := (reg.nota_final * creditos) + sumatoria;
end loop;

if total_creditos = 0 then total_creditos := 1;

end if;
total := sumatoria / total_creditos;

return total;

 end;
 /


--select promedio_ponderado(201700005) from dual;

--tabla temporal global 
create global temporary table temp_estudiantes_anno
(carnet number not null,
nombre varchar2(20) not null,
ponderado float not null
);

-- procedimiento para insertar en tabla temporal

create or replace procedure agregar_estudiante_anno (v_anno in varchar2)
is
cursor cur_agregar_estudiante is
select carnet, nombre from estudiante where anno_ingreso = v_anno;

begin

for reg in cur_agregar_estudiante
loop
insert into temp_estudiantes_anno 
values (reg.carnet, reg.nombre, promedio_ponderado(reg.carnet));

end loop;


end;
/

--prueba
execute agregar_estudiante_anno(2017);

select * from temp_estudiantes_anno;

/*
-- eliminar en cascada las tablas y sus datos en onder inverso de como se crearon las tablas
drop table requisito_materia cascade constraints;
drop table estudiante_beca cascade constraints;
drop table periodo cascade constraints;
drop table matricula cascade constraints;
drop table grupo cascade constraints;
drop table departamento cascade constraints;
drop table profesor cascade constraints;
drop table materia cascade constraints;
drop table horario cascade constraints;
drop table aula cascade constraints;
drop table beca cascade constraints;
drop table estudiante cascade constraints;
drop table provincia cascade constraints;
*/
