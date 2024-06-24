# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ofinstaller-beans-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="Installer for Open Fortress"
arch=("x86_64")
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
depends=("glibc" "gcc-libs" "openssl")
source=("$url/releases/download/v$pkgver/beans-rs")
sha256sums=('421439d3bb41350a98e74ef80d025a641225d61115c823b0ab89881cc22cdc81')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/beans-rs" "$pkgdir/usr/bin/${pkgname::-4}"
}
