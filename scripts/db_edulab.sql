-----------------------------
-- GRUPO: MARPA			   --
-- PROYECTO: EDULAB		   --
-- FECHA: 27/02/2017	   --
-----------------------------

-----------------
-- TABLAS (14) --
-----------------

DROP TABLE IF EXISTS tab_vipedu;
DROP TABLE IF EXISTS tab_inventariopuntoaedu;
DROP TABLE IF EXISTS tab_inventariojornadaedu;
DROP TABLE IF EXISTS tab_testedu;
DROP TABLE IF EXISTS tab_ninosedu;
DROP TABLE IF EXISTS tab_gruposedu;
DROP TABLE IF EXISTS tab_competenciasedu;
DROP TABLE IF EXISTS tab_profesoresedu;
DROP TABLE IF EXISTS tab_acudientesedu;
DROP TABLE IF EXISTS tab_jornadasedu;
DROP TABLE IF EXISTS tab_puntodeacopioedu;
DROP TABLE IF EXISTS tab_elementosedu;
DROP TABLE IF EXISTS tab_parametrosedu;
DROP TABLE IF EXISTS tab_auditoriaedu;
--------------------------------------------------------
-- Tabla para llevar la auditoria de todas las tablas --
--------------------------------------------------------

CREATE TABLE tab_auditoriaedu
(
 id_consec	BIGINT			NOT NULL,                     -- Consecutivo de la tabla auditoria
 nom_tabla	VARCHAR 		NOT NULL,                     -- Nombre de la tabla que se le hace auditoria
 val_evento	VARCHAR(12)		NOT NULL,                     -- Evento (Insertar, actualizar, borar)
 usr_evento	VARCHAR(12)		NOT NULL,					  -- Usuario que ocasiono el evento
 fec_evento	TIMESTAMP WITHOUT TIME ZONE	NOT NULL,		  -- Fecha del evento
 PRIMARY KEY(id_consec)
);

-----------------------------
-- Tabla de los parámetros --
-----------------------------

CREATE TABLE tab_parametrosedu
(
 id_anio		BIGINT			NOT NULL,                     -- Año presente
 num_grupo		BIGINT			NOT NULL,                     -- Número de integrantes de cada grupo
 gruposmax		BIGINT			NOT NULL,					  -- Grupos máximo que tendrá un profesor
 mesestaller	DECIMAL(2,0)	NOT NULL,					  -- Meses de duración de los talleres
 usr_insert		VARCHAR(12)		NOT NULL,				   	  -- usuario que instera
 fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  		  -- fecha de insercion de datos
 usr_update		VARCHAR(12),						  		  -- usuario que actualiza 
 fec_update		TIMESTAMP WITHOUT TIME ZONE,		  		  -- fecha que el usuario actualizo
 PRIMARY KEY(id_anio)
);



------------------------------------------------
-- Tabla para llevar los objetos electrónicos --
------------------------------------------------
CREATE TABLE tab_elementosedu
(
 id_objeto		BIGINT 		NOT NULL,				   -- Abreviatura del objeto
 nom_objeto 	VARCHAR 	NOT NULL,				   -- Nombre del objeto
 usr_insert		VARCHAR(12)	NOT NULL,				   -- usuario que instera
 fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
 usr_update		VARCHAR(12),						   -- usuario que actualiza 
 fec_update		TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
 PRIMARY KEY (id_objeto)
);

--------------------------------------------
-- Tabla para llevar los puntos de acopio --
--------------------------------------------

CREATE TABLE tab_puntodeacopioedu
(
 id_punto		BIGINT			NOT NULL,                     -- Abreviatura del punto de acopio
 nom_punto		VARCHAR(12)		NOT NULL,                     -- Nombre del punto de acopio
 dir_punto		VARCHAR(256)	NOT NULL,                     -- Dirección del punto de acopio
 tel_punto		DECIMAL(7,0)	NOT NULL,	   		          -- Teléfono del punto de acopio
 usr_insert		VARCHAR(12)		NOT NULL,				   	  -- usuario que instera
 fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  		  -- fecha de insercion de datos
 usr_update		VARCHAR(12),						  		  -- usuario que actualiza 
 fec_update		TIMESTAMP WITHOUT TIME ZONE,		  		  -- fecha que el usuario actualizo
 PRIMARY KEY(id_punto)
);

