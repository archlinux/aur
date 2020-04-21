#Maintainer: Nikita Tarasov <nikatar@disroot.org>

pkgname=hud
pkgver=1.0
pkgrel=1
pkgdesc="DE independent Unity7 like HUD menu for Rofi"
arch=(x86_64)
depends=(rofi python-dbus python-psutil python-xlib)
url="https://github.com/nikatar/HUD"
license=(GPL)
conflicts=()
install='hud.install'
source=(hud)

sha256sums=('d9b62d499962bc7900e66616bdcb933ceb81c0b84dfe1bcc7c3eb8bb5a175559')

build() {
	true
}

package() {
	msg "Installing..."
    install -Dm755 "${srcdir}/hud" "${pkgdir}/usr/bin/hud"
}


