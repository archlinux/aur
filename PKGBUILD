# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=archaudit-report
pkgver=1.05
pkgrel=1
pkgdesc="Report on applications with inherited security advisories"
arch=('any')
url="https://github.com/Irvinehimself/ArchAudit-Report"
license=('GPL3')
depends=('arch-audit' 'pkgtools')
source=("https://github.com/Irvinehimself/ArchAudit-Report/archive/1.05.tar.gz")
sha256sums=("90c80802e0a21d4f948348433e43895863e513f568719ee8cdb81059e425322d")

package() {
    cd "${srcdir}/ArchAudit-Report-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
