[![Docker Pulls](https://img.shields.io/docker/pulls/amitdalal/imapsync.svg)](https://hub.docker.com/r/amitdalal/imapsync)

# imapsync
#

## Please make sure you have got a working copy of the docker running to use this software.

## Usage docker run amitdalal/imapsync imapsync {followed by regular imapsync commands}


# What is imapsync?

Imapsync is a method used in email migration. Imapsync copies mailboxes from one server to another during migration. 
For performing imapsync, the email accounts should use IMAP protocol instead of POP3. 
Imapsync is a good tool for copying mailboxes because it will not transfer emails which is present on both servers. 
And also preserves the flags read, sent, unread. That means read will stay read, unread will stay unread, deleted will stay deleted on the new server. 
To perform imapsync during migration we need to know the following details:

1) IMAP server name at old hosting.

2) Create all the email accounts under new host and

3) List the details of email accounts in the following format

“oldusername” “oldpassword” “newusername” “newpassword”

 

IMAP:

IMAP is a standard email protocol and it stands for Internet Message Access Protocol. 
IMAP stores email messages on a mail server but allow the end-user to view and manipulate the messages as though they were stored locally on the end user’s computing device(s).

 

POP3:

POP3 stands for Post Office Protocol. 
It is another protocol used to access emails. 
POP3 downloads email from a server to a single computer then deletes it from the server.

 

1) Get Docker installed

docker pull amitdalal/imapsync

 
2) Migration.

We can access an IMAP account with three parameters. The parameters are;

1) The IMAP server host. It’s a server name or an IP address

2) The username

3) The password

Since the imapsync job is to sync two IMAP accounts we need to know both server’s hostname, username, and password for proceeding with the syncing. 
The basic command format for imapsync is


docker run amitdalal/imapsync imapsync \

–host1 old.mailserver.com –user1 test@domain.com –password1 mypasswd \

–host2 new.mailserver.com –user2 test@domain.com –password2 mypasswd

Here we use the –password1 and –password2 switches for the passwords, 
but this is not a secure way because the passwords would appear in the output of ps -aux. 
So for ensuring security, we will create two files that contain passwords and change the permission of the files to 600. 
After creating the files, we can use the switches –passfile1 and –passfile2 instead of the –password1 and –password2.

Now we can migrate with the below command:

docker run amitdalal/imapsync imapsync –host1 server1.example.com –user1 sales@example.com –passfile1 /filename of passwords –host2 server2.example.com –user2 sales@example.com –passfile2 /filename of passwords

After imapsync, we can delete the two password files.
