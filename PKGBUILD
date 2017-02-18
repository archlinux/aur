# Maintainer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=sshsocksvpn
provides=('sshsocksvpn')
pkgrel=1
pkgver=0.2
arch=('any')
license=('GPL2')
pkgdesc="Have an easy way to manage socks tunnels created via SSH and manage a tun2socks on top of it."
url="https://github.com/grimpy/sshsocksvpn"
depends=('python' 'python-psutil' 'openssh' 'badvpn')
makedepends=('python-distribute' 'git')

source=("https://github.com/grimpy/sshsocksvpn/archive/v${pkgver}.tar.gz")
md5sums=('ab7c247eef6ca8684452160422040509')

build() {
    cd
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}
