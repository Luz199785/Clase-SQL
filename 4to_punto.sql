select sum(ta.codigo) as total, c.nombre as ciudad, ta.nombre as tipo from afiliados as a
inner join tipo_afiliaciones ta on a.tip_afil_codigo = ta.codigo
inner join ciudades c on c.codigo = a.ciu_direc_codigo
where ta.nombre = 'COTIZANTES'
group by a.ciu_direc_codigo, c.nombre, ta.nombre;
