This is a PKGBUILD for [Tandoor Recipes](https://github.com/TandoorRecipes/recipes).

## Features
- systemd integration.
- Provide configuration for Nginx.
- Use socket activation.
- Use a non-root user.
- Apply migrations automatically.

## Installation
1. Clone the package, build and install with makepkg:
```shell
git clone https://aur.archlinux.org/tandoor-recipes-git.git
cd tandoor-recipes-git
makepkg -si
```
or use your favourite AUR helper.

2. Setup a PostgreSQL database and user, as explained here: https://docs.tandoor.dev/install/manual/#setup-postgresql

3. Configure the service in `/etc/tandoor/tandoor.conf`.

4. Reinstall the package, or follow [the official instructions](https://docs.tandoor.dev/install/manual/#initialize-the-application) to have tandoor creates its DB tables.

5. Optionally configure a reverse proxy. A configuration for Nginx is provided, but you can Traefik, Apache, etc..
Edit `/etc/nginx/sites-available/tandoor.conf`. You may want to use another `server_name`, or configure TLS. Then:
```shell
cd /etc/nginx/sites-enabled
ln -s ../sites-available/tandoor.conf
systemctl restart nginx
```

6. Enable the service
```shell
systemctl enable --now tandoor
```

## Upgrade
```shell
cd tandoor-recipes-git
git pull
makepkg -sif
```
Or use your favourite AUR helper.
You shouldn't need to do anything else. This package applies migration automatically. If PostgreSQL has been updated to a new major version, you may need to [run pg_upgrade](https://wiki.archlinux.org/title/PostgreSQL#pg_upgrade).
