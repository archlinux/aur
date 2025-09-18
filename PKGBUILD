# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=ofinstaller-beans-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="Installer for Open Fortress"
arch=("x86_64")
url="https://github.com/ktwrd/beans-rs"
license=('GPL-3.0-only')
provides=("ofinstaller-beans")
conflicts=("ofinstaller-beans")
depends=("glibc" "gcc-libs" "libx11" "libxinerama" "glib2" "libxcursor" "libxfixes" "pango" "cairo")
source=("$url/releases/download/v$pkgver/beans-rs")
sha256sums=('cc6453d48b39250f6ac371da46c60439751fcdc403993bc71cea2758372e4770')

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/beans-rs" "$pkgdir/usr/bin/${pkgname::-4}"
}
