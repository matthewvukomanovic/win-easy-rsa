# Overview
This is just my own quick start point for getting Easy-RSA running on windows, because following the instructions on there didn't work for me.

The main git repository is https://github.com/OpenVPN/easy-rsa (though this is not a branch of that)

# Install Steps Which I Followed
1. Install git (I used Git-2.8.2-64-bit.exe) it has sh in it and that one actually works!
2. Double clicking on `shell-init.sh` was running through git-bash which was fine for some computers but others required just sh
    * If double clicking on `shell-init.sh` behaves strangely run the `sh.reg` which changes the entry for the sh key to run sh.exe instead. _Look at the contents of the file first to make sure that you are happy with it_

That should be it..

I went through a lot more trying to get it to work. But the tools inbuilt with the newer git's seem to do the trick.

# OpenVPN Files and Setup
For the details of how to make the files discussed below look in the README.quickstart.html file and the doc folder

Under `vpn` I have two folders one for the `client` and one for the `server` files
## Server
1. Modify the `server.ovpn` file to suit your requirements
2. Include all the files listed in the `ServersRequire.txt`

## Client
You will need to include the files listed in the `ClientsRequire.txt` file.

### XXX.ovpn
The XXX.ovpn file is one that I have to make it easier to create new client ones, it's not a specific client one itself (though it could be).

#### Local and Remote Connection
The file contain two `remote` addresses
The first is a local ip, the second a remote address.

I create two files normally one for when I'm at the local place (but still want to connect to the vpn) and one for when at a remote site (so don't want to try connecting locally) 
One called `$clientname$.ovpn` and the other called `$clientname$-external.ovpn`

#### Modifying the file XXX.ovpn for a default file
1. Change `XXX.ovpn` file to match the changes you made for the sever.ovpn file
    * Note that any place in the file you want to refer to a client specific thing then you should use XXX instead of the clients name for the default file
2. Change the first remote address to be your internal network ip
3. Change the second remote address to be your external connection details

#### Using VIM for Create the Client files
I use [vim][1] to quickly create new files if this is not what you want then look at the `Manual Copy Method` below

#### Using VIM for Create the Client files (easy)
This is the easiest method now and what I'm going to be using.
__you need to have gvim and vim in your system path variable for it to work__

Delete the two vim lines in the XXX.ovpn (since this method doesn't need them) (they start with # %s )

Edit the `clientgen.vim` file

If you aren't going to create two files then delete the first command and change the Ccs to Cc (or modify the bat file to call Ccs instead of Cc)

If you do want to create two then modify the %s/^remote 192\.168\.0\.2 to match the first remote line in your XXX.ovpn

#### Using VIM for Creating the Client File (manual)

If you aren't going to create two files then delete the first %s line since we should only need the second

If you do want to create two then modify the %s/^remote 192\.168\.0\.2 to match the first remote line later in the file (and delete the second %s)

#### Create client specific file (VIM easy)

1. open a command prompt in the client directory
2. type `makeclientfile clientname` where clientname is the name of the client files to create (note fails with spaces)

or

1. run the makeclientfile.bat
2. type the name of the client (once again doesn't allow spaces)

or

1. run the makeclientfile.bat
2. press enter (without client name)
3. type `:Cc clientname` and press enter `:Ccs clientname` if you are only creating a single file

#### Create client specific file (VIM manual)
1. Run a command ine vim to replace XXX with your client name e.g., `:%s/XXX/ClientName/g`
2. Copy the %s line in the file now and run the whole thing, this creates the ClientName.ovpn file (and potentially the ClientName-external.ovpn file)
3. Press u to undo the YYY change and you are ready to do another client

For those who don't know vim:
* Pressing : will allow you to enter in that %s command
* You can select with the mouse the %s command then press copy to copy it
* You can paste into the command section to run the generated command

[1]: http://www.vim.org

#### Manual Copy Method
If you are not going to use vim then in XXX.ovpn delete the two lines starting with # %s near the beginning of the file

#### Create client specific file (Manual)
Then when creating the actual client file:

1. Search and replace the XXX with the name of the client key files
2. Save as a different file (so that you don't need to redo the XXX part)
3. Remove the first (local) remote address
4. Save as a different ovpn file (this is the file for only connecting via the external address)
