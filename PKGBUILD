# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: LukasDoesDev <lukasdoesdev@gmail.com>

pkgname=playerctld-systemd-unit
pkgver=2
pkgrel=1
pkgdesc='A systemd user unit for playerctld'
url='https://wiki.archlinux.org/title/MPRIS#Playerctl'
license=('GPL-1.0-or-later')
arch=(any)
depends=('playerctl')
install=playerctld.install
source=('playerctld.install' 'playerctld.service')
sha256sums=('ecef02c870f81c6cc9d48f99a9eeb6e5037b983cdb5e50d123697e259f26fd8d'
            'fa1bd07845eb8c916d3f02e0729b43cd8125f9afd9f9708e1aa6e1a2e484f9d1')

package() {
  install -Dm644 "$srcdir"/playerctld.service "$pkgdir"/usr/lib/systemd/user/playerctld.service
}
