# Prerequisites

Before you begin, ensure you have the following:

1. **Hetzner Account:** Sign up or log in to your Hetzner account.
2. **Registered Domain:** Have a domain registered with Hetzner.
3. **Terraform Installation:** Ensure Terraform is installed on your machine. Visit [Terraform's official website](https://www.terraform.io/downloads.html) for installation instructions.
4. **SSH Key Pair:** Generate a pair of SSH keys (public and private) if you haven't already.

## Getting Started with Local State Management

Follow these steps to set up your environment with Terraform:

1. **Clone the Repository:**
   - Use `git clone [repository-url]` to clone the repository to your local machine.
   - Navigate to the Terraform directory within the cloned repository.

2. **Configure Terraform Variables:**
   - It's recommended to create a `terraform.tfvars` file for your variable definitions.
   - Add the following variables to the file, replacing placeholders with your actual values:
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

5. **Destory the Resource. DESTRUCTIVE**
    - Execute `terraform destroy`
    - Review the plan and confirm the changes to start the deployment process.

### Notes:

- **Terraform Documentation:** For more detailed instructions on using Terraform, refer to the [Terraform Documentation](https://www.terraform.io/docs).
