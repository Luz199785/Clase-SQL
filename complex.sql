SELECT * FROM afiliados
WHERE TIP_SAN_RH in (SELECT  
j.*
FROM tipo_sangre as s join json_table(
  replace(json_array(s.RECIBE), ',', '","'),
  '$[*]' columns (name varchar(50) path '$')
) j
WHERE s.RH = "AB-");




SELECT * FROM afiliados
WHERE TIP_SAN_RH in (SELECT  
SUBSTRING_INDEX(s.RECIBE, ",", -1) as v2
FROM tipo_sangre as s
WHERE s.RH = "AB-"
union all
SELECT  
SUBSTRING_INDEX(s.RECIBE, ",", 1) as v1
FROM tipo_sangre as s
WHERE s.RH = "AB-");
