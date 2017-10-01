# SSH-Tunnel-Auto-reconnecting

There are no tools or scripts that automatically reconnect SSH Tunneling.
Autossh usually break its connection when running in more than 3 or 4 days.
This bash script checks whether port connection is open (in periodically, if you use Crontab) 
by using /dev/tcp. It automatically detects whether tunneling is broken. 
If that happened, it'll kill tunneled process and retunnel.
This bash script is intended for LINUX environments(Ubuntu/Centos).

Steps to Use this Scirpt.

## 1. Clone to Your Directory.
    $ git clone https://github.com/mgwoo/SSH-Tunnel-Auto-reconnecting.git

## 2. Replace with Your Login Informations.

    // Inside of tunnel.sh
    // Your Individual Informations.

	// PEM_LOC is optional parameter for SSH login.
    PEM_LOC="{your_pem_location}"
    ID="{access_ID}"
    ADDR="{access_Addr}"
    PORT="{access_Port}"    

## 3. Give an Execution Permission

    $ chmod a+x /path/to/your/dir/tunnel.sh 

## 4. Crontab Settings.

Setting this scripts will execute in periodically.

    $ crontab -e

    # inside crontab settings.
    * * * * * /bin/bash /path/to/your/dir/tunnel.sh
    # or other periods. 
	# (* * * * * means every minutes)

## 5. Check whether Your Tunneling is Alive.
    $ ps -ef | grep port:addr:port
