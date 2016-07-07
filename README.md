# Introduction

This is the [PKGBUILD][PKGBUILD] and related source files to build
[nginx][nginx] with support for [Phusion Passenger][passenger] on [Arch Linux][archlinux].

# Instructions

What, you wanted step-by-step install instructions? [This package][aur-this-package]
is available from the [AUR][aur]. You can install it by using the official
method for installing unsupported packages, which is exhaustively described in
the [Arch User Repository][aur-wiki] wiki article.

# Configuration

Once you've installed this package, nginx needs to be configured to enable passenger. Example:

```nginxconf
#
# File: /etc/nginx/nginx.conf
#

http {
    # Recommended
    server_tokens off;
    passenger_show_version_in_header off;

    # Required
    passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
    passenger_ruby /usr/bin/ruby;

    ...

    # Example server block
    server {
        listen 443 ssl http2;
        server_name www.example.com;
        root /srv/http/example/public; # <-- be sure to point to 'public'!
        passenger_enabled on;

        ...
    }

    ...
}
```

Please consult the [Passenger Library][passenger-library] for more advanced configuration.

[archlinux]: https://www.archlinux.org
[aur-this-package]: https://aur.archlinux.org/packages/nginx-passenger
[aur-wiki]: https://wiki.archlinux.org/index.php/Arch_User_Repository
[aur]: https://aur.archlinux.org/
[nginx]: https://nginx.org/
[passenger-library]: https://www.phusionpassenger.com/library/config/nginx/reference/
[passenger]: https://www.phusionpassenger.com/
[PKGBUILD]: https://wiki.archlinux.org/index.php/PKGBUILD
