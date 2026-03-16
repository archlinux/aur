# Maintainer: Akritas Akritidis <akritasak@gmail.com>
pkgname=zenity-bash-completion
pkgver=0.1
pkgrel=1
pkgdesc="Bash completion for zenity"
arch=('any')
url="https://github.com/MaanooAk/zenity-bash-completion"
license=('MIT')
depends=('zenity' 'bash-completion')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha1sums=('c358ad36e4402611827753b1070e405fa02be454')

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_PATH="$pkgdir" install
}
