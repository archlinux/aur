# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ofinstaller-beans-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Installer for Open Fortress"
arch=("x86_64")
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
depends=("glibc" "gcc-libs" "openssl")
source=("$url/releases/download/v$pkgver/beans-rs")
sha256sums=('8aa5920df6576c53da7feb4a4104604ae7f44962615e16a189ed998341b38544')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/beans-rs" "$pkgdir/usr/bin/${pkgname::-4}"
}
