#!/bin/sh

RESULT=`ls /tmp/usr/bin/xray`
            if [ "$RESULT" == "/tmp/usr/bin/xray" ]; then


            echo -e "${GREEN} XRAY OK ${GREEN}"


logger -t check_internet "XRAY is OK"


 else
           logger -t check_internet "XRAY failed"

           
            sleep 3
            service amir start

fi

NUM=`pgrep passwall | grep -o '[[:digit:]]*' | sed -n '1p'`

    if [ "$NUM" -gt "2" ]; then

    echo "PASSWALL OK"

    logger -t check_internet "PASSWALL IS OK"

    exit 1

  else

   echo "PASSWALL FAILED"

   logger -t check_internet "PASSWALL NOT OK"

   /etc/init.d/passwall restart


fi



