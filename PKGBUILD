# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=polenum
pkgver=1.7
pkgrel=1
pkgdesc="A python script to extract the password policy information from a windows machine."
arch=('any')
url="https://github.com/Wh1t3Fox/polenum"
license=('GPLv3')
depends=('impacket' 'python')
source=("https://github.com/Wh1t3Fox/polenum/archive/${pkgver}.tar.gz")
sha512sums=('3d26d250ecb1385a70af00de9be319c270aaba6fe4682f529bafbbc37bb7320076b843aafc09d6992afe34f9e6a10950da32e78684a838bd9e03cea6a701bd16')

package() {
  cd "$srcdir/polenum-${pkgver}"

  # Bin.
  install -Dm755 polenum.py "${pkgdir}/usr/bin/polenum"

}
