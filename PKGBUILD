# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: theguy147 <yakamoz147 (at) protonmail (dot) com>

pkgname=libobjectbox
pkgver=0.18.0
pkgrel=1
pkgdesc='C/C++ database for objects and structs'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/objectbox/objectbox-c"
license=('Apache' 'custom')
depends=('gcc-libs')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/objectbox-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/objectbox-linux-aarch64.tar.gz")
source_armv7h=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/objectbox-linux-armv7h.tar.gz")
sha256sums_x86_64=('12eac8115f2bd1ed9e5612a083bfe499202b6d132c2df0160c3931267022dc7d')
sha256sums_aarch64=('403af23ee4ba03eec8164d5ca5c5758ec18d8b60fb19fc96c7c4bd1961e015c1')
sha256sums_armv7h=('403af23ee4ba03eec8164d5ca5c5758ec18d8b60fb19fc96c7c4bd1961e015c1')

package() {
	## closed source library
	install -Dv "lib/$pkgname.so" -t "$pkgdir/usr/lib/"
	install -Dvm644 include/* -t "$pkgdir/usr/include/"
}
