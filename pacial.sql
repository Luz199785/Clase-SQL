SELECT count(a.DOCUMENTO) as total, 
IF(es.NOMBRE = "ESTRATO 1", "ESTRATO UNO", 
IF(es.NOMBRE = "ESTRATO 2", "ESTRATO DOS", 
IF(es.NOMBRE = "ESTRATO 3", "ESTRATO TRES", 
IF(es.NOMBRE = "ESTRATO 4", "ESTRATO CUATRO", 
IF(es.NOMBRE = "ESTRATO 5", "ESTRATO CINCO", 
IF(es.NOMBRE = "ESTRATO 6", "ESTRATO SEIS", 
"ESTRATO RURAL"
)
)
)
)
)
) as renameField
FROM afiliados as a
inner join estratos as es on es.CODIGO = a.ESTRATO_CODIGO
group by es.CODIGO order by es.CODIGO;




CREATE VIEW vista_pruebas as
SELECT
td.NOMBRE_LARGO as nombre_documento, 
a.DOCUMENTO, 
concat(a.PRIMER_NOMBRE, " ", a.SEGUNDO_NOMBRE, " ", a.PRIMER_APELLIDO, " ", a.SEGUNDO_APELLIDO) as nombre_completo,
a.FECHA_NACIMIENTO,
(YEAR(NOW())-YEAR(a.FECHA_NACIMIENTO)) as edad,
IF( a.SEGUNDO_NOMBRE = "" or a.SEGUNDO_NOMBRE = null,  
concat(
	substr(a.PRIMER_NOMBRE, 1,2),
    a.PRIMER_APELLIDO
),
concat(
	substr(a.PRIMER_NOMBRE, 1,1),
    substr(a.SEGUNDO_NOMBRE, 1,1),
    a.PRIMER_APELLIDO
)
)
 as usuario,
ci.NOMBRE as ciudad,
de.NOMBRE as departamento,
ci.DESCRIPCION as pais
FROM afiliados AS a
inner join tipos_documentos as td on td.CODIGO = a.TIPO_DOC_CODIGO
inner join ciudades as ci on ci.CODIGO = a.CIU_DIREC_CODIGO
inner join departamentos as de on de.CODIGO = ci.DEP_CODIGO
order by a.PRIMER_NOMBRE
