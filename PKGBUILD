# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>
pkgname=gentoo-bashrc
pkgver=2024.0
_pkgver=120013af5e426be31d56a12b672429380d506959
pkgrel=1
pkgdesc="This is Gentoo's BASHRC file, which has very nice color schemes."
arch=('any')
url="https://www.gentoo.org"
license=('GPL')
optdepends=('bash: Shell needed to make use of this package')
source=("gentoo-bashrc-${pkgver}::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-shells/bash/files/bashrc?id=${_pkgver}")
md5sums=('4c61bbc05045c6d5e58013e5b58b4b2d')
sha1sums=('a492b1c6d898462981bb01ca3f1d9f7b1ff69184')
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
