# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=bleachbit-msf
pkgver=1.1
pkgrel=1
pkgdesc="This is a CleanerML file for the metasploit framework. This adds an option to clean Metasploit with bleachbit"
arch=('any')
url="https://github.com/GIJack/bleachbit-msf"
license=('GPLv3')
depends=('bleachbit')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/bleachbit-msf/archive/v${pkgver}.tar.gz")
sha256sums=('f73162b02a392a51eb7868032571da32945e4eac5fb183421f5c754e6ad69630')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 msf.xml "${pkgdir}/usr/share/bleachbit/cleaners/msf.xml"
}
