# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: sdvcrx <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.7.6
pkgrel=2
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
sha256sums_i686=('e23f72e688d5808400d12d4050b6dfd2cf1ef31e8c53727cd05eb29e1313e033')
sha256sums_x86_64=('b5706cda44bc76c5db8a1e7956d25ef2e25bf618a7b03e1d98e8f4fc2e2f393a')
sha256sums_aarch64=('071ee2a01982efd9e503d5fd3003a0e3a449df83b577aae4f25f56cebf7a76df')

package() {
	install -Dv "$srcdir/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dvm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
