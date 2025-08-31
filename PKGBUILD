# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: LukasDoesDev <lukasdoesdev@gmail.com>

pkgname=playerctld-systemd-unit
pkgver=2
pkgrel=1
pkgdesc='A systemd user unit for playerctld'
url='https://wiki.archlinux.org/title/MPRIS#Playerctl'
license=('GPL')
arch=(any)
depends=('playerctl')
install=playerctld.install
source=('playerctld.install' 'playerctld.service')
sha256sums=('ecef02c870f81c6cc9d48f99a9eeb6e5037b983cdb5e50d123697e259f26fd8d'
            '8751a058599ecd65bafd96b1682fb35c9925630083932397b2efaaf4c448969b')

package() {
  install -Dm644 "$srcdir"/playerctld.service "$pkgdir"/usr/lib/systemd/user/playerctld.service
}
