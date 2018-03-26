# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('powernet-mib')
pkgver=4.2.6
pkgrel=1
pkgdesc='American Power Conversion PowerNet-MIB'
arch=('any')
url='http://www.apc.com/us/en/tools/download/index.cfm'
license=('custom')
depends=('net-snmp')
source=("ftp://ftp.apc.com/apc/public/software/pnetmib/mib/${pkgver//.}/powernet${pkgver//.}.mib"
	'LICENSE')
sha256sums=('13bff21fd8c36b619623e7a7e4d819c4c601878395348b0918068f7f27a8ba3d'
            '6c8ff5c34d5380b489ae983e33cd7b08b62aadbd0cefeba2ffe18b0c7e1a096c')

package() {
  install -Dm0644 powernet${pkgver//.}.mib "$pkgdir/usr/share/snmp/mibs/powernet${pkgver//.}.mib"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

