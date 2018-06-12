# Maintainer: George Shammas <george@shamm.as>

pkgname=junglediskworkgroup
pkgver=3.23.0
_downloadver=${pkgver//./}
pkgrel=1
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace."
arch=("x86_64")
url="http://www.jungledisk.com/"
license=("custom")
depends=('fuse2')
source_x86_64=("https://downloads.jungledisk.com/jungledisk/${pkgname}64-${_downloadver}.tar.gz")
sha256sums_x86_64=(42ad6c067ee6a3685f28fa258dc351c9519969a1db7afdafe6e28d7fb12514be)

package() {
	cp -r "${srcdir}/jungledisk-workgroup-${pkgver}-linux-${CARCH}"/* "$pkgdir/"
}
