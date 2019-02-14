# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=polenum
pkgver=1.4
pkgrel=1
pkgdesc="A python script to extract the password policy information from a windows machine."
arch=('any')
url="https://github.com/Wh1t3Fox/polenum"
license=('GPLv3')
depends=('impacket' 'python2')
source=("https://github.com/Wh1t3Fox/polenum/archive/${pkgver}.tar.gz")
sha512sums=('ff6be3d51e0e3f5c166a1e9e044a25420b932fbe8fdf6bfccc90a3a342a76a62981613fe2f85ed3316187e254bd72cda855c03c44cf9a7b6361fe1554d62a4b9')

package() {
  cd "$srcdir/polenum-${pkgver}"

  # Bin.
  install -Dm755 polenum.py "${pkgdir}/usr/bin/polenum"

}
