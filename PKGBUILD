# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ofinstaller-beans-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="Installer for Open Fortress"
arch=("x86_64")
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
depends=("glibc" "gcc-libs" "openssl")
source=("$url/releases/download/v$pkgver/beans-rs")
sha256sums=('f0b00657b42075ad8d085a84a27031e699c04daad0d05299c95a6f466610ccf9')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/beans-rs" "$pkgdir/usr/bin/${pkgname::-4}"
}
