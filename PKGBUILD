# Maintainer: LukasDoesDev <lukasdoesdev@gmail.com>

pkgname=playerctld-systemd-unit
pkgver=1
pkgrel=1
pkgdesc='A systemd user unit for playerctld'
url='https://wiki.archlinux.org/title/MPRIS#Playerctl'
license=('GPL')
arch=(any)
depends=('playerctl')
install=playerctld.install
source=('playerctld.install' 'playerctld.service')
sha256sums=('ecef02c870f81c6cc9d48f99a9eeb6e5037b983cdb5e50d123697e259f26fd8d'
            'f021d030adda9e9b0366880685a0706f41afd3bc962de10ced1cc132bddf28be')

package() {
	install -Dm644 "$srcdir"/playerctld.service "$pkgdir"/usr/lib/systemd/user/playerctld.service
}
