# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=archaudit-report
pkgver=1.02
pkgrel=1
pkgdesc="Report on applications with inherited security advisories"
arch=('any')
url="https://github.com/Irvinehimself/ArchAudit-Report"
license=('GPL3')
depends=('arch-audit' 'pkgtools')
source=("https://github.com/Irvinehimself/ArchAudit-Report/archive/v1.02.tar.gz")
sha256sums=("99dbd9ecbed70ab806f0c228e3f3c4968fdd9941cc0faac4209c9959c16ade21")

package() {
    cd ${srcdir}/"ArchAudit-Report-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
