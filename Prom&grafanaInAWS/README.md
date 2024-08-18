https://www.youtube.com/playlist?list=PLg5SS_4L6LYu6qjwwwjt2WRsEudkzqB7J  

<h3 style="text-align: center;">Prometheus + Grafana basics</h3>  

**How to install and set up Prometheus Server?**  

 - All you need to do is substitute the desired version into the script and run it as sudo.  
[install_prometheus](https://raw.githubusercontent.com/W1ckedS1ck/SelfPractice/main/Prom%26grafanaInAWS/install_prometheus_server_ubuntu.sh)  
 - Then we need to add the address in the prom config file to monitor the node exporter  
nano /etc/prometheus/prometheus.yml
    ```yml
      - job_name: "MyInstance"
        static_configs:
          - targets: 
              - 172.31.19.246:9100 # Pivate (if instances have same network) or Public IP
    ```
    <img width="1160" alt="image" src="https://github.com/user-attachments/assets/d623f333-e78f-47e7-b64a-b3eafd63c59a">

**How to install Node Exporter?**  
 - Just run it as sudo (or change the version to one you need)  
[install_node exporter](https://raw.githubusercontent.com/W1ckedS1ck/SelfPractice/main/Prom%26grafanaInAWS/install_prometheus_node_exporter.sh)  
    <img width="294" alt="image" src="https://github.com/user-attachments/assets/9cb8f94a-17cf-4f17-a7c6-d20840da9cef">
   
**How to install and set up Grafana?**  
 - Run it as sudo again  
[install_grafana](Prom&grafanaInAWS/install_grafana_server_ubuntu.sh)  
 - Create config for grafana (It also can be done by code)  
    <img width="414" alt="image" src="https://github.com/user-attachments/assets/012eb739-723a-490e-bb84-a1e461593052">   

 - Create or import dashbord(s)  
    <img width="641" alt="image" src="https://github.com/user-attachments/assets/e3054729-bf30-460a-b37e-9d3da8a4e147">
