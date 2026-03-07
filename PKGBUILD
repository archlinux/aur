# Maintainer: karnage42 karnkaul@proton.me
pkgname=checkupdates-notify
pkgdesc="Sends a notification if package updates are available"
pkgver=0.1
pkgrel=2
url="https://codeberg.org/karnage42/checkupdates-notify"
arch=("any")
license=("0BSD")
depends=("bash")
makedepends=()
install=
changelog=
source=('checkupdates-notify-v0.1.tar.xz')
sha256sums=('51c8e08b8139dc745c88a663b49db8f4c94219d5525c4802856761b506766ae7')

package() {
	depends=("pacman-contrib" "bash")

	./install.sh "$pkgdir"
}
