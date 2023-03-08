# Maintainer: Zero <zero@cock.li>

pkgname=tachidesk-openrc
pkgver=1.0
pkgrel=1
pkgdesc="OpenRC service for Tachidesk-Server"
arch=('any')
url='https://aur.archlinux.org/packages/tachidesk-openrc'
license=('GPL')
depends=('openrc' 'tachidesk')
source=('tachidesk-server.rc' 'tachidesk-server.install')
sha256sums=("751396d20fb183a354ec95247a6e8bcfd3310d814841fd24b10cc535f65fa0f6"
            "9eed600123ec70eb0bfd3bbbc79535376646f90f5608ca761bb090ec86536bb8")

package() {
  install -Dm755 ${srcdir}/tachidesk-server.rc "$pkgdir"/etc/init.d/tachidesk-server
  install=tachidesk-server.install
}
