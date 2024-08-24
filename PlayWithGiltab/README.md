# PlayWithGiltab  

 - To install gitlab we need run this  
```bash
#======================================================  
# https://about.gitlab.com/install/?version=ce#ubuntu #  
#======================================================

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl
  #sudo apt-get install -y postfix # Notification solution
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ce #=16.2.3-ee.0 (specific version)
# cat /etc/gitlab/initial_root_password # (default user - root)
```  

 <img width="1204" alt="image" src="https://github.com/user-attachments/assets/6c262054-2edc-4947-b96b-33fb9cdb3048">   

 - Next we shoud create a new user    
Menu button - Admin - Dashboard - Users - New User.  
 - Lets create our new project and open it for commiting directly to master
   <img width="1468" alt="image" src="https://github.com/user-attachments/assets/1b2ba212-6aba-472c-a60b-9457cc686841">
Otherwise we will end up with an error  
    ```
    remote: GitLab: You are not allowed to force push code to a protected branch on this project.
    To https://gitlab.example.com/Vitali/poject01.git
     ! [remote rejected] main -> main (pre-receive hook declined)
    error: failed to push some refs to 'https://gitlab.example.com/Vitali/poject01.git'
    ```
 - Attaching our client to gitlab repo  
```bash  
git config --global user.name "Vitali"
git config --global user.email "gitlab@vitali.com"

git init .
git remote add origin https://gitlab.example.com/Vitali/poject01.git # Edit your host file "192.168.1.145 gitlab.example.com gitlab"
git branch -M main
git add .
git commit -m "Init commit"
git config --global http.sslverify false # to avoid missing cert
```

