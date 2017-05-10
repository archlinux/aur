# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=archaudit-report
pkgver=1.0
pkgrel=1
pkgdesc="Report on applications with inherited security advisories"
arch=('any')
url="https://github.com/Irvinehimself/ArchAudit-Report"
license=('GPL3')
depends=('arch-audit' 'pkgtools')
source=("https://github.com/Irvinehimself/ArchAudit-Report/archive/v1.0.tar.gz")
sha256sums=("fd4559b866f73dd3ae6fb3f7e2a6bd36b3f14150fbd16e8af24c896fb5c4402c")

package() {
    cd ${srcdir}/"ArchAudit-Report-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