-------------------------------------------------------------------
-- Tabla para registrar las jornadas de recolección de elementos --
-------------------------------------------------------------------

CREATE TABLE tab_jornadasedu
(
	id_jornada 		BIGINT 		NOT NULL,					-- Número de la jornada
	lugar_jornada	VARCHAR 	NOT NULL,					-- Dirección del lugar de la jornada
	fec_jornada 	DATE 		NOT NULL,					-- Fecha de la jornada
	hor_jornada 	VARCHAR		NOT NULL,					-- Hora de la jornada
	usr_insert		VARCHAR(12)	NOT NULL,				   	-- usuario que instera
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  	-- fecha de insercion de datos
	usr_update		VARCHAR(12),						   	-- usuario que actualiza 
	fec_update		TIMESTAMP WITHOUT TIME ZONE,		  	-- fecha que el usuario actualizo
	PRIMARY KEY(id_jornada)
);

----------------------------------------
-- Tabla para registrar los usuarios --
----------------------------------------
/*CREATE TABLE tab_usuariosedu
(
	alias_usuario	VARCHAR 		NOT NULL,			   -- Apodo del usuario
	nom_usuario		VARCHAR			NOT NULL,			   -- Nombres del usuario
	ape_usuario 	VARCHAR			NOT NULL,			   -- Apellidos del usuario
	cel_usuario		DECIMAL(10,0)	NOT NULL,			   -- Celular del usuario
	tel_usuario		DECIMAL(7,0),					       -- Telefono del usuario
	email_usuario	VARCHAR			NOT NULL,			   -- Email del usuario
	pass_usuario	VARCHAR			NOT NULL,			   -- Contraseña del usuario
	usr_insert		VARCHAR(12)	NOT NULL,				   -- usuario que inserta
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
	usr_update		VARCHAR(12),						   -- usuario que actualiza 
	fec_update		TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
	primary key(alias_usuario)
);*/

-----------------------------------------
-- Tabla para registrar los acudientes --
-----------------------------------------

CREATE TABLE tab_acudientesedu
(
	id_acudiente	NUMERIC					NOT NULL,			-- Cédula del acudiente
	nom_acudiente	VARCHAR					NOT NULL,			-- Nombre del acudiente
	ape_acudiente	VARCHAR					NOT NULL,			-- Apellido del acudiente
	edad_acudiente	DECIMAL(2,0)			NOT NULL,			-- Edad del acudiente
	sexo_acudiente 	BOOLEAN				 	NOT NULL,			-- Sexo del acudiente (TRUE = femenino FALSE = Masculino)
	cel_acudiente	DECIMAL(10,0)			NOT NULL,			-- Celular del acudiente
	email_acudiente	VARCHAR					NOT NULL,			-- Email del acudiente
	usr_insert		VARCHAR(12)	NOT NULL,				   		-- usuario que instera
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  		-- fecha de insercion de datos
	usr_update		VARCHAR(12),						   		-- usuario que actualiza 
	fec_update		TIMESTAMP WITHOUT TIME ZONE,		  		-- fecha que el usuario actualizo
	PRIMARY KEY(id_acudiente)
);

-----------------------------------------
-- Tabla para registrar los profesores --
-----------------------------------------

