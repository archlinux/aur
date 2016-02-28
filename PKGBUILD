# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>
pkgname=gentoo-bashrc
pkgver=2016.0
pkgrel=1
pkgdesc="This is Gentoo's BASHRC file, which has very nice color schemes."
arch=('any')
url="http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
license=('GPL')
optdepends=('bash: Shell needed to make use of this package')
source=("gentoo-bashrc-${pkgver}")
md5sums=('38f9a4144ef4e437e1132ce57d3d77b2')
install=${pkgname}.install

package() {

  install -D -m755 gentoo-bashrc-${pkgver} "${pkgdir}/usr/share/gentoo-bashrc/bashrc"

  msg "IMPORTANT!!"
  msg ""
  msg "To prevent overwriting your existing .bashrc, the file"
  msg "was installed to /usr/share/gentoo-bashrc/bashrc"
  msg ""
  msg "Please examine that file, adding your own important"
  msg "settings and local variables to it before replacing"
  msg "your existing bashrc."
  msg ""
}
