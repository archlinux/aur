# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: sdvcrx <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=1.0.0
pkgrel=1
pkgdesc="Json incremental digger"
url="https://github.com/simeji/jid"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
provides=("jid")
conflicts=("jid")
depends=("glibc")
source=('LICENSE')
source_i686=("$pkgname-$pkgver-i686.zip::$url/releases/download/v${pkgver}/${_pkgname}_linux_386.zip")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/v${pkgver}/${_pkgname}_linux_amd64.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/v${pkgver}/${_pkgname}_linux_arm64.zip")
sha256sums=('3db4ceef736801baccfff1bc4d6ea64dc889dcc43cfc49151907ab98538f8c2d')
sha256sums_i686=('3c4e1785c747760d23b52bace04ca23f18df77f2bc051f1fb520e494fb216071')
sha256sums_x86_64=('90dc218336712c130c6d2d572521a00a949aa6f662702ba5c807a5c168755ab7')
sha256sums_aarch64=('aeae5c409ca77b248acba0b772d21a69078c7017c4cc9be3d4476bd49f685739')

package() {
	install -Dv "$srcdir/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dvm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
