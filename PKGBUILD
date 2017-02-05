# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=sshsocksvpn
provides=('sshsocksvpn')
pkgrel=1
pkgver=0.1
arch=('any')
license=('GPL2')
pkgdesc="Set of tools to interface with Kodi/XBMC"
url="https://github.com/grimpy/koditools"
depends=('python' 'python-psutil' 'openssh' 'badvpn')
makedepends=('python-distribute' 'git')

source=("https://github.com/grimpy/sshsocksvpn/archive/v${pkgver}.tar.gz")
md5sums=('90c544297516eff662df3f4eeb51abcf')

build() {
    cd
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
