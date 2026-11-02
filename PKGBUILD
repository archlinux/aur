# Maintainer: Simone Felici <felicisimone9@gmail.com>

pkgname=zournal-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
provides=('zournal')
conflicts=("${pkgname}-git")
source_x86_64=("zournal-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/zournal-x86_64-linux.tar.gz")
source_aarch64=("zournal-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/zournal-aarch64-linux.tar.gz")
sha256sums_x86_64=('9e4d5570b701dbff4f7162e8dc7e341ac1c242bc1d89cd7d441cd5aad0fa3187')
sha256sums_aarch64=('90ba143b98e06448b9fe376c015ad9998d5c7c3b470fa130de024ef70507a13b')

package() {
	install -Dm755 "$srcdir/zournal" "$pkgdir/usr/bin/zournal"
	install -Dm644 "$srcdir/zournal.desktop" "$pkgdir/usr/share/applications/zournal.desktop"
	install -Dm644 "$srcdir/zournal.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zournal.png"
}
