#!/usr/local/bin/perl
use strict;
use DBI;
use CGI;

print "Content-type: text/html\n\n";
print "<html><body>";
print "<head>";
print "<meta name=viewport; content=width=device-width, initial-scale=1.0;>";
print "<style>";
print ".box0{position: relative;width:1225px;height:690px;padding:10px;background-color:white;}";
print ".box1{position: relative;width:1200px;height:550px;padding:10px;background-color:white;border:2px solid black;}";
print ".box2{width:500px;height:80px;padding:10px;background-color:white;}";
print ".box3{width:600px;height:130px;padding:5px;position: absolute;top: 10px;right: 16px;background-color:white;}";
print "table{margin-left: auto;margin-right: auto;width:1200px;height:250px;}";
print ".firma{position: absolute;bottom: 8px;right: 16px;font-size: 18px;}";
print ".izquierda{text-align:left;}";
print ".encabezado{border-style: dotted; }";
print "h1 {text-align: center;}";
print "</style>";
print "</head>";

print "<div class=box0>";
print "<h1>UNIVERSIDAD MARIANO G&Aacute;LVEZ DE GUATEMALA</h1> ";
print "<div class=box1>";

print "<div class=box2>";
print "ASIGNACI&Oacute;N DE CURSOS<br>";
print "Carnet: 5390-18-10587 <br>";
print "Nombre: FREDY ESTUARDO <br>";
print "Apellidos:REYES DEL CID <br>";
print "Dire.casa: 3RA. 2-31 ANEXO LOS SAUCES, PAL&Iacute;N, ESCUINTLA,PAL&Iacute;N";
print "</div>";

print "<div class=box3>";
print "Semestre/Trimestre: 22022<br>";
print "Carrera:INGENIER&Iacute;A EN SISTEMAS DE INFORMACI&Oacute;N Y CIENCIAS DE LA COMPU <br>";
print "Jornada: Domingo<br>";
print "Ciclo: 10<br>";
print "Mensual: Q. 925.00 <br>";
print "Dire.casa: 3RA. 2-31 ANEXO LOS SAUCES, PAL&Iacute;N, ESCUINTLA,PAL&Iacute;N<br>";
print "Fecha Asig: 15/08/2022 14:17:05";
print "</div>";
print "<br>";
print "<br>";
print "<br>";

print "<table>";
print "<tr >";
print "<th colspan='6' class=encabezado >DETALLE</th>";
print "</tr>";

print "<tr class=izquierda>";
print "<th >Fac</th>";
print "<th>Cod</th>";
print "<th>Nombre del curso</th>";
print "<th>Horario</th>";
print "<th>Aula</th>";
print "<th>Secci&oacute;n</th>";
print "</tr>";

my $db=DBI->connect("DBI:mysql:database=dire_1_0587;host=localhost",'DIRE_1_0587','admin');
my $query=$db->prepare("SELECT * FROM ASIGNACION_DIRE");
$query->execute();

while(my $ref=$query->fetchrow_hashref()){
    print"<tr><td> $ref->{FAC}</td>
              <td> $ref->{COD}</td>
              <td> $ref->{NOMBRE_DEL_CURSO}</td>
              <td> $ref->{HORARIO}</td>
              <td> $ref->{AULA}</td>
              <td> $ref->{SECCION}</td>
    </tr>";
}

print "</table>";

print "<br>";

print "<div>";
print "<b>Usuario:</b> freyesd2 <b>Contrase&ntilde;a</b> 581625Est$ (si no la ha cambiado) <b>Correo Electr&oacute;nico:</b> freyesd2@miumg.edu.gt<br>";
print "INSTRUCCIONES <b>1).</b> Lea detenidamente este documento y proceda a firmarlo en el lugar que corresponde. <b>2).</b> Guarde el original, pues es su constancia OFICIAL DE INSCRIPCI&Oacute;N <br>";
print "y pres&eacute;ntelo para cualquier tr&aacute;mite. <b>3).</b> USTED es el &uacute;nico responsable de los cursos que se asigna. <b> 4).</b> Si USTED, recibe sus cursos en otra secci&oacute;n que no sea la descrita<br>";
print "en este documento, no se le podr&aacute;n ingresar sus notas. <b>5).</b> Aplica MULTA de Q. 25.00 por cada Evaluaci&oacute;n a la que se someta estando insolvente.<br>";
print "<b>EL COSTO DE REPOSICI&Oacute;N DE ESTE DOCUMENTO ES DE Q. 10.00 EN TESORER&Iacute;A</b><br>";

print "<div class=firma>";
print "Firma Alumno:__________________________ ";
print "</div>";

print "</div>";
print "<br>";
print "<br>";
print "<h1>CONOCER&Eacute;IS LA VERDAD Y LA VERDAD OS HAR&Aacute; LIBRES</h1>";
print "</div>";
print "</div>";

print "</body></html>";
$query->finish();
$db->disconnect();

