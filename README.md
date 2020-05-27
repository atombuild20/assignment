Task1:
Using Ansible to create two virtual machine in Azure .The virtual Machine can communicate internal (ping) and external (ssh)

To setup environment: ansible-playbook create.yml
To Destroy environment: ansible-playbook destroy.yml
To get the public ip of the instances : bash ipget.sh 
Note: we can alter username,password,intance type in var.yml

Using test.sh script we can monitor disk ,cpu and Network : bash test.sh


Task2:
Using Bash script we can able to install on docker in Ubuntu : bash dockerinstall.sh

Using Bash script we can create elasticsearch container : bash dockercontainer.sh 
(Note:Open port 9200,9300 on host and firewall)

Using Bash script we can check the health of the elastic container : bash dockerhealth.sh

Task3:
There is no port 6379 open for redis in the server.

Solution:
Allow firewall rules
1.switch to root and use "ufw allow 6379/tcp"
2.check with "ufw status numbered"
3.restart the redis server " systemctl restart redis.service"
4.Check the listen port " ss -ntl"
5.check with redis-cli ping and we get PONG

Task4:
Problem:
The user identity is not set properly

Solution:
In IIS --> go to application pools --> in the server find the application pool for the default site -->select  and go to advanced settings ,select the identity and change the user to Localsystem.If any user added means we want add that username and password

Then click the applicationpool and select Recycle to restart .


