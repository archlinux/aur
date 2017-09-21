# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=archaudit-report
pkgver=1.03
pkgrel=1
pkgdesc="Report on applications with inherited security advisories"
arch=('any')
url="https://github.com/Irvinehimself/ArchAudit-Report"
license=('GPL3')
depends=('arch-audit' 'pkgtools')
source=("https://github.com/Irvinehimself/ArchAudit-Report/archive/v1.03.tar.gz")
sha256sums=("2551816854ae2215bbdac03d0ac07a34fdd2de409acc2528977999a93c42f154")

package() {
    cd ${srcdir}/"ArchAudit-Report-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