CREATE TABLE tab_profesoresedu
(
	id_profesor		NUMERIC						NOT NULL,			-- Cédula del profesor
	nom_profesor	VARCHAR						NOT NULL,			-- Nombre del profesor
	ape_profesor	VARCHAR						NOT NULL,			-- Apellido del profesor
	edad_profesor	DECIMAL(2,0)				NOT NULL,			-- Edad del profesor
	sexo_profesor	BOOLEAN				 		NOT NULL,			-- Sexo del profesor (TRUE = femenino FALSE = Masculino)
	cel_profesor	DECIMAL(10,0)				NOT NULL, 			-- Celular del profesor
	dir_profesor	VARCHAR						NOT NULL,			-- Dirección del profesor
	email_profesor	VARCHAR						NOT NULL, 			-- Email del Profesor
	usr_insert		VARCHAR(12)	NOT NULL,				  			-- usuario que instera
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  			-- fecha de insercion de datos
	usr_update		VARCHAR(12),						   			-- usuario que actualiza 
	fec_update		TIMESTAMP WITHOUT TIME ZONE,		   			-- fecha que el usuario actualizo
	PRIMARY KEY(id_profesor)
);

---------------------------------
-- Tabla para las competencias --
---------------------------------

CREATE TABLE tab_competenciasedu
(
	id_competencia		NUMERIC 	NOT NULL,				   -- Id de la competencia
	nom_competencia		VARCHAR		NOT NULL,				   -- Nombre de la Competencia (Matemáticas, Física,etc)
	usr_insert			VARCHAR(12)	NOT NULL,				   -- usuario que instera
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
	usr_update			VARCHAR(12),						   -- usuario que actualiza 
	fec_update			TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
	PRIMARY KEY(id_competencia)
);

--------------------------------------
-- Tabla ver los grupos que existen --
--------------------------------------

/*CREATE TABLE tab_gruposedu
(
	id_grupo			NUMERIC		NOT NULL,			       -- Identificador del grupo (100-199)
	id_profesor			NUMERIC		NOT NULL,				   -- Cédula del profesor
	usr_insert	 		VARCHAR(12)	NOT NULL,				   -- usuario que instera
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
	usr_update			VARCHAR(12),						   -- usuario que actualiza 
	fec_update			TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
	PRIMARY KEY(id_grupo),
	FOREIGN KEY (id_profesor) REFERENCES tab_profesoresedu(id_profesor)
);
*/

---------------------------------------------
-- Tabla ver los integrantes de cada grupo --
---------------------------------------------

CREATE TABLE tab_gruposedu
(
	id_grupo			NUMERIC		NOT NULL,			       -- Identificador del grupo (100-199)
	id_profesor			NUMERIC		NOT NULL,				   -- Cédula del profesor
	usr_insert	 		VARCHAR(12)	NOT NULL,				   -- usuario que inserta
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
	usr_update			VARCHAR(12),						   -- usuario que actualiza 
	fec_update			TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
	PRIMARY KEY(id_grupo),
	FOREIGN KEY (id_profesor) REFERENCES tab_profesoresedu(id_profesor)
);

------------------------------------
-- Tabla para registrar los niños --
------------------------------------

CREATE TABLE tab_ninosedu
(	
	id_nino					NUMERIC 				NOT NULL, 			   -- Tarjeta de Identidad del niño
	id_acudiente			NUMERIC					NOT NULL,			   -- Cédula del Acudiente
	--id_profesor			NUMERIC		NOT NULL,				   -- Cédula del profesor
	nick_nino				VARCHAR 				NOT NULL, 			   -- alias del niño
	img_nino				VARCHAR					NOT NULL,			   -- Ruta de la ubicación de la  imagen por defecto
	nom_nino				VARCHAR					NOT NULL,			   -- Nombre del niño
	ape_nino				VARCHAR					NOT NULL,			   -- Apellido del niño
	edad_nino				DECIMAL(2,0)			NOT NULL, 			   -- Edad del niño
	sexo_nino				BOOLEAN 				NOT NULL, 			   -- Sexo del niño. TRUE = Femenino FALSE = Masculino
	dir_nino				VARCHAR					NOT NULL, 			   -- Direccion de la casa del niño
	email_nino				VARCHAR					NOT NULL,			   -- Email del niño
	ind_vip					BOOLEAN	DEFAULT FALSE	NOT NULL,			   -- TRUE = Ya pagó FALSE = No ha pagado
	--ind_resta				BOOLEAN	DEFAULT FALSE	NOT NULL,			   -- TRUE = Si necesita el curso FALSE = No necesita el curso
	--ind_multi				BOOLEAN	DEFAULT FALSE	NOT NULL,			   -- TRUE = Si necesita el curso FALSE = No necesita el curso
	contrasena_nino			VARCHAR					NOT NULL,			   -- Contraseña del niño
	usr_insert		VARCHAR(12)				NOT NULL,			   -- usuario que inserta
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  		   -- fecha de insercion de datos
	usr_update		VARCHAR(12),						  		   -- usuario que actualiza 
	fec_update		TIMESTAMP WITHOUT TIME ZONE,		   		   -- fecha que el usuario actualizo
	PRIMARY KEY(id_nino),
	FOREIGN KEY(id_acudiente) REFERENCES tab_acudientesedu (id_acudiente)
	--FOREIGN KEY(id_profesor) REFERENCES tab_profesoresedu (id_profesor)
);



