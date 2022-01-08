# -*- mode: shell-script -*-
# Maintainer: Ruijie Yu <first plus arch at netyu dot xyz>

pkgname=xdg-environment
pkgver=1.0.0
pkgrel=1
arch=(any)
pkgdesc='Provides default values for XDG environment variables.'
url='https://wiki.archlinux.org/title/XDG_Base_Directory'
licence=(MIT)
source=(50-xdg-environment.conf)
b2sums=(SKIP)

package() {
    install -Dvm0644 \
            "${source[@]}" \
            -t "$pkgdir/usr/lib/environment.d/"
}
