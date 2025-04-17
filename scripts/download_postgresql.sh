sudo apt install postgresql-17
sudo systemctl start postgresql
sudo systemctl enable postgresql

# sudo nano /etc/postgresql/17/main/postgresql.conf
# listen_addresses = '*'

# host and local connections config
sudo sed -i '/^host/s/ident/md5/' /etc/postgresql/17/main/pg_hba.conf
sudo sed -i '/^local/s/peer/trust/' /etc/postgresql/17/main/pg_hba.conf
echo "host all all 0.0.0.0/0 md5" | sudo tee -a /etc/postgresql/17/main/pg_hba.conf

sudo systemctl restart postgresql

# allow through firewall
sudo ufw allow 5432/tcp

