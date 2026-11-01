# Maintainer: Simone Felici <felicisimone9@gmail.com>

pkgname=zournal-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
provides=('zournal')
conflicts=("${pkgname}-git")
source_x86_64=("x86_64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/x86_64-linux-gnu.tar.gz")
source_aarch64=("aarch64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('5bc8040d28163412c54e679c298d098572b17a035a6653097a554dd6be232b99')
sha256sums_aarch64=('9c45d0be10ef0e70ac27ef296c5c078c8c5a842c5be8a10ba8e4b8af1f8833ba')

package() {
	install -Dm755 "$srcdir/zournal" "$pkgdir/usr/bin/zournal"
	install -Dm644 "$srcdir/zournal.desktop" "$pkgdir/usr/share/applications/zourn0al.desktop"
	install -Dm644 "$srcdir/zournal.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zournal.png"
}
