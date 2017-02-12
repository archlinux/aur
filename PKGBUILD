# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: shamrok <szamrok :: gmail.com>
# Contributor: Inigo Serna <inigoserna :: gmail.com>
# Contributor: aksr <aksr at t-com dot me>

pkgname=lfm
pkgver=3.0
pkgrel=3
pkgdesc="A powerful file manager for the UNIX console. Based on curses and written in Python."
arch=('any')
url="https://bitbucket.org/inigoserna/lfm3"
license=('GPL3')
depends=('ncurses' 'python')
source=("https://bitbucket.org/inigoserna/lfm3/downloads/lfm-$pkgver.tar.gz")
sha256sums=('01afadd56aded43887c40dec7c81394e5361ba390a3604bd510d69cafe36e3b8')

# In order to build in a clean chroot
LC_CTYPE=en_US.UTF-8

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}
