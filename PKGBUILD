# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: shamrok <szamrok :: gmail.com>
# Contributor: Inigo Serna <inigoserna :: gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=lfm
pkgver=3.1
pkgrel=2
pkgdesc="A powerful file manager for the UNIX console. Based on curses and written in Python."
arch=('any')
url="https://inigo.katxi.org/devel/lfm/"
license=('GPL3')
depends=('ncurses' 'python')
source=("https://bitbucket.org/inigoserna/lfm3/downloads/lfm-$pkgver.tar.gz")
sha256sums=('2f731a26940db168f9c8830ce186d876995c48577572888052f6bce0377abfca')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}
