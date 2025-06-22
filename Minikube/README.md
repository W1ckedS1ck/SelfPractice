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
3. The third step - We write (or use) the application that our developers have prepared.  
   Lets check the application is in operable state:
   ```sh
   go build -o app
   ./app
   ```
   <img width="336" alt="image" src="https://github.com/user-attachments/assets/58956dc6-ac2f-4857-9f16-576b3f427a46" />
   <img width="412" alt="image" src="https://github.com/user-attachments/assets/6f5bc33b-bd2d-4164-b253-22a12d62bb2d" />
   IT WORKS :)  
4. The fourth step is to make a simple [dockerfile](https://raw.githubusercontent.com/W1ckedS1ck/SelfPractice/refs/heads/main/Minikube/Dockerfile) but with a multi-stage build so that the application is more lightweight.
   ```sh
   docker build -t k8s-go-app:v1 .
   ```
   <img width="674" alt="image" src="https://github.com/user-attachments/assets/62250ec2-972b-4dc4-94d2-3bda7c328142" />  <br>
   Redone this for my GCP as well  
   <img width="843" alt="image" src="https://github.com/user-attachments/assets/85891ea0-0363-451e-9f53-ed41f8e0ffb0" />  <br>
5. The next step is simple. Since our application is not in the registry, we add it to the minicube and apply the deployment manifest.
   ```sh
   minikube image load k8s-go-app:v1
   kubectl apply -f k8s/deployment.yaml
   ```
   <img width="720" alt="image" src="https://github.com/user-attachments/assets/30d8812e-355b-4322-96ff-7662768c3f01" /> <br>
   Next we should deploy 
   ```sh
   kubectl apply -f k8s/service.yaml
   minikube tunnel
   ```
   <img width="1318" alt="image" src="https://github.com/user-attachments/assets/26a514d0-c967-4c28-881f-04c90f1e027f" /> <br>
6. Let's complicate the task. I want our application from minicube to be accessible from outside.
   ```sh
   sudo snap install ngrok
   ngrok config add-authtoken MY_TOKEN
   ngrok http 10.96.174.36:8080 #The internal IP needs to be substituted.
   ```
   <img width="1732" alt="image" src="https://github.com/user-attachments/assets/10d5b19f-37e7-4675-bf69-abdc52038019" />
7. It's time to check the reliability.
   ```sh
   sudo reboot
   minikube start
   minikube tunnel
   ngrok http 10.96.174.36:8080
   ```
   <img width="1733" alt="image" src="https://github.com/user-attachments/assets/8fd204a2-484d-4532-839b-16a0655031ab" />
