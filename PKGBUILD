# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=python2-git-up
pkgver=1.2.0
pkgrel=1
pkgdesc="A HTML to markdown-structured text converter"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
depends=('python2-termcolor' 'python2-colorama' 'python2-docopt' 'python2-gitpython')
makedepends=('python2-setuptools')
source=(https://github.com/msiemens/PyGitUp/archive/v${pkgver}.tar.gz)
sha256sums=('963d4dc5745a4c9c74c38e9aafdf8ac0ab3b3946454b4736b39f976a52218dde')

package() {
  cd "${srcdir}"/PyGitUp-$pkgver

  python2 setup.py install --root="${pkgdir}"

#license
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
