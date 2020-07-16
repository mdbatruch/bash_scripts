#!/bin/bash

#Automated SFTP Transfer
HOST='HOSTNAME'
USER='USERNAME'
PASSWD='PASSWORD'

function upload {
    read -p "Enter Filename to upload " file

    while [[ ! -f $file ]]; do
            read -p "There is no such file! Try Again! " file
    done

     sftp $HOST <<EOF

        user ${USER} ${PASSWD}
        put $file
        quit
EOF

read -p 'Your file has been uploaded to the server! Would you like to add another file?' yn

if [ "$yn" = 'y' ]; then 
    upload
elif [ "$yn" = 'n' ]; then
    exit
else
    read -p 'Unsure what this response is. Please try again!' yn
fi

}

upload
