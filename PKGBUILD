# Maintainer: Simone Felici <felicisimone9@gmail.com>

pkgname=zournal-bin
pkgver=0.1.2
pkgrel=2
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
provides=('zournal')
conflicts=("${pkgname}-git")
source_x86_64=("x86_64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/x86_64-linux-gnu.tar.gz")
source_aarch64=("aarch64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=("e7add1baaee673338430f7d1b1e3d5be2641df69769d8d96d13c8e03add8ce64")
sha256sums_aarch64=("43010daa919aab87ec5396b9e7c94c310042586c69c5deee005c907f04275fc5")

package() {
	install -Dm755 "$srcdir/zournal" "$pkgdir/usr/bin/zournal"
	install -Dm644 "$srcdir/zournal.desktop" "$pkgdir/usr/share/applications/zournal.desktop"
}
