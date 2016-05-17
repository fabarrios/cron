#!/bin/bash
# scrip to start and stop tomcat in the Xnat server
# then the database backup 
echo "**** ******* ******************** ********** ****"
echo "XNAT-DB databese backup on data"
echo "pgDump STARTED on" `date`

echo "Raiz&Dharma" | /usr/bin/sudo -S service tomcat7 stop

pass="xnat01"
export PGPASSWORD="$pass"
/usr/bin/pg_dump -v -i -U xnat01 -Fc xnat > /data/XNAT-DB/backup/xnat_$(date +%m%d%y).dump

echo "Raiz&Dharma" | /usr/bin/sudo -S service tomcat7 start

# End of the database backup
echo "*************************************************"
echo "XNAT-DB database backup on data"
echo "pgDump ENDED on" `date`
