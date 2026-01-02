# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=scx-openrc
pkgver=0.2
pkgrel=1
pkgdesc="OpenRC init script for scx-scheds"
arch=('any')
url="https://aur.archlinux.org/pkgbase/scx-openrc"
license=('GPL2')
depends=('openrc' 'scx-tools')
source=('scx')
sha256sums=('a395965ba8bfc651c4d653490eb6261b577ec4827f40a6c83fe379752bec4bad')

package() {
  install -Dm755 "${srcdir}/scx" "${pkgdir}/etc/init.d/scx"
}
