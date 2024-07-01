# VPS Security Ansible

## Purpose
The `vps-security-ansible` repository provides an automated solution to secure and manage your VPS server using Ansible. This setup focuses on configuring essential security measures, including firewall rules, regular updates, intrusion detection, authentication hardening, logging, and automated backups for databases.

## Features
- **Firewall Configuration**: Automatically configures UFW to secure your server.
- **Regular Updates**: Ensures your server is up-to-date with the latest security patches.
- **Intrusion Detection**: Installs and configures Fail2Ban to protect against brute-force attacks.
- **Secure Authentication**: Enforces strong passwords and sets up multi-factor authentication.
- **Logging**: Enables and configures logging for monitoring server activities.
- **Automated Backups**: Schedules daily backups for MySQL and PostgreSQL databases, and retains backups for 7 days.

## Setup
1. **Install Ansible** on your local machine or a management server.
    ```sh
    sudo apt-get update
    sudo apt-get install ansible -y
    ```

2. **Clone the Repository**:
    ```sh
    git clone https://github.com/yourusername/vps-security-ansible.git
    cd vps-security-ansible
    ```

3. **Configure Hosts**:
    - Edit the `hosts` file to include your VPS server's IP address.
    ```ini
    [vps_servers]
    your_vps_ip_address
    ```

4. **Update Backup Script Credentials**:
    - Edit the `roles/backup/files/backup.sh` script to include your database credentials.
    ```sh
    MYSQL_USER="your_mysql_user"
    MYSQL_PASSWORD="your_mysql_password"
    MYSQL_DATABASE="your_mysql_database"

    POSTGRES_USER="your_postgres_user"
    POSTGRES_PASSWORD="your_postgres_password"
    POSTGRES_DATABASE="your_postgres_database"
    ```

## How to Use
1. **Run the Playbook**:
    - Execute the Ansible playbook to apply the configurations to your VPS server.
    ```sh
    ansible-playbook -i hosts playbook.yml
    ```

2. **Verify Configurations**:
    - Ensure that the firewall is enabled and configured:
    ```sh
    sudo ufw status verbose
    ```
    - Check the status of Fail2Ban:
    ```sh
    sudo systemctl status fail2ban
    ```
    - Verify that the backup script is scheduled in cron:
    ```sh
    crontab -l
    ```

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For any questions or suggestions, please contact [your-email@example.com](mailto:your-email@example.com).
