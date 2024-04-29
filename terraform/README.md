# Terraform Install

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### Steps

- create .tf file with configuration
- terraform init (for initializing and updating terraform packages)
- terraform plan (for checking configuration file)
- terraform apply (for creating an instance) or terraform apply -auto-approve
- terraform destroy (for terminating instance)
