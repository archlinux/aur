# -*- mode: shell-script -*-
# Maintainer: Ruijie Yu <first plus arch at netyu dot xyz>

pkgname=xdg-environment
pkgver=1.0.0
pkgrel=3
arch=(any)
pkgdesc='Provides default values for XDG environment variables.'
url='https://wiki.archlinux.org/title/XDG_Base_Directory'
licence=(MIT)
source=(50-xdg-environment.conf)
b2sums=('4bcdec896c91740e949053cbf9d985194a3d9b240639cfe05754dcf630f5c36486e0433f65cb862cded84b57ca0cd6610aaab2ad53567301498e89bca24873b1')

package() {
    install -Dvm0644 \
            "${source[@]}" \
            -t "$pkgdir/usr/lib/environment.d/"
}
