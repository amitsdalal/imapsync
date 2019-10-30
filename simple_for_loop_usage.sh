#!bin/bash

##Pull the docker image for imapsync. 

docker pull amitdalal/imapsync

for email in `cat location_of_email_list.txt` 
do docker run amitdalal/imapsync imapsync --host1 {imap.source_server.com} --user1 $email --authuser1 {admin user of source_server} --password1  '{Password of admin user at source_server}' --host2  {imap.destination.server.com}  --user2 $email  --authuser2 {destination_server admin user} --password2 '{admin password of destination server}' && echo $email >> done.txt 
done
