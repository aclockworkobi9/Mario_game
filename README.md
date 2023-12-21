Hello everyone, reminisce about the excitement of 90s gaming? Let's transport ourselves back in time to relive those thrilling moments! Experience the nostalgia of Mario as we deploy the game on Kubernetes. Get ready with your controllers because it's time to play!
Super Mario holds a special place in the hearts of many as a classic game. In this tutorial, we'll delve into the process of deploying a Super Mario game on Amazon's Elastic Kubernetes Service (EKS). By leveraging Kubernetes, we can seamlessly orchestrate the deployment of the game on AWS EKS, ensuring scalability, reliability, and effortless management

**Requirements for this project:** 
Certainly! Here are the instructions for the specified prerequisites:

1. **Ubuntu Instance:**
   - Create an Ubuntu instance, preferably using a t2.micro instance type.
   - Open necessary ports like SSH, HTTPS, and for practice, allow all ports (for learning purpose). Set the inbound rules to accept traffic from any IPv4 address.
   
   2. **IAM Role:**
   - Create an IAM role for EC2 to provide necessary permissions for the cluster. For learning purposes, grant full admin (for learning purpose) access to this role
   
3. **Terraform:**
   - Install Terraform by running the provided script.sh. Before that, grant permission to execute the script:
     ```bash
     sudo chmod +x script.sh
     ./script.sh
     ```
4. **AWS CLI and Kubectl:**
   - The script.sh mentioned above will also install AWS CLI,Docker and Kubectl. Ensure that these services are successfully installed after running the script.

Ubuntu creation and attaching IAM role are easy tasks to do. Make sure to update your instance:
```sudo apt update```

The steps to proceed with cluster provision:

1. **Clone the Repository:**
   - Use the following command to clone the repository:
     ```bash
     git clone https://github.com/aclockworkobi9/Mario_game.git
     ```
   - If Git is not installed, you may need to install it using:
     ```bash
     sudo apt-get install git
     ```

 2.**Change Directory:**
   - Navigate to the cloned repository:
     ```bash
     cd Mario_game
     ```

 3.**Provide Permission to script.sh:**
   - Grant execution permission to the script.sh file:
     ```bash
     sudo chmod +x script.sh
     ```
It will change the color of the file to yellow or green.
![Mario_game_script](https://github.com/aclockworkobi9/Mario_game/assets/146419037/a8587987-aeb1-4c3c-a707-dcc2a8235705)

 4.**Run the Script:**
   - Execute the script.sh to install Terraform, AWS CLI, Docker, and Kubectl:
     ```bash
     ./script.sh
     ```
     or
     ```bash
     sh script.sh
     ```

 5.**Check Installed Versions:**
   - Verify the installation and check the versions of Terraform, AWS CLI, Docker, and Kubectl:
     ```bash
     terraform --version
     aws --version
     kubectl --version
     docker --version
    ```
  Make sure to change bucket name in backend.tf file.![terraform_backend](https://github.com/aclockworkobi9/Mario_game/assets/146419037/d556decb-55f8-4de3-80c8-54bfc017f61e)
  

6. **Change Directory to EKS-TF and Initialize Terraform:**
   ```bash
   cd EKS-TF
   terraform init
   ```

7. **Validate Configuration:**
   Check if the configuration is successful:
   ```bash
   terraform validate
   ```

8. **Execute Terraform Plan:**
   Run Terraform plan to review the execution plan:
   ```bash
   terraform plan
   ```

9. **Provide Cluster using Terraform:**
   Execute Terraform apply to create the cluster (auto-approve for non-interactive execution):
   ```bash
   terraform apply --auto-approve
   ```
   This process may take approximately 8-10 minutes to complete.

10. **Configure EKS:**
   Configure EKS with the following command (replace 'us-east-1' with your desired region):
   ```bash
   aws eks update-kubeconfig --name EKS_CLOUD --region us-east-1
   ```

11. **Deployment:**
   - Change the directory back to the Mario_game directory:
     ```bash
     cd ..
     ```
   - Deploy the application using the following command:
     ```bash
     kubectl apply -f deployment.yaml
     ```
   - To check the deployment status:
     ```bash
     kubectl get all
     ```

12. **Service Deployment:**
   - Deploy the service using the command:
     ```bash
     kubectl apply -f service.yaml
     ```
   - Check the deployment status again:
     ```bash
     kubectl get all
     ```
   - This will create a load balancer, which you can find in the load balancers section.
     ![load_balancer_creation](https://github.com/aclockworkobi9/Mario_game/assets/146419037/ffc5ded3-b213-4be8-9ccd-af33fd68c311)


13. **Access the Game:**
   - Run the command to describe the service and copy the Load Balancer Ingress:
     ```bash
     kubectl describe service mario-service
     ```
   - Paste the Ingress into your browser, and you should be able to see and play the game.
     ![game_result](https://github.com/aclockworkobi9/Mario_game/assets/146419037/df410a38-0ba9-4acf-b942-a57bddc73a25)




