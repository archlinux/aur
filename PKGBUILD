# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=polenum
pkgver=1.0
pkgrel=1
pkgdesc="A python script to extract the password policy information from a windows machine."
arch=('any')
url="https://github.com/Wh1t3Fox/polenum"
license=('GPL3')
depends=('impacket' 'python2')
source=("https://github.com/Wh1t3Fox/polenum/archive/1.0.tar.gz")
sha512sums=('372c7d0394d55ec65bd6e9d003dd7a443b261a23fce2b8ee079ef8f9bc7836dc615b0ea2084ca07a908efadaa7098a86dc9b6c1752ee893616b1a81ae04c9475')

package() {
  cd "$srcdir/polenum-$pkgver"

  # Base directories.
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/polenum"

  # Bin.
  install -m755 polenum.py "$pkgdir/usr/bin/polenum"

  # License.
  install -m644 LICENSE "$pkgdir/usr/share/licenses/polenum"
}
