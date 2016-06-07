#!/bin/bash

tunnel_chk() {

    # Your Individual SSH Connection Inf.
    PEM_LOC="/path/to/pem/login.pem"
    ID="exampleID"
    ADDR="exampleAddr.com"
    PORT="22"

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

# Usage
# tunnel_chk L/R port:host:port timeout_interval
# You can add multiple lines of this functions: SSH tunneling connections.
tunnel_chk R 2222 localhost 22 5
