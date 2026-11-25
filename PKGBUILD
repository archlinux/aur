# Maintainer: Simone Felici <felicisimone9@gmail.com>

pkgname=zournal-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
provides=('zournal')
conflicts=('zournal-git')
source_x86_64=("zournal-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/zournal-x86_64-linux.tar.gz")
source_aarch64=("zournal-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/zournal-aarch64-linux.tar.gz")
sha256sums_x86_64=('92bac19d3f41f6afa11091386d11283992ad29100b03c21a15a89b3dd8e379d0')
sha256sums_aarch64=('2971cd39e7b51cbec10016c23c00266cfe66e009735505ab304abb159e1f5344')

package() {
	install -Dm755 "$srcdir/zournal" "$pkgdir/usr/bin/zournal"
	install -Dm644 "$srcdir/zournal.desktop" "$pkgdir/usr/share/applications/zournal.desktop"
	install -Dm644 "$srcdir/zournal.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zournal.png"
}
