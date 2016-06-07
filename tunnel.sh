#!/bin/bash

tunnel_chk() {

    # Your Individual Informations.
    PEM_LOC="{your_pem_location}"
    ID="{access_ID}"
    ADDR="{access_Addr}"
    PORT="{access_Port}"

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

# usage
# tunnel_chk L/R port:host:port timeout_interval
tunnel_chk R 2222 localhost 22 5
