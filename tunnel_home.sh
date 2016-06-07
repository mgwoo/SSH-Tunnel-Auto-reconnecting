#!/bin/bash

tunnel_chk() {
    PEM_LOC="{your_pem_location}"
    ID="{access_ID}"
    ADDR="{access_Addr}"
    PORT="{access_Port}"

#    nc -z -v -w5 dorm.heak.xyz 3390
    
    if [ $1 = "L" ]; then
        foo="$(nc localhost $2 -z -w$5)"
        if [ $? != 0 ]; then # port is close
            bar="$(pkill -f $2:$3:$4)"
            ssh -i $PEM_LOC -fN -L $2:$3:$4 $ID@$ADDR -p $PORT
        fi
    else
        foo="$(nc $ADDR $2 -z -w$5)"       
        if [ $? != 0 ]; then # port is close
            bar="$(pkill -f $2:$3:$4)"
            ssh -i $PEM_LOC -fN -R $2:$3:$4 $ID@$ADDR -p $PORT
        fi
    fi
}

# tunnel_chk L/R port:host:port timeout
tunnel_chk R 2223 localhost 22 5