--------------------------------------------------
-- Tabla para registrar los resultados del test --
--------------------------------------------------

CREATE TABLE tab_testedu
(
	id_test				NUMERIC 	NOT NULL,				   	-- Número del test
	id_nino				NUMERIC 	NOT NULL, 			   		-- Tarjeta de Identidad del niño
	resul_suma			NUMERIC		NOT NULL,					-- Resultado en el tema de suma del niño
	resul_resta			NUMERIC		NOT NULL,					-- Resultado en el tema de resta del niño
	resul_multi			NUMERIC		NOT NULL,					-- Resultado en el tema de las multiplicaciones del niño
	usr_insert			VARCHAR(12)	NOT NULL,				   	-- usuario que inserta
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  	-- fecha de insercion de datos
	usr_update			VARCHAR(12),						   	-- usuario que actualiza 
	fec_update			TIMESTAMP WITHOUT TIME ZONE,		   	-- fecha que el usuario actualizo
	PRIMARY KEY(id_test, id_nino),
	FOREIGN KEY (id_nino) REFERENCES tab_ninosedu(id_nino)
);


-----------------------------
-- Tabla para los talleres --
-----------------------------

/*CREATE TABLE tab_talleresedu
(
	id_taller			NUMERIC		NOT NULL,				   -- Id del taller
	id_profesor			NUMERIC		NOT NULL, 			       -- Cédula del profesor
	--id_competencia		NUMERIC		NOT NULL, 				   -- Id de la competencia 
	nom_taller			VARCHAR		NOT NULL, 				   -- Nombre del taller
	duracion_taller		VARCHAR		NOT NULL, 				   -- Duracion del taller 	(Horas)
	usr_insert			VARCHAR(12)	NOT NULL,				   -- usuario que inserta
	fec_insert			TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
	usr_update			VARCHAR(12),						   -- usuario que actualiza 
	fec_update			TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
	PRIMARY KEY(id_taller,id_profesor,id_competencia),
	FOREIGN KEY(id_profesor) REFERENCES tab_profesoresedu(id_profesor)
	--FOREIGN KEY(id_competencia) REFERENCES tab_competenciasedu(id_competencia)
);
*/
---------------------------------------------------------
-- Tabla para registrar los inventarios de las jornadas--
---------------------------------------------------------

CREATE TABLE tab_inventariojornadaedu
(
 id_inventario	BIGINT		NOT NULL,						-- Número del inventario 
 id_jornada		BIGINT 		NOT NULL,						-- Número de la jornada
 id_objeto		BIGINT 		NOT NULL,                       -- Abreviatura del objeto                    
 can_objeto		VARCHAR(256)	NOT NULL,                   -- Cantidad del objeto electrónico 
 usr_insert		VARCHAR(12)	NOT NULL,				   		-- usuario que inserta
 fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  		-- fecha de insercion de datos
 usr_update		VARCHAR(12),						   		-- usuario que actualiza 
 fec_update		TIMESTAMP WITHOUT TIME ZONE,		   		-- fecha que el usuario actualizo
 PRIMARY KEY(id_inventario,id_jornada),
 FOREIGN KEY (id_jornada)REFERENCES tab_jornadasedu(id_jornada),
 FOREIGN KEY (id_objeto)REFERENCES tab_elementosedu(id_objeto)
);

