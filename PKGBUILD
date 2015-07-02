# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>
pkgname=gentoo-bashrc
pkgver=2013.0
pkgrel=1
pkgdesc="This is Gentoo's BASHRC file, which has very nice color schemes."
arch=('any')
url="http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
license=('GPL')
optdepends=('bash: Shell needed to make use of this package')
source=('gentoo-bashrc-2013.0')
md5sums=('3149b49f29fc9dceb660c4a87b40e8cf')
install=${pkgname}.install

package() {

  install -D -m755 gentoo-bashrc-2013.0 "${pkgdir}"/usr/share/gentoo-bashrc/bashrc

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
