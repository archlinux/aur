# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ofinstaller-beans-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Installer for Open Fortress"
arch=("x86_64")
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
depends=("glibc" "gcc-libs" "openssl" "libx11" "libxinerama" "glib2" "libxcursor" "libxfixes" "pango" "cairo")
source=("$url/releases/download/v$pkgver/beans-rs")
sha256sums=('f14d6f716a9e3f9aa626de255d6a9f1a58fb5608040a050c426ebbe03ed07a9a')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/beans-rs" "$pkgdir/usr/bin/${pkgname::-4}"
}
