# Maintainer: Igor Saric <karabaja4 at gmail.com>

pkgname=permof-git
pkgver=1.0
pkgrel=1
pkgdesc='Visualize Linux file permissions'
arch=('any')
url='https://github.com/karabaja4/arch/blob/master/scripts/permof.sh'
license=('GPL3')
depends=('coreutils' 'findutils' 'bash' 'bc')
source=('https://raw.githubusercontent.com/karabaja4/arch/master/scripts/permof.sh')
md5sums=('41fad969854a632c5a6baa09e1118ecb')

package() {
  install -Dm755 'permof.sh' "${pkgdir}/usr/bin/permof"
}
