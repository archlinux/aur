# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence
pkgver=0.1.0
pkgrel=1
pkgdesc="A Discord Rich Presence client for MPRIS-compatible media players with support for album art."
url="https://github.com/phusitsom/mprisence"
license=("MIT")
arch=("any")
provides=("mprisence")
conflicts=("mprisence")
source=("https://github.com/phusitsom/mprisence/releases/download/v$pkgver/mprisence-$pkgver-x86_64.tar.gz" "https://raw.githubusercontent.com/phusitsom/mprisence/main/systemd/mprisence.service")
sha256sums=("25ba6c7f0c3fa5ebd85941c8ad0830ec67210d5512ddbd509bd498e48558f068" "8103053db7f9850d775785db8a56461a4440220b231144899bf8da38a0f7363c")

package() {
	install -Dm755 mprisence -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 mprisence.service "$pkgdir/usr/lib/systemd/user/mprisence.service"
}
