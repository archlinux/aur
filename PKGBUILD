# Maintainer: George Shammas <george@shamm.as>

pkgname=junglediskservermanagement
pkgver=3.23.0
_downloadver=${pkgver//./}
pkgrel=1
pkgdesc="Online backup and storage powered by Amazon S3™ and Rackspace."
arch=("x86_64")
url="http://www.jungledisk.com/"
license=("custom")
depends=('fuse2')
source_x86_64=("https://downloads.jungledisk.com/jungledisk/${pkgname}64-${_downloadver}.tar.gz")
sha256sums_x86_64=(7b5ec8039064f9650fcd8ceda531967ea50dc2ad430ef34a132ef680052ba88f)

package() {
	cp -r "${srcdir}/jungledisk-serverfrontend-${pkgver}-linux-${CARCH}"/* "$pkgdir/"
}
