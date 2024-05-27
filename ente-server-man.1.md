ENTE-SERVER 1 "APRIL 2024" Linux "Installation Manual"
=======================================

NAME
----

ente-server - Self hosted server for Ente (mobile) clients

SYNOPSIS
--------

`sudo systemctl <start/stop/status/enable> ente-server`

DESCRIPTION
-----------

`ente-server` is the server part that stores and serves encrypted blobs of data to ente (mobile) clients. The clients send/receive encrypted data, which then arrives at the Ente server and is stored/read via the local MinIO object storage service.

For example when the Ente photos client is used, the client encrypts the photos, which are then stored on this server. Later on the client can then lookup the encrypted photos, and decrypt them locally (end-to-end encryption). Since only the client, or anyone the client shares the photos with, have the encryption key, only they can decrypt the data and actually see the photos, the server will never be able to do this due to the lack of that key material.

This AUR package is meant for self hosting in contrary to the by default provided dockerized Ente server. If a dockerized or hosted solution is required, please go to <https://ente.io> for more information.

Note: Since self hosted server space is often available in limited quantity, this AUR package added the ability to change the cleanup delay cleanup before old unlinked ente-server `MinIO` objects will be actually deleted. This can be configured via the `internal:delete-object-delay` `ente-server` configuration parameter. The default upstream Ente server cleans these objects every 45 days by default, but when replication is not required, this setting can be set to cleanup every 5 minutes for example. Do note that this setting is **NOT** supported by the Ente developers, due to the possible risk of breaking `ente-server`. The full warning has been described in the `ente-server` configuration file.

INSTALLATION
------------

To get the Ente server running a working PostgreSQL database (to store Ente object meta data and user data) and MinIO bucket (to store encrypted object data) is required. Furthermore, a HTTPS proxy like Nginx is recommended to be used to access the Ente server. Lastly, the ente-cli tool can be used to easily upgrade ente-server account size limit and account expiry. This manual describes a setup using all the aforementioned components, installing them on the same host.

**Package installation**:

- To install all required components on the same host, it is recommended installing them as dependent packages:
    ```
        pacman -S minio minio-client nginx postgresql --asdeps
    ```

**MinIO setup**:

- Configure '`/etc/minio/minio.conf`':
    ```
        MINIO_VOLUMES="/srv/minio/data"
        MINIO_ROOT_USER=minio
        MINIO_ROOT_PASSWORD='<YOUR-STRONG-MINIO-ROOT-PASSWORD>'
        MINIO_OPTS="--address 127.0.0.1:43200 --console-address 127.0.0.1:43201"
    ```
- Start on boot and right now:
    ```
        sudo systemctl start --now minio.service
    ```
- Create MinIO host and `ente-server` bucket with the `mcli` command:
    ```
        cd /srv/minio/data
        sudo -u minio mcli mb -p ente-server
    ```

**PostgreSQL setup**:

- Initialization:
    ```
        sudo -u postgres initdb --locale en_US.UTF-8 -D '/var/lib/postgres/data' --data-checksums --auth=scram-sha-256 --pwprompt
    ```
- Configure to only listen on a AF_UNIX socket in '`/var/lib/postgres/data/postgresql.conf`':
    ```
        listen_addresses = '' # AF_UNIX Socket only
    ```
- Restrict socket access to postgres user or group via '`sudo systemctl edit postgresql.service`':
    ```
        [Service]
        RuntimeDirectoryMode=750 
    ```
- Add `ente` to the postgres group
    ```
        sudo groupmod -a -U ente postgres
    ```
- Start on boot and right now:
    ```
        sudo systemctl enable --now postgresql
    ```
- Create database user and a database owned by this user:
    ```
        # specify new password twice, then specify postgres password to store new account:
        sudo -u postgres createuser -P ente

        # specify postgres password to create new database:
        sudo -u postgres createdb -T template0 -O ente -E unicode ente-server
    ```

**Running ente-server**:

- Add MinIO bucket details to '`/etc/ente-server/local.yaml`':
    ```
       b2-eu-cen:
           key: minio
           secret: "<YOUR-STRONG-MINIO-ROOT-PASSWORD>"
           endpoint: https://<your_public_domain.tld>:3200
           region: eu-central-2
           bucket: ente-server
    ```
- Add PostgreSQL detals to '`/etc/ente-server/local.yaml`':
    ```
       db:
           host: /run/postgresql
           port: 5432
           name: ente-server
           user: ente
           password: "<YOUR-STRONG-ENTE-DATABASE-USER-PASSWORD>"
    ```
- Generate and configure new secret key values and replace them in '`/etc/ente-server/local.yaml`':
    ```
       ente-server-gen-random-keys
    ```
- Edit systemd service to allow it to access to the IP address of '`<your_public_domain.tld>`' (by default the service only allows access from and to localhost):
    ```
        systemctl edit ente-server
            [Service]
            IPAddressAllow=<IP address of your_public_domain.tld>
        systemctl daemon-reload
    ```
- Enable and start the systemd service:
    ```
       sudo systemctl enable --now ente-server
    ```

**Configuring Nginx proxy**:

- Copy the example the MinIO and Ente server Nginx config and the accompanying HTTP(S) security header config files to the Nginx configuration directory:
    ```
        sudo cp -v /usr/lib/ente-server/ente-server-nginx.conf /etc/nginx/
        sudo cp -v /usr/lib/ente-server/http*security_headers.conf /etc/nginx/
        sudo cp -v /usr/lib/ente-server/minio-server-nginx.conf /etc/nginx/
    ```
