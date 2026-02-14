# Wavelog PKGBUILD for Arch Linux

This package provides [Wavelog](https://www.wavelog.org/), a web-based amateur radio logging software for Arch Linux and Arch-based distributions.

## Installation

```bash
# Build and install the package
makepkg -si

# Or install from AUR (once published)
yay -S wavelog
# or
paru -S wavelog
```

## Post-Installation Setup

### 1. Database Setup

Wavelog requires a MySQL/MariaDB database. Install and configure the database server:

```bash
# Install MariaDB
sudo pacman -S mariadb

# Initialize MariaDB
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Start and enable MariaDB
sudo systemctl enable --now mariadb

# Secure the installation
sudo mysql_secure_installation

# Create Wavelog database and user
sudo mysql -u root -p
```

In the MySQL prompt:

```sql
CREATE DATABASE wavelog;
CREATE USER 'wavelog'@'localhost' IDENTIFIED BY 'your_secure_password';
GRANT ALL PRIVILEGES ON wavelog.* TO 'wavelog'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### 2. Web Server Configuration

**IMPORTANT:** HTTPS (Port 443) is strongly recommended over HTTP (Port 80). HTTPS is required for the 'KEEP LOGIN' 30-day persistent login feature.

#### Option A: Apache (with mod_php)

1. Install Apache and PHP:
```bash
sudo pacman -S apache php php-apache
```

2. Enable required Apache modules in `/etc/httpd/conf/httpd.conf`:
```apache
LoadModule rewrite_module modules/mod_rewrite.so
LoadModule ssl_module modules/mod_ssl.so
```

3. Configure PHP for Apache - Edit `/etc/httpd/conf/httpd.conf`:
```apache
# Comment out this line:
#LoadModule mpm_event_module modules/mod_mpm_event.so

# Uncomment this line:
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so

# Add PHP module at the end:
LoadModule php_module modules/libphp.so
AddHandler php-script .php

# Add index.php to DirectoryIndex
<IfModule dir_module>
    DirectoryIndex index.php index.html
</IfModule>

# Include Wavelog configuration
Include conf/extra/wavelog.conf
```

4. Copy the example configuration:
```bash
sudo cp /usr/share/doc/wavelog/apache.example.conf /etc/httpd/conf/extra/wavelog.conf
```

5. Edit `/etc/httpd/conf/extra/wavelog.conf`:
   - Uncomment the HTTPS VirtualHost section
   - Configure your SSL certificates
   - Replace `wavelog.example.com` with your domain/hostname

6. Start and enable Apache:
```bash
sudo systemctl enable --now httpd
```

#### Option B: Nginx (with PHP-FPM)

1. Install Nginx and PHP-FPM:
```bash
sudo pacman -S nginx php-fpm
```

2. Copy the example configuration:
```bash
sudo cp /usr/share/doc/wavelog/nginx.example.conf /etc/nginx/sites-available/wavelog.conf

# Create sites-enabled directory if it doesn't exist
sudo mkdir -p /etc/nginx/sites-enabled

# Create symlink
sudo ln -s /etc/nginx/sites-available/wavelog.conf /etc/nginx/sites-enabled/
```

3. Edit `/etc/nginx/sites-available/wavelog.conf`:
   - Configure your SSL certificates
   - Replace `wavelog.example.com` with your domain/hostname

4. Include sites-enabled in main nginx.conf:
```bash
# Add this line in the http block of /etc/nginx/nginx.conf:
include /etc/nginx/sites-enabled/*;
```

5. Start and enable services:
```bash
sudo systemctl enable --now php-fpm
sudo systemctl enable --now nginx
```

### 3. Create Writable Directories

The package uses systemd-tmpfiles to automatically create required directories:

```bash
sudo systemd-tmpfiles --create
```

This creates:
- `/var/lib/wavelog/` - Application data (uploads, backups, etc.)
- `/var/log/wavelog/` - Application logs
- `/var/lib/wavelog/config/` - Configuration files (made temporarily writable for installer)

### 4. Web-Based Installation

1. Open your web browser and navigate to your Wavelog installation:
   - HTTPS (recommended): `https://wavelog.example.com`
   - HTTP: `http://wavelog.example.com` or `http://localhost/wavelog`

2. The Wavelog installer will guide you through:
   - Database connection setup
   - Initial configuration
   - Admin account creation

3. **After installation completes**, secure the config directory:
```bash
sudo chmod 755 /var/lib/wavelog/config
```

### 5. Enable Pretty URLs (Optional but Recommended)

After installation, edit `/var/lib/wavelog/config/config.php`:

```php
$config['index_page'] = '';  // Change from 'index.php' to empty string
```

Then restart your web server:
```bash
# For Apache:
sudo systemctl restart httpd

# For Nginx:
sudo systemctl restart nginx
```

## File Locations

- **Application files:** `/usr/share/webapps/wavelog/`
- **Configuration:** `/var/lib/wavelog/config/`
  - `config.php` - Main configuration
  - `database.php` - Database settings
  - `redis.sample.php` - Redis cache configuration (optional)
  - `memcached.sample.php` - Memcached configuration (optional)
- **Data directories:** `/var/lib/wavelog/`
  - `uploads/` - User uploaded files
  - `backup/` - Backup files
  - `userdata/` - User data files
  - `updates/` - Update files
  - `eqsl_card_images/` - eQSL card images
- **Logs:** `/var/log/wavelog/`
- **Documentation:** `/usr/share/doc/wavelog/`
  - `README.md` - Package documentation
  - `SECURITY.md` - Security guidelines
  - `apache.example.conf` - Apache configuration example
  - `nginx.example.conf` - Nginx configuration example

## Optional: Performance Enhancements

### Redis Caching

```bash
sudo pacman -S redis php-redis

# Enable and start Redis
sudo systemctl enable --now redis

# Copy sample config and configure
sudo cp /var/lib/wavelog/config/redis.sample.php /var/lib/wavelog/config/redis.php
# Edit /var/lib/wavelog/config/redis.php with your Redis settings
```

### APCu Caching

```bash
sudo pacman -S php-apcu

# Restart your web server/PHP-FPM
sudo systemctl restart httpd  # or php-fpm
```

## SSL/TLS Certificate Setup

For production use, obtain a proper SSL certificate:

### Option 1: Let's Encrypt (Free, Recommended)

```bash
sudo pacman -S certbot certbot-apache  # for Apache
# or
sudo pacman -S certbot certbot-nginx   # for Nginx

# Obtain certificate
sudo certbot --apache  # for Apache
# or
sudo certbot --nginx   # for Nginx
```

### Option 2: Self-Signed Certificate (Testing Only)

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/wavelog.key \
  -out /etc/ssl/certs/wavelog.crt
```

## Upgrading

When a new version is released:

```bash
# Update PKGBUILD version
# Rebuild and reinstall
makepkg -si

# Your configuration in /var/lib/wavelog/config/ and data in /var/lib/wavelog/ are preserved
# Visit your Wavelog instance - it will prompt for database updates if needed
```

## Troubleshooting

### Permissions Issues

Ensure web server user has access:

```bash
# For Apache
sudo chown -R http:http /var/lib/wavelog /var/log/wavelog

# For Nginx (with PHP-FPM)
sudo chown -R http:http /var/lib/wavelog /var/log/wavelog
```

### PHP Extensions

**Required extensions** (`php-gd` is a package dependency):

```bash
# Verify required extensions are enabled in /etc/php/php.ini:
grep "^extension=" /etc/php/php.ini | grep -E "mysqli|gd"

# Should show:
# extension=mysqli
# extension=gd

# If not enabled, uncomment them in /etc/php/php.ini:
# extension=mysqli
# extension=gd
```

**Optional caching extensions** (for better performance):

```bash
# Install optional extension packages
sudo pacman -S php-redis php-igbinary php-apcu

# These packages create config files in /etc/php/conf.d/, but extensions are commented out by default.
# You need to manually enable them:

# Edit each file and uncomment the extension line:
sudo nano /etc/php/conf.d/igbinary.ini  # Uncomment: extension=igbinary.so
sudo nano /etc/php/conf.d/redis.ini     # Uncomment: extension=redis
sudo nano /etc/php/conf.d/apcu.ini      # Uncomment: extension=apcu.so

# Verify extensions are enabled (look for uncommented "extension=" lines):
grep "^extension=" /etc/php/conf.d/*.ini
```

**Important:** When using `php-redis`, you must also install `php-igbinary` as it's required for proper serialization support. Make sure to uncomment **both** `igbinary.ini` and `redis.ini`.

After installing or enabling extensions, restart your web server:
```bash
# For Apache
sudo systemctl restart httpd

# For Nginx with PHP-FPM
sudo systemctl restart php-fpm
```

### Check Logs

```bash
# Application logs
sudo tail -f /var/log/wavelog/log-*.php

# Web server logs
sudo tail -f /var/log/httpd/wavelog_error.log     # Apache
sudo tail -f /var/log/nginx/wavelog_error.log     # Nginx

# PHP-FPM logs
sudo journalctl -u php-fpm -f
```

## Security Notes

1. **Always use HTTPS in production** - Required for secure authentication and persistent login
2. **Change database password** - Use a strong, unique password
3. **Keep software updated** - Regularly update Wavelog, PHP, and your web server
4. **Secure config directory** - After installation, ensure `/var/lib/wavelog/config/` has proper permissions (755)
5. **Firewall configuration** - Use `ufw` or `firewalld` to restrict access as needed

## Building the Package

```bash
# Update checksums
updpkgsums

# Validate PKGBUILD
namcap PKGBUILD

# Build the package
makepkg -si

# Or build without installing
makepkg
```

## Validation

This PKGBUILD has been validated with:
- `namcap PKGBUILD` - Passed
- `namcap wavelog-2.3-1-any.pkg.tar.zst` - Passed (minor warnings only)
- Successfully builds with `makepkg`

## Support

- **Wavelog Website:** https://www.wavelog.org/
- **Wavelog Wiki:** https://github.com/wavelog/Wavelog/wiki
- **Webserver Configuration:** https://github.com/wavelog/Wavelog/wiki/Webserver-Configurations
- **Wavelog GitHub:** https://github.com/wavelog/wavelog
- **AUR Package Issues:** Report to package maintainer

## Maintainer

- SteamedFish <opencode at steamedfis dot sh>

## License

- Wavelog: MIT License
- This PKGBUILD: MIT License
