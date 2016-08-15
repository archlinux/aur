# Caddy AUR

Caddy is an HTTP/2 web server written in [go](golang.org) with easy configuration and built-in ACME (let's encrypt) support.
Take a look at [caddyserver.com](https://caddyserver.com/) for more details.

## Migration from 0.8.3 and Previous Versions

Since 0.9, the [upstream systemd service file](https://github.com/mholt/caddy/blob/master/dist/init/linux-systemd/caddy.service) that comes bundled with the package uses, amongst other changes, `www-data` as user and group by default.
Some of caddy's default paths, e.g. the certificate directories path, have changed.
The [release notes for 0.9](https://caddyserver.com/blog/caddy-0_9-released) are explaining everything in detail.

The following instructions are only relevant if you used the caddy AUR packages before the 0.9 release.
`www-data` is used as the new default user and group, therefore it needs to be available on the system.
The PKGBUILD's install script will create the user if it is not available.
In case this didn't work run the following command to create the system user and group for www-data:

```sh
useradd --system --shell /usr/bin/nologin www-data
```

*Important*: check the permissions of the *web root* and *caddy configuration* and `chown -R www-data:www-data` them if necessary.

TLS assets are now stored in `$HOME/.caddy`, where `$HOME` is the run users home directory.
Caddy will make the migration for you, so don't worry.
You can override the default path by setting the `$CADDYPATH` variable.
The upstream systemd service sets `HOME` for `www-data` to `/etc/ssl/caddy`, hence make sure that the directory exists:

```sh
mkdir -p /etc/ssl/caddy && chown -R www-data:www-data /etc/ssl/caddy
```

The caddy binary is now installed to `/usr/local/bin` instead `/usr/bin`.

*Important*: `import`s are now relative to your `Caddyfile`! The following example illustrates nested imports:

```ini
# Caddyfile
import config/some.site
import config/default
...

# config/some.site
import default
...
```

Have fun with the latest caddy release!

If you've any questions, please create an issue in the [github repo](https://github.com/klingtnet/caddy-AUR).
