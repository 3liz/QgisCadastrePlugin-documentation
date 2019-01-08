#!/bin/sh

while getopts h:p:d:u:w:s:o: option
do
case "${option}"
in
h) DBHOST=${OPTARG};;
p) DBPORT=${OPTARG};;
d) DBNAME=${OPTARG};;
u) DBUSER=${OPTARG};;
w) DBPASS=${OPTARG};;
s) DBSCHEMA=${OPTARG};;
o) OUTPUTDIR=${OPTARG};;
esac
done


# On supprime le contenu du répertoire de sortie
rm -rf $OUTPUTDIR/*

# On cree le repertoire si besoin
mkdir -p $OUTPUTDIR

# On lance schemaspy sur ce schema PostgreSQL
java -jar schemaspy-6.0.0.jar -t pgsql-mat -dp postgresql-42.2.4.jar -host $DBHOST -port $DBPORT -db $DBNAME -u $DBUSER -p $DBPASS -s $DBSCHEMA -o $OUTPUTDIR