- Edit this example config, and replace <your_public_domain.tld> with your actual public domain name
- Request a letsencrypt ceritifacte (or a SSL ceritifacte from another provider) if not already done so:
    ```
        sudo certbot certonly --email <your_email> --agree-tos --preferred-challenge http --webroot -w /var/lib/letsencrypt -d <your_public_domain.tld>
    ```
- Include the ente-server Nginx config in the `http` block within the root '`/etc/nginx/nginx.conf`':
    ```
        http {
            # leave the other http block config as is, and add:
            include /etc/nginx/ente-server-nginx.conf
        }
    ```
- Fix permissions:
    ```
        sudo chmod 644 /etc/nginx/ente-server-nginx.conf
        sudo chmod 644 /etc/nginx/http*security_headers.conf
    ```
- Restart Nginx to apply the changes:
    ```
        sudo systemctl restart nginx
    ```

**Configuring ente-server and ente-cli**:

- Install ente-cli on the client:
    ```
        yay -S ente-cli-bin
    ```
- Add ente-cli config:
    ```
        mkdir -p ~/.ente/export
        echo -e 'endpoint:\n  api: "https://<your_public_domain.tld>"' > ~/.ente/config.yaml
    ```
- Add a user account via the photos mobile, desktop or web app, using a custom endpoint:
    - In the photos app:
        - click 7 times on the main screen to enable developers mode
        - define your custom end point URL: '`https://<your_public_domain.tld>`'
    - In the web app:
    ```
          git clone https://github.com/ente-io/ente.git
          cd ente/web
          git submodule update --init --recursive
          yarn install
          NEXT_PUBLIC_ENTE_ENDPOINT=https://<your_public_domain.tld> yarn dev:photos
    ```
    - Using the desktop app:
        - use 'NEXT_PUBLIC_ENTE_ENDPOINT=https://<your_public_domain.tld>' before building the desktop app
        - Build and install the app using: `yay -S ente-desktop-git`
- Follow the photos, desktop or web app <http://localhost:3000> instructions to create a new user
- Obtain the OTP code:
    - Via email:
        - Configure the `smtp` section in '`/etc/ente-server/local.yaml`'
        - Make sure the configure SMTP server is working
        - Wait for the mail to arrive and copy the OTP code
    - Via the ente-server log:
    ```
        sudo journalctl -au ente-server | grep SendEmailOTT | tail -n 1
    ```
- Obtain the new users account ID:
    ```
        sudo psql -U ente ente-server -c 'select user_id from users order by user_id desc limit 1;'
    ```
- Configure this user as the admin in '`/etc/ente-server/local.yaml`':
    ```
        internal:
            admin: [<ADD USER ID HERE>]
    ```
- Restart ente-server activate the new admin privileges:
    ```
        sudo systemctl restart ente-server
    ```
- Configure this admin within ente-cli:
    ```
        ente account add
            photos
            ~/.ente/export
            <email address of admin account>
            <password of admin account>
    ```

**Increasing user storage and account expiry limit**:

- Use ente-cli to increase storage limit with 100 TB and expiry with 100 years:
    ```
        ente admin update-subscription -u "<user email address>"
    ```

**(Optional) Copy and apply AppArmor profile**:

An AppArmor profile has been provided for those that wish to limit the access the ente-server binary has using AppArmor. Copy and apply this profile as follows (assuming that AppArmor has already been installed and enabled):
    ```
        sudo install -Dvm600 -o root -g root /usr/lib/ente-server/usr.bin.ente-server -t /etc/apparmor.d/
        sudo aa-enforce /usr/bin/ente-server
    ```

**(Optional) Configure Firewall**:
If a host firewall like iptables or nftables has been enabled and configured, make sure the following is allowed:

- Traffic on localhost
- Traffic from your Ente (mobile) client to TCP port 443 to reach the Ente server via Nginx
- Traffic from your Ente (mobile) client to TCP port 3200 to reach the MinIO server via Nginx

FILES
-----

*/etc/ente-server/local.yaml*
  The system wide ente-server configuration file.

*/usr/bin/ente-server*
  The main ente-server binary

*/usr/bin/ente-server-abort-unfinished-multipart-uploads*
  Tool to abort unfinished mutipart uploads

*/usr/bin/ente-server-test-wasabi-compliance*
  Tool to test S3 wasabi compliance

*/usr/bin/ente-server-gen-random-keys*
  Tool to generate new random key values for the ente-server configuration

*/usr/lib/ente-server/ente-server-nginx.conf*
  The ente-server Nginx configuration file template.

*/usr/lib/ente-server/http_security_headers.conf*
  The nginx HTTP security header config

*/usr/lib/ente-server/https_security_headers.conf*
  The nginx HTTPS security header config

*/usr/lib/ente-server/local.yaml*
  The unmodified ente.io ente-server configuration file.
  Only used as documentation to review available options for the '`/etc/ente-server/local.yaml`' configuration file

*/usr/lib/ente-server/migrations*
  The ente-server database migration scripts

*/usr/lib/ente-server/mail-templates*
  The ente-server mail templates

*/usr/lib/ente-server/usr.bin.ente-server*
  The ente-server AppArmor profile.

*/usr/lib/sysusers.d/ente-server.service*
  The ente-server Systemd user config. Only used during package installation

*/usr/lib/tmpfiles.d/ente-server.service*
  The ente-server Systemd tmpfiles config. Only used during package installation

*/usr/lib/systemd/ente-server.service*
  The ente-server Systemd service file.

*/usr/share/licenses/ente-server/LICENSE*
  The ente-server License file

*/usr/share/man/man1/ente-server.1.gz*
  This man page

AUTHOR
------

Object42 <object42@tutamail.com>

SEE ALSO
--------

 [ente.io Ente Server Repository](https://github.com/ente-io/ente/tree/main/server)
