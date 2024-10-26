# Here I plan to practice how to quickly launch local virtual machines for future projects.  
0) Prerequsites  
   VirtualBox, Python3, Ansible, Vagrant should be installed  
1) Lets create our [vagrantfile](https://raw.githubusercontent.com/W1ckedS1ck/SelfPractice/refs/heads/main/Vagrant/Vagrantfile)  
   It consist of several "blocs":
   - Quantity of VM
     ```bash
     N = 2 #Quantity of VM
     (1..N).each do |i|
     ```
   - Preferred OS
     ```bash
     node.vm.box = "ubuntu/jammy64"
     ```
   - Preferred IP's
     ```bash   
     node.vm.network "private_network", ip:"10.0.26.1#{i}"
     ```
   - Resource limitaion
     ```bash
     vb.memory = "1024"
     vb.cpus = 2
     ```
2) List of vagrant commands
    * [vagrant cheetsheet](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4)  
   
    | Command             | Description                                                                        |
    |---------------------|------------------------------------------------------------------------------------|
    | `vagrant init`      | Initialize Vagrant with a Vagrantfile and ./.vagrant directory                     |
    | `vagrant ssh`       | SSH into virtual machine.                                                          |
    | `vagrant up`        | Start virtual machine.                                                             |
    | `vagrant halt`      | Halt virtual machine.                                                              |
    | `vagrant destroy`   | Destroy your virtual machine.                                                      |
    | `vagrant provision` | Reconfigure the virtual machine after a source code change.                        |
    | `vagrant reload`    | Reload the virtual machine. Useful when you need to change network or synced folder settings. |
   
    So, after creating the vagrantfile, we can write “vagrant up” and soon the 2 virtual machines will start.   
3) Adding Ansible provisioner into [Vagrantfile](https://github.com/W1ckedS1ck/SelfPractice/blob/main/Vagrant/VagrantAnsible)  
   - Ansiible "block"
     ```bash
     config.vm.provision "ansible" do |ansible|
     ansible.playbook = "playbook.yml"
     end
     ```
    - [playbook.yml](https://github.com/W1ckedS1ck/SelfPractice/blob/main/Vagrant/playbook.yml) for ansible
      
    | Play                | Description                                                                        |
    |---------------------|------------------------------------------------------------------------------------|
    | `- hosts: all`      | The rule applies to all VMs                                                        |
    | `- name: Update`    | Updating all packages, including OS                                                |
    | `- name: Install`   | Installation of programs specified in the block                                    |

   Of course, Vagrant knows how to work with bash scripts, but working with an additional provisioner like Ansible is much more fun to me :)  
     <img width="632" alt="image" src="https://github.com/user-attachments/assets/c46bdf1a-b148-46af-8753-81b8e14197a9">
     <img width="498" alt="image" src="https://github.com/user-attachments/assets/1f08049d-bdb8-4611-ae84-3fc44c50a223">


