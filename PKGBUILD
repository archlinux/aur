# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=bleachbit-msf
pkgver=1.0
pkgrel=1
pkgdesc="This is a CleanerML file for the metasploit framework. This adds an option to clean Metasploit with bleachbit"
arch=('any')
url="https://github.com/GIJack/bleachbit-msf"
license=('GPLv3')
depends=('bleachbit')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/bleachbit-msf/archive/v${pkgver}.tar.gz")
sha256sums=('84ceb8bc2b7ce04e1a86982fe1c95a58d516b2be8ccad9cb65952c7a04f90389')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 msf.xml "${pkgdir}/usr/share/bleachbit/cleaners/msf.xml"
}
