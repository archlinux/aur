# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributer: Jan Krnávek <wamba@centrum.cz>

pkgname=fortune-mod-cs-reddwarf
pkgver=0.0
pkgrel=1
pkgdesc="Czech and Slovak fortune cookie files (Red Dwarf)"
arch=('any')
url="http://download.cirkva.net/fortune/"
license=('unknown')
depends=('fortune-mod-cs')
source=(reddwarf
        reddwarf.dat)
md5sums=('3ee2b3353dac54f4ab7a2e3a8c85e281'
         '364ecc9d930b9ceac6fbe14a03cd0dc6')

package() {
  cd "${srcdir}"

  install -Dm644 reddwarf "${pkgdir}"/usr/share/fortune/cs/reddwarf
  install -Dm644 reddwarf.dat "${pkgdir}"/usr/share/fortune/cs/reddwarf.dat
}
