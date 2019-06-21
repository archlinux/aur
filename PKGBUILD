# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=sshoot
pkgver=1.4.2
pkgrel=1
pkgdesc="Manage multiple sshuttle VPN sessions."
arch=('any')
url="https://github.com/albertodonato/sshoot"
license=('GPL3')
depends=('python' 'python-pyaml' 'python-prettytable' 'python-argcomplete'
  'python-xdg')
makedepends=('python-setuptools')
source=("https://github.com/albertodonato/sshoot/archive/v${pkgver}.tar.gz")
sha256sums=('5b56ce916f7f90525356434ae61a6f5ef0c990e035c0273a59643cbad47f9313')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