------------------------------------------------------------------
-- Tabla para registrar los inventarios de los puntos de acopio --
------------------------------------------------------------------

CREATE TABLE tab_inventariopuntoaedu
(
 id_inventario	BIGINT		NOT NULL, 							-- Número del inventario
 id_punto		BIGINT 		NOT NULL,							-- Abreviatura del punto de acopio
 id_objeto		BIGINT 		NOT NULL,                       	-- Abreviatura del objeto                     
 can_objeto		VARCHAR(256)	NOT NULL,                    	-- Cantidad del objeto electrónico 
 usr_insert		VARCHAR(12)	NOT NULL,				   			-- usuario que inserta
 fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  			-- fecha de insercion de datos
 usr_update		VARCHAR(12),						   			-- usuario que actualiza 
 fec_update		TIMESTAMP WITHOUT TIME ZONE,		   			-- fecha que el usuario actualizo
 PRIMARY KEY(id_inventario,id_punto),
 FOREIGN KEY (id_punto)REFERENCES tab_puntodeacopioedu(id_punto),
 FOREIGN KEY (id_objeto)REFERENCES tab_elementosedu(id_objeto)
);

-----------------------------------------------------------
-- Tabla para registrar los niños que tienen acceso full --
-----------------------------------------------------------
CREATE TABLE tab_vipedu
(
 id_vip			NUMERIC			NOT NULL, 							-- Consecutivo de la tabla
 id_nino		NUMERIC 		NOT NULL,                       	-- Tarjeta de Identidad del niño                 
 id_grupo		NUMERIC 		NOT NULL,							-- Identificador del grupo (100-199)
 usr_insert		VARCHAR(12)		NOT NULL,				   			-- usuario que inserta
 fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  			-- fecha de insercion de datos
 usr_update		VARCHAR(12),						   			-- usuario que actualiza 
 fec_update		TIMESTAMP WITHOUT TIME ZONE,		   			-- fecha que el usuario actualizo
 PRIMARY KEY(id_vip,id_nino),
 FOREIGN KEY (id_nino)REFERENCES tab_ninosedu(id_nino),
 FOREIGN KEY (id_grupo)REFERENCES tab_gruposedu(id_grupo)
);


------------------------------------------------------------------
-- Tabla para registrar los inventarios de los puntos de acopio --
------------------------------------------------------------------


--------------------------------
-- Tabla para los tab_diasedu --
--------------------------------
/*CREATE TABLE tab_diasedu
(
	id_dia		VARCHAR(3)	NOT NULL,					   -- Abreviatura de los días de la semana
	nom_dia		VARCHAR(10)	NOT NULL,					   -- Nombre de los días de la semana
	usr_insert		VARCHAR(12)	NOT NULL,				   -- usuario que inserta
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
	usr_update		VARCHAR(12),						   -- usuario que actualiza 
	fec_update		TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
	PRIMARY KEY(id_dia)
);
--------------------------------
-- Tabla para los tab_mesesedu--
--------------------------------
CREATE TABLE tab_mesesedu
(
	id_mes			VARCHAR(3)	NOT NULL,				   -- Abreviatura de los meses del año
	nom_meses		VARCHAR(10)	NOT NULL,				   -- Nombre de los meses del año
	usr_insert		VARCHAR(12)	NOT NULL,				   -- usuario que inserta
	fec_insert		TIMESTAMP WITHOUT TIME ZONE	NOT NULL,  -- fecha de insercion de datos
	usr_update		VARCHAR(12),						   -- usuario que actualiza 
	fec_update		TIMESTAMP WITHOUT TIME ZONE,		   -- fecha que el usuario actualizo
	PRIMARY KEY(id_mes)
);*/

