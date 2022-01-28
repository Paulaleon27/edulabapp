<?php

$con = "host='10.71.252.89' port='5432' dbname='db_edulab' user='edulab' password='Marpa1093067'";

$postgres = pg_connect($con) or die ("Ya casi conecta :D".pg_last_error());
if(!$con){
	echo "esto no funciona";
}else{
	echo "felicidades, conectó";
}
?>