# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=polenum
pkgver=1.6
pkgrel=2
pkgdesc="A python script to extract the password policy information from a windows machine."
arch=('any')
url="https://github.com/Wh1t3Fox/polenum"
license=('GPLv3')
depends=('impacket' 'python')
source=("https://github.com/Wh1t3Fox/polenum/archive/${pkgver}.tar.gz")
sha512sums=('d20263c065524bee376d7aa41f9210ecdc6aa0e34961164dfe41cfce9638d08abc669db553d58cb8391716b7ddc0ff8796383252bbdbb1449f50328222d12078')

package() {
  cd "$srcdir/polenum-${pkgver}"

  # Bin.
  install -Dm755 polenum.py "${pkgdir}/usr/bin/polenum"

}
