# Maintainer: Simone Felici <felicisimone9@gmail.com>

pkgname=zournal-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
provides=('zournal')
conflicts=('zournal-git')
source_x86_64=("zournal-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/zournal-x86_64-linux.tar.gz")
source_aarch64=("zournal-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/zournal-aarch64-linux.tar.gz")
sha256sums_x86_64=('6fd89fd9cadd6767c931fbe6f0a4757b9f77d09ad538249b8873dee172ca6ef5')
sha256sums_aarch64=('174c8e6bb5362e4a63ae57e865ced3fd793379b5c3a61ff9513344341c3dfe0c')

package() {
	install -Dm755 "$srcdir/zournal" "$pkgdir/usr/bin/zournal"
	install -Dm644 "$srcdir/zournal.desktop" "$pkgdir/usr/share/applications/zournal.desktop"
	install -Dm644 "$srcdir/zournal.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zournal.png"
}
