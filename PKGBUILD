# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=('powernet-mib')
pkgver=4.2.8
pkgrel=1
pkgdesc='American Power Conversion PowerNet-MIB'
arch=('any')
url='https://www.apc.com'
license=('custom')
depends=('net-snmp')
source=("powernet${pkgver//.}.mib::https://download.schneider-electric.com/files?p_Doc_Ref=APC_PowerNetMIB${pkgver//.}"
	'LICENSE')
sha256sums=('1b6b3cb40ce9f29e4e3d0ab0dded54ae6715bbe104743a24569703641aacc7de'
            '6c8ff5c34d5380b489ae983e33cd7b08b62aadbd0cefeba2ffe18b0c7e1a096c')

package() {
  install -Dm0644 powernet${pkgver//.}.mib "$pkgdir/usr/share/snmp/mibs/powernet${pkgver//.}.mib"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

