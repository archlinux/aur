# Author: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>
# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=git-etc
pkgver=2.4.0
pkgrel=1
pkgdesc="Simple daemon for monitoring changes in files"
arch=('any')
url="http://arcan1s.github.io/projects/git-etc"
license=("GPL3")
depends=('git')
makedepends=('python2')
optdepends=('python2-pyqt4: for GUI'
            'xterm: for GUI')
source=(https://github.com/arcan1s/git-etc/releases/download/V.${pkgver}/${pkgname}-${pkgver}-src.tar.xz)
md5sums=('12488742b563c9a67840554361948dc4')
backup=('etc/git-etc.conf')

package() {
  "${srcdir}/${pkgname}/install.sh" "${pkgdir}"
}
