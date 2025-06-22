# Play with docker / minicube / and maybe something else

 - The goal is to remember how to work with Kubernetes.   
 - The task is to build and deploy an application written in Go and test its operation.

1. The first step Launching a new instance on AWS
   <img width="671" alt="image" src="https://github.com/user-attachments/assets/e8fee444-629a-48d6-8ff3-8191c6ae89af" />

2. The second step will be to install Docker, go, minicube on it  
   2.1 Docker
      https://docs.docker.com/engine/install/ubuntu/
      ```sh
      # Add Docker's official GPG key:
      sudo apt-get update
      sudo apt-get install ca-certificates curl
      sudo install -m 0755 -d /etc/apt/keyrings
      sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
      sudo chmod a+r /etc/apt/keyrings/docker.asc
      
      # Add the repository to Apt sources:
      echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
      sudo apt-get update
      
      sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
      
      # Add user to docker group to use without sudo
      sudo usermod -aG docker $USER
      newgrp docker
      docker version
      ```
   2.2 Go  
    ```sh
    sudo apt update
    sudo apt install golang
    go version
    ```
   2.3 K8S (kubectl + minicube)
    ```sh
    #--------Kubectl--------------------------------
    sudo apt-get update && sudo apt-get install -y apt-transport-https
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
    #--------minicube--------------------------------
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && chmod +x minikube
    sudo mkdir -p /usr/local/bin/
    sudo install minikube /usr/local/bin/
    minikube start
    ```
     <img width="1280" alt="image" src="https://github.com/user-attachments/assets/612a4e91-ca67-471d-821b-5ab5c7e8ae23" />      
    AAAAAnnndd it doesn't work in AWS. Not a problem. Lets try to use GCP.  <br>
    <img width="791" alt="image" src="https://github.com/user-attachments/assets/8cac3f82-004b-419f-9149-d07292330496" /> <br>

   2.4 microk8s  
    ```sh
    sudo snap install microk8s --classic
    microk8s status --wait-ready
    alias k='microk8s kubectl'
    ```
4. The third step - We write (or use) the application that our developers have prepared.  
   Lets check the application is in operable state:
   ```sh
   go build -o app
   ./app
   ```
   <img width="336" alt="image" src="https://github.com/user-attachments/assets/58956dc6-ac2f-4857-9f16-576b3f427a46" />
   <img width="412" alt="image" src="https://github.com/user-attachments/assets/6f5bc33b-bd2d-4164-b253-22a12d62bb2d" />
   IT WORKS :)
5. The fourth step is to make a simple [dockerfile](https://raw.githubusercontent.com/W1ckedS1ck/SelfPractice/refs/heads/main/Minikube/Dockerfile) but with a multi-stage build so that the application is more lightweight.
   ```sh
   docker build -t k8s-go-app:v1 .
   ```
   <img width="674" alt="image" src="https://github.com/user-attachments/assets/62250ec2-972b-4dc4-94d2-3bda7c328142" />

