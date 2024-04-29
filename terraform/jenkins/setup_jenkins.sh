# give jenkins superuser right
sudo visudo
# Now add the below lines in your sudoers file :
jenkins ALL=(ALL) NOPASSWD: ALL
# While saving the file remember saving it in /etc/sudoers, not in etc/sudoers.tmp.

# After that restart your Jenkins server by using below command.

sudo service jenkins start