--CREATE TABLE tab_asistenciasedu
--(
	--id_nino			NUMERIC 		NOT NULL, 			-- Tarjeta de Identidad del niño
	--nom_nino		VARCHAR			NOT NULL,			-- Nombre del niño
	--id_mes			VARCHAR(3)		NOT NULL,			-- Abreviatura de los meses del año 
	--PRIMARY KEY(id_nino)
--);
---------------------
-- FIN TABLAS (14) --
---------------------

-----------------
-- FUNCION (2) --
-----------------

---------------------------------------------------------------------------------------
-- FUNCION PARA GESTIONAR LA AUDITORIA DE INSERCION Y ACTUALIZACION EN LA MISMA TABLA --
----------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fun_auditoriaedu() RETURNS "trigger" AS $$
BEGIN
 IF TG_OP = 'INSERT' THEN
	NEW.usr_insert = CURRENT_USER;
	NEW.fec_insert = CURRENT_TIMESTAMP;
 END IF;
 IF TG_OP = 'UPDATE' THEN
	NEW.usr_update = CURRENT_USER;
	NEW.fec_update = CURRENT_TIMESTAMP;
 END IF;
 RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

-------------------------------------------------------------
-- FUNCION PARA COMPROBAR QUE CURSO REQUIERE EL ESTUDIANTE --
-------------------------------------------------------------
/*
CREATE OR REPLACE FUNCTION 	fun_cursoedu() RETURNS "trigger" AS $$
DECLARE pminimo tab_parametrosedu.puntajemin%TYPE;
BEGIN
	SELECT tab_parametrosedu.puntajemin INTO pminimo FROM tab_parametrosedu;
	IF NEW.resul_suma <= pminimo THEN
		UPDATE tab_ninosedu SET ind_suma = TRUE WHERE id_nino = NEW.id_nino;
	END IF;
	IF NEW.resul_resta <= pminimo THEN
		UPDATE tab_ninosedu SET ind_resta = TRUE WHERE id_nino = NEW.id_nino;
	END IF;
	IF NEW.resul_multi <= pminimo THEN
		UPDATE tab_ninosedu SET ind_multi = TRUE WHERE id_nino = NEW.id_nino;
	END IF;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;
*/
-----------------
-- FUNCION (2) --
-----------------

---------------------------------- Función para cambiar el indicador vip y asignar niños a los grupos ------------------------------
CREATE OR REPLACE FUNCTION fun_vipedu() RETURNS "trigger" AS $$
	DECLARE mconsec	 	tab_vipedu.id_vip%TYPE;
	DECLARE variable 	BIGINT;
	DECLARE ecursor  	REFCURSOR;
	DECLARE eregistro	RECORD;
	DECLARE ecursor1	REFCURSOR;
	DECLARE	eregistro1	RECORD;
BEGIN
	mconsec=0;
	SELECT MAX(id_vip) INTO mconsec FROM tab_vipedu;
	IF mconsec IS NULL THEN
	   mconsec=1;
	ELSE
		mconsec = mconsec+1;
	END IF;
	--INSERT INTO tab_vipedu VALUES(mconsec);
	--SELECT id_nino FROM tab_ninosedu INTO variable WHERE EXISTS( SELECT id_nino FROM tab_vipedu WHERE id_nino = variable);
	OPEN ecursor FOR SELECT * FROM tab_ninosedu;
		FETCH ecursor INTO eregistro;
		WHILE FOUND LOOP
			IF eregistro.id_nino = NEW.id_nino THEN
				UPDATE tab_ninosedu SET ind_vip=TRUE WHERE id_nino = NEW.id_nino;
			END IF;
			FETCH ecursor INTO eregistro;
		END LOOP;
	CLOSE ecursor;
	RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

------------------------------------- Función para la auditoria --------------------------------------------
CREATE OR REPLACE FUNCTION fun_auditotaledu() RETURNS "trigger" AS $$
DECLARE wconsec tab_auditoriaedu.id_consec%TYPE;
BEGIN
 wconsec = 0;
 SELECT MAX(id_consec) INTO wconsec FROM tab_auditoriaedu;
 IF wconsec IS NULL THEN
	wconsec = 1;
 ELSE
	wconsec = wconsec + 1;
 END IF;
 INSERT INTO tab_auditoriaedu VALUES(wconsec,TG_TABLE_NAME,TG_OP,CURRENT_USER,CURRENT_TIMESTAMP);
 RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;



