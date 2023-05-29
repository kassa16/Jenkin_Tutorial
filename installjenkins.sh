#!/bin/bash
echo "# $(date) Installation is starting."

echo "# $(date) Install jenkins and package configuration..."

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyrings.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
#Install java, nginx, and jenkins
echo "# $(date) Install Java 1"
apt update
apt-get -qq upgrade 

#In the bash script command apt-get -qq install, the -qq option is used with the apt-get command.
#The -qq option stands for "quiet" or "quiet mode." When used with apt-get, 
#it suppresses most or all of the output and progress information, making the installation process less verbose. It reduces the amount of text that is displayed on the terminal, providing a more silent or minimal output.

apt-get -qq install \  # backslashes \ used to indicate that the command continues to the next line.
     openjdk-11-jdk \
     nginx \
     jenkins 

echo "# $(date) Restart Jenkins ... "
systemctl restart jenkins

echo "#$(date) Copy the initial admin passowrd to the root user's home directory..."
cp /var/lib/jenkins/secrets/initialAdminPassword ~


clear
echo "Installation is complete."

echo "#Open the URL for this server in a browser and log in with the follwoing credentials:"
echo 
echo 
echo " Useradmin = admin"
echo "$(cat /var/lib/jenkins/sercets/initialAdminPassword)" #!/bin/bash

echo "# $(date) Installation is starting."

echo "# $(date) Install Jenkins and package configuration..."

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "# $(date) Install Java 1"
sudo apt update
sudo apt-get -qq upgrade

echo "# $(date) Install Java, Nginx, and Jenkins"
sudo apt-get -qq install \
    openjdk-11-jdk \
    nginx \
    jenkins

echo "# $(date) Restart Jenkins ... "
sudo systemctl restart jenkins

echo "# $(date) Copy the initial admin password to the root user's home directory..."
sudo cp /var/lib/jenkins/secrets/initialAdminPassword ~

clear
echo "Installation is complete."

echo "# Open the URL for this server in a browser and log in with the following credentials:"
echo 
echo "Username: admin"
echo "Password: $(cat /var/lib/jenkins/secrets/initialAdminPassword)"
