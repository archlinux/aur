# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence
pkgver=0.1.0
pkgrel=1
pkgdesc="A Discord Rich Presence client for MPRIS-compatible media players with support for album art."
url="https://github.com/phusitsom/mprisence"
license=("MIT")
arch=("x86_64")
provides=("mprisence")
conflicts=("mprisence")
source=("https://github.com/phusitsom/mprisence/releases/download/v$pkgver/mprisence-$pkgver-x86_64.tar.gz" "https://raw.githubusercontent.com/phusitsom/mprisence/main/systemd/mprisence.service")
sha256sums=("0690a028cf96ad083f6fff3e82d83343b950c08045f8de38cece453414ea5c24" "https://raw.githubusercontent.com/phusitsom/mprisence/main/systemd/mprisence.service")

package() {
	install -Dm755 mprisence -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 mprisence.service "$pkgdir/usr/lib/systemd/user/mprisence.service"
}
