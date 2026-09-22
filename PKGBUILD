# Maintainer: Simone Felici <felicisimone9@gmail.com>

pkgname=zournal-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
provides=('zournal')
conflicts=("${pkgname}-git")
source_x86_64=("x86_64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/x86_64-linux-gnu.tar.gz")
source_aarch64=("aarch64-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/aarch64-linux-gnu.tar.gz")
sha256sums_x86_64=('1b7dfbdcfbe40a2ae0be35c678f27398333f6789e475140dd0b28515f21fe131')
sha256sums_aarch64=('45cf50e42db68fd2c1d959e47a813e9d4c24d74a30f2016f72d7bb76f064aa7a')

package() {
	install -Dm755 "$srcdir/zournal" "$pkgdir/usr/bin/zournal"
	install -Dm644 "$srcdir/zournal.desktop" "$pkgdir/usr/share/applications/zourn0al.desktop"
	install -Dm644 "resources/zournal.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/zournal.png"
}
