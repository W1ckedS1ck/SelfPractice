<p align="center"> 
  <img width="250" height="250" src="https://talks.freelancerepublik.com/wp-content/uploads/2021/02/GitLab_Logo.svg-696x643.png">
</p>  

# PlayWithGiltab  
***
 - To install gitlab we need run this  
    ```bash
    #======================================================  
    # https://about.gitlab.com/install/?version=ce#ubuntu #  
    #======================================================
    sudo apt-get update
    sudo apt-get install -y curl openssh-server ca-certificates tzdata perl
    # sudo apt-get install -y postfix # Notification solution
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
***
## How to connect to your repository via SSH key
 - Keypair can be genereted by entering  
   ```bash
   ssh-keygen
   cat ~/.ssh/*.pub
   ```
   After we need to go to YOUR_ACCOUNT - EDIT PROFILE - SSH keys - ADD new key
   <img width="1389" alt="image" src="https://github.com/user-attachments/assets/35217e37-1a77-458d-aa4a-274a8690cfa9">
   ```bash
   git clone git@gitlab.example.com:Vitali/poject01.git
   ```  
 - Another option is create the service account (it can be applied to all projects or specific one:  
   Go to ADMIN SETTINGS - DEPLOY KEYS - New Deploy Key.  
   After that this key sould be enabled in project settings - repository - deploy keys - expand - Publicity accesible deploy keys - ENABLE.
  ***
  ## Gitlab CI + Runners
 - Runner Install & Register
     ```
     curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
     apt-get install gitlab-runner
     gitlab-runner register
     ```
     We do not need to connect runners if we work in gitlab in [web](https://gitlab.com) like separate instances.  
   - In gitlab.com we can create our runner easily by pressing  
      Project settings - CI\CD - Runners - [New Project Runner](https://gitlab.com/learning4800734/Runners/-/runners/new)
      <img width="781" alt="image" src="https://github.com/user-attachments/assets/6813e615-14cc-4d5b-b2b5-53e4eb765ac1">  
       - To create a group runner we need to press New group runner and run this
      ```bash
      gitlab-runner register  --url https://gitlab.com  --token glrt-OUR_TOKEN  
      gitlab-runner run
      ```
 - Lets create our first pipeline:
   ```bash
   touch .gitlab-ci.yml
   echo "
   stages:
     - build
   
   test_job:
     stage: build
     script:
       - echo "Running tests...
       - echo uname -a"
   " > .gitlab-ci.yml
   ```
 - It's time to create something interesting and useful.  
I made a simple pipeline to install Apache using the file [.gitlab-ci.yml](https://github.com/W1ckedS1ck/SelfPractice/blob/main/PlayWithGiltab/.gitlab-ci.yml)
We have several steps:
   * Step 1: Setup Environment
   * Step 2: Install Apache
   * Step 3: Configure Apache
   * Step 4: Test Installation
   * Step 5: Get external IP
   This is what I got
   <img width="857" alt="image" src="https://github.com/user-attachments/assets/5cf7ca39-731d-4d3e-aa30-3f7defd057fe">
   
   It's time to look at the last step, where the ip is indicated and go to it.
   <img width="813" alt="image" src="https://github.com/user-attachments/assets/dd522af5-1bf9-42b0-a2a9-bb7725b0ccee">
***
## Container Registry
 - To create our docker storage we need:
    - First of all we need to create a token with "read and write registry" option  
      Settings - Edit Profile - Access tokens - Create. Make sure you save it - you won't be able to access it again.
    - Connect our instance to registry  
      PROJECT - Deploy - Container Registry. Follow the hints!
      ```bash
      docker login registry.gitlab.com                                                # login - git, PW - token
      docker tag my_image registry.gitlab.com/learning4800734/runners my_image:V1     # Rename according to the manual.
      docker push registry.gitlab.com/learning4800734/runners/my_image:V1             # Upload our image to the registry.
      docker rmi registry.gitlab.com/learning4800734/runners/my_image:V1              # We remove it from our local machine.
      docker run --rm --name my_image -p 8001:80 registry.gitlab.com/learning4800734/runners/my_image:V1
      ```
   <img width="225" alt="image" src="https://github.com/user-attachments/assets/2aa0785a-a0f0-4659-a5c6-5775f732f1df">  
   <img width="400" alt="image" src="https://github.com/user-attachments/assets/5263b7e4-9499-4ea9-be98-b182b3ec858e">
***
