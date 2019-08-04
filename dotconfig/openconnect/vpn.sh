#! /bin/bash

USERNAME=you_name
PASSWD=`gpg2 -q --no-tty --batch -d /path/to/your_gpg_file`
SERVER=your_server
GROUP=your_group
read -p "Token Number:" TOKEN

(echo $PASSWD; echo $TOKEN) | \
     sudo openconnect --passwd-on-stdin --authgroup=$GROUP -u $USERNAME $SERVER
