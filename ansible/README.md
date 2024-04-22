# 1-Config

create ansible.cfg file with content

```
[defaults]
host_key_cheking = False //<--- disable checking for approved hosts
```

# 2-Hosts

create hosts.ini file with content

```
[instance_name]
18.199.100.98 ansible_ssh_user=ubuntu ansible_ssh_private_key_file=../progAcademy.pem
...
```

# 3-Main playbook

create main file setup.yml file with all playbooks imports

```
import_playbook: 01_setup_jenkins_apache.yaml
...
```

# 4-Create palybooks

...

# 5-Run ansible

```
ansible-playbook -i hosts.ini 00_setup.yml
```
