# SSH-Tunnel-Auto-reconnecting

There are not tools or scripts that automatically reconnect SSH Tunneling. 
Autossh connection is broken in a few times when run in more than 3 or 4 days.
This scripts check whether port connection is open (in periodically, if you use Crontab) by using nc command. If tunneling is broken, then kill SSH process and retunneling.

Steps to Use this Scirpts.

1. Clone tunnel.sh to your directory.
2. Replace with your informations.

    # tunnel.sh
    # Your Individual Informations.

    PEM_LOC="{your_pem_location}"
    ID="{access_ID}"
    ADDR="{access_Addr}"
    PORT="{access_Port}"    

3. Give execution permission

    $ chmod a+x /path/to/your/dir/tunnel.sh 

4. Crontab settings.

Setting this scripts will execute in periodically.

    $ crontab -e

    # inside crontab settings.
    * * * * * /bin/bash /path/to/your/dir/tunnel.sh
    # or other periods.

5. Check whether your tunneling is alive.
    $ ps -ef | grep port:addr:port

