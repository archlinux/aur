# Maintainer: numToStr <hello@vikasraj.dev>

pkgname=lemmy-help
pkgver=0.7.0
pkgrel=1
pkgdesc="Emmylua parser and transformer"
arch=('x86_64' 'aarch64' 'armv7')
url=https://github.com/numToStr/lemmy-help
license=('MIT')
provides=($pkgname)
conflicts=($pkgname)

source_x86_64=("$url/releases/download/$pkgver/$pkgname-x86_64-unknown-linux-gnu.tar.gz")
md5sums_x86_64=(SKIP)

source_armv7=("$url/releases/download/$pkgver/$pkgname-armv7-unknown-linux-gnueabihf.tar.gz")
md5sums_armv7=(SKIP)

source_aarch64=("$url/releases/download/$pkgver/$pkgname-aarch64-unknown-linux-gnu.tar.gz")
md5sums_aarch64=(SKIP)

package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
