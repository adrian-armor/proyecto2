create table estudiante
(carnet number not null,
nombre varchar2(20) not null,
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

create table periodo
(periodo number, 
año date,
estado varchar2(20)
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
creditos varchar2(20), 
nombre_materia varchar2(20) not null,
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
carnet_grupo number not null,
id_materia_grupo number not null,
constraint fk_id_profesor_grupo
foreign key(id_profesor_grupo) references profesor(id_profesor),
constraint fk_id_horario_grupo
foreign key(id_horario_grupo) references horario(id_horario),
constraint fk_id_aula_grupo
foreign key(id_aula_grupo) references aula(id_aula),
constraint fk_carnet_grupo
foreign key(carnet_grupo) references estudiante(carnet),
constraint fk_id_materia_grupo
foreign key(id_materia_grupo) references materia(id_materia),
primary key (id_profesor_grupo, id_horario_grupo, id_aula_grupo, carnet_grupo, id_materia_grupo)
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
 
-- 3


