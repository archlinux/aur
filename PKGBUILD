# Maintainer: Igor Saric <karabaja4 at gmail.com>

pkgname=permof-git
pkgver=1.1
pkgrel=1
pkgdesc='Visualize Linux file permissions'
arch=('any')
url='https://github.com/karabaja4/arch/blob/master/scripts/permof.sh'
license=('MIT')
depends=('coreutils' 'findutils' 'bash' 'bc')
source=('https://raw.githubusercontent.com/karabaja4/arch/master/scripts/permof.sh')
md5sums=('413eb286a6f69e729e6c8e6aa73da8ef')

package() {
  install -Dm755 'permof.sh' "${pkgdir}/usr/bin/permof"
}