CREATE OR REPLACE FUNCTION fun_grupoedu() RETURNS "trigger" AS $$
DECLARE econsec 		tab_vipedu.id_vip%TYPE;
DECLARE ecursorgrup		REFCURSOR;
DECLARE eregistrogrup 	RECORD;
DECLARE can_profesor 	NUMERIC;
DECLARE grupo 			NUMERIC;
DECLARE wconsec			NUMERIC;
DECLARE id_grupo		NUMERIC;
BEGIN
econsec = 0;
id_grupo = 100;
SELECT MAX (id_vip) INTO econsec FROM tab_vipedu;
IF wconsec IS NULL THEN
	wconsec = 1;
 ELSE
	wconsec = wconsec + 1;
 END IF;
OPEN ecursorgrup FOR SELECT * FROM tab_gruposedu;
		FETCH ecursorgrup INTO eregistrogrup;
		WHILE FOUND LOOP
		SELECT MAX (id_grupo) INTO grupo FROM tab_gruposedu;
		IF grupo IS NULL THEN
			grupo = 100;
 		ELSE
			grupo = grupo + 1;
 		END IF;
		SELECT COUNT (id_profesor) INTO can_profesor FROM tab_gruposedu WHERE id_profesor = eregistrogrup.id_profesor;
			IF can_profesor < tab_parametrosedu.gruposmax THEN
				INSERT INTO tab_gruposedu VALUES (grupo,eregistrogrup.id_profesor);
				END IF;
				FETCH ecursorgrup INTO eregistrogrup;
				END LOOP;
CLOSE ecursorgrup;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

------------------------ Función para saber quien tiene el full acceso de EduLab (Taller presencial) -------------------------------
--CREATE OR REPLACE FUNCTION fun_vip()

-----------------
-- TRIGGER (24)--
-----------------

/*-------------------------------------
-- trigger para la tab_talleresedu --
-------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_talleresedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();*/
----------------------------------
-- trigger para la tab_ninosedu --
----------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_ninosedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
-----------------------------------------
-- trigger para la tab_competenciasedu --
-----------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_competenciasedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();

------------------------------------------
-- trigger para la tab_convocatoriasedu --
------------------------------------------
/*CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_convocatoriasedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();*/
---------------------------------------
-- trigger para la tab_profesoresedu --
---------------------------------------

CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_profesoresedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
---------------------------------------
-- trigger para la tab_acudientesedu --
---------------------------------------

CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_acudientesedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
-------------------------------------
-- trigger para la tab_usuariosedu --
-------------------------------------
/*CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_usuariosedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();*/
--------------------------------------
-- trigger para la tab_elementosedu --
--------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_elementosedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
------------------------------------------
-- trigger para la tab_puntodeacopioedu --
------------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_puntodeacopioedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
---------------------------------------
-- trigger para la tab_inventariopuntoaedu --
---------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_inventariopuntoaedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
-------------------------------------
-- trigger para la tab_jornadasedu --
-------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_jornadasedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
----------------------------------------------
-- trigger para la tab_inventariojornadaedu --
----------------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_inventariojornadaedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
---------------------------------------
-- trigger para la tab_parametrosedu --
---------------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_parametrosedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
-----------------------------------
-- trigger para la tab_gruposedu --
-----------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_gruposedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
---------------------------------
-- trigger para la tab_testedu --
---------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_testedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
--------------------------------
-- trigger para la tab_vipedu --
--------------------------------
CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT OR UPDATE ON tab_vipedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditoriaedu();
---------------------------------
-- trigger para la tab_testedu --
---------------------------------
/*CREATE TRIGGER tri_cursoedu
AFTER INSERT ON tab_testedu
FOR EACH ROW EXECUTE PROCEDURE fun_cursoedu();*/

