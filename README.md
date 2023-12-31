# Prerequisites

Before you begin, ensure you have the following:

1. **Hetzner Account:** Sign up or log in to your Hetzner account.
2. **Registered Domain:** Have a domain registered with Hetzner.
3. **Terraform Installation:** Ensure Terraform is installed on your machine. Visit [Terraform's official website](https://www.terraform.io/downloads.html) for installation instructions.
4. **SSH Key Pair:** Generate a pair of SSH keys (public and private) if you haven't already.
5. **Ansible** Ensure Ansible is installed

## Creating the server with local state management

Follow these steps to set up your environment with Terraform:

1. **Clone the Repository:**
   - Use `git clone git@github.com:kubephil/wordpress-hetzner.git` to clone the repository to your local machine.
   - Navigate to the Terraform directory within the cloned repository.

2. **Configure Terraform Variables:**
   - It's recommended to create a `terraform.tfvars` file for your variable definitions.
   - Add the following variables to the file, replacing placeholders with your actual values (see notes on how to obtain them):
     ```
     hcloud_token = "<your-hetzner-cloud-token>"
     hetznerdns_token = "<your-hetzner-dns-token>"
     hetznerdns_zone_id = "<your-hetzner-dns-zone-id>"
     ```

3. **Initialize Terraform:**
   - Run `terraform init` in your terminal. This command initializes Terraform, setting up your environment to execute Terraform configurations.

4. **Apply Terraform Configuration:**
   - Execute `terraform apply` to apply the Terraform configuration.
   - Review the plan and confirm the changes to start the deployment process.
   - This will create a file called inventory.ini in the ansible directory with the server config

5. **Destory the Resource. DESTRUCTIVE**
    - Execute `terraform destroy`
    - Review the plan and confirm the changes to start the deployment process.

## Configuration of the Server using ansible 

Once the server is created. Follow these steps to deploy wordpress via ansible and docker-compose

1. **Create ACME config File:**
   - Navigate to the `ansible` directory and create a `vars.yml` file for the ACME config and db password
     ```
      domain_name: "yourdomain.com"
      acme_email: "yourfancy@example.com"
      wordpress_db_password: "your-secure-db-password"
     ```
2. **Run the playbook**
   - Execute the command `ansible-playbook -i inventory.ini playbook.yml`
   - This will deploy the config, copy the docker-compose file and start wordpress


### Notes:

- **Terraform Documentation:** For more detailed instructions on using Terraform, refer to the [Terraform Documentation](https://www.terraform.io/docs).
- **Obtain the hcloud token:** The hcloud token is per project. Navigate to `https://console.hetzner.cloud/projects/<your-project>/security/tokens`  and create a read and write token
- **Obtain the DNS token**: Navigate to the API tokens in [Hetzner DNS](https://dns.hetzner.com/settings/api-token). Note your domain needs to point to [Hetzner's Name servers](https://docs.hetzner.com/dns-console/dns/general/authoritative-name-servers).
- **Apply and Teardown several times:** In case you teardown using terrafrom and reapply you might need to run `ssh-keygen -R <your-server-ip>`. This will remove it from the known_hosts.
