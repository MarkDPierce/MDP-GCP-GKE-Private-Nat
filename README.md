### Auth
I gereated a .json file with my private key and other auth items from google cloud ui. Your should just be able to follow the instructions https://developers.google.com/workspace/guides/create-credentials#create_credentials_for_a_service_account

### Tfvars
If you are not familiar with this. You will have to create a `var.tfvars` file that will read your variable information. Like the directory of auth file. This file also contains potential sensitive info.

It should look similar to
```
workcidr = "1.2.3.4/32"
project_id = "your_gcloud_project_id"
credentials = "./creds.json"
```

### Initialize Terraform modules
`terraform init`

### Apply Terraform with tfvars file
`terraform apply -var-file=vars.tfvars`

### To clean-up
`terraform destroy`