---------------------------------
-- trigger para la tab_testedu --
---------------------------------
/*CREATE TRIGGER tri_auditoriaedu
BEFORE INSERT ON tab_ninosedu
FOR EACH ROW EXECUTE PROCEDURE fun_();*/

-----------------------------------------------------------------------

------------------------------------
------Trigers para la auditoria-----
------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_ninosedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
-----------------------------------------
-- trigger para la tab_competenciasedu --
-----------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_competenciasedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
---------------------------------------
-- trigger para la tab_profesoresedu --
---------------------------------------

CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_profesoresedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
---------------------------------------
-- trigger para la tab_acudientesedu --
---------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_acudientesedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
--------------------------------------
-- trigger para la tab_elementosedu --
--------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON  tab_elementosedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
------------------------------------------
-- trigger para la tab_puntodeacopioedu --
------------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_puntodeacopioedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
---------------------------------------
-- trigger para la tab_inventariopuntoaedu --
---------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_inventariopuntoaedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
-------------------------------------
-- trigger para la tab_jornadasedu --
-------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_jornadasedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
----------------------------------------------
-- trigger para la tab_inventariojornadaedu --
----------------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_inventariojornadaedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
---------------------------------------
-- trigger para la tab_parametrosedu --
---------------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_parametrosedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
-----------------------------------
-- trigger para la tab_gruposedu --
-----------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_gruposedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
---------------------------------
-- trigger para la tab_testedu --
---------------------------------
CREATE TRIGGER tri_auditotaledu
AFTER INSERT OR UPDATE OR DELETE ON tab_testedu
FOR EACH ROW EXECUTE PROCEDURE fun_auditotaledu();
---------------------------------
-- trigger para la tab_vipedu --
---------------------------------
CREATE TRIGGER tri_vipedu
AFTER INSERT ON tab_vipedu
FOR EACH ROW EXECUTE PROCEDURE fun_vipedu ();
---------------------------------
-- trigger para la tab_vipedu --
---------------------------------
CREATE TRIGGER tri_grupo
BEFORE INSERT ON tab_vipedu
FOR EACH ROW EXECUTE PROCEDURE fun_grupoedu ();
----------------------
----------------------
-- FIN TRIGGER (26) --
----------------------


------------
-- INSERT --
------------

-------------------------------------------- tab_diasedu -------------------------------------------
/*
INSERT INTO tab_diasedu VALUES ('LUN','Lunes');
INSERT INTO tab_diasedu VALUES ('MAR','Martes');
INSERT INTO tab_diasedu VALUES ('MIE','Miércoles');
INSERT INTO tab_diasedu VALUES ('JUV','Jueves');
INSERT INTO tab_diasedu VALUES ('VIE','Viernes');
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-------------------------------------------- tab_mesesedu ------------------------------------------

INSERT INTO tab_mesesedu VALUES ('ENE','Enero');
INSERT INTO tab_mesesedu VALUES ('FEB','Febrero');
INSERT INTO tab_mesesedu VALUES ('MAR','Marzo');
INSERT INTO tab_mesesedu VALUES ('ABR','Abril');
INSERT INTO tab_mesesedu VALUES ('MAY','Mayo');
INSERT INTO tab_mesesedu VALUES ('JUN','Junio');
INSERT INTO tab_mesesedu VALUES ('JUL','Julio');
INSERT INTO tab_mesesedu VALUES ('AGO','Agosto');
INSERT INTO tab_mesesedu VALUES ('SEP','Septiembre');
INSERT INTO tab_mesesedu VALUES ('OCT','Octubre');
INSERT INTO tab_mesesedu VALUES ('NOV','Noviembre');
INSERT INTO tab_mesesedu VALUES ('DIC','Diciembre');*/
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
-------------------------------------------- tab_parametrosedu ------------------------------------------
INSERT INTO tab_parametrosedu VALUES (2017,10,3,4);
----------------------------------------------------------------------------------------------------

----------------
-- FIN INSERT --
----------------
