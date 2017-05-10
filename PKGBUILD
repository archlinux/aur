# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=archaudit-report
pkgver=1.01
pkgrel=1
pkgdesc="Report on applications with inherited security advisories"
arch=('any')
url="https://github.com/Irvinehimself/ArchAudit-Report"
license=('GPL3')
depends=('arch-audit' 'pkgtools')
source=("https://github.com/Irvinehimself/ArchAudit-Report/archive/v1.01.tar.gz")
sha256sums=("3d78f9f92ee296e5cda42bbde096f9c394bc18a91fbd9446dc726d4b0c80574b")

package() {
    cd ${srcdir}/"ArchAudit-Report-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
