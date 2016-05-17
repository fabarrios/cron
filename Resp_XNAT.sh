#!/bin/bash
# scrip to start and stop tomcat in the Xnat server
# then the database backup 
echo "Raiz&Dharma" | sudo -S service tomcat7 stop

pass="xnat01"
export PGPASSWORD="$pass"
pg_dump -v -i -U xnat01 -Fc xnat > /data/XNAT-DB/backup/xnat_$(date +%m%d%y).dump

echo "Raiz&Dharma" | sudo -S service tomcat7 start
# End of the database backup
