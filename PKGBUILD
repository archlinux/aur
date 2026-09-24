# Maintainer: Simone Felici <felicisimone9@gmail.com>

pkgname=zournal-bin
pkgver=1.0.0
pkgrel=4
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
provides=('zournal')
conflicts=("${pkgname}-git")
source_x86_64=("x86_64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/x86_64-linux-gnu.tar.gz")
source_aarch64=("aarch64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('b5d0ad8e337059ed7545b0196562a3d49186a7cd82426dcc43737af98460abd2')
sha256sums_aarch64=('d60a11c6b800723375694450b984e8c374054e9953702735d7cfd593828f9802')

package() {
	install -Dm755 "$srcdir/zournal" "$pkgdir/usr/bin/zournal"
	install -Dm644 "$srcdir/zournal.desktop" "$pkgdir/usr/share/applications/zourn0al.desktop"
	install -Dm644 "$srcdir/zournal.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zournal.png"
}
