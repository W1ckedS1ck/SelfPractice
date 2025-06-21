# Play with docker / minicube / and maybe something else

 - The goal is to remember how to work with Kubernetes.   
 - The task is to build and deploy an application written in Go and test its operation.

1. First step Launching a new instance on aws
   <img width="671" alt="image" src="https://github.com/user-attachments/assets/e8fee444-629a-48d6-8ff3-8191c6ae89af" />

2. The second step is installing docker on it.
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
3. Third step - We write (or use) the application that our developers have prepared.
