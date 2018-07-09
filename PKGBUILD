# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=sshoot
pkgver=1.4.1
pkgrel=1
pkgdesc="Manage multiple sshuttle VPN sessions."
arch=('any')
url="https://github.com/albertodonato/sshoot"
license=('GPL3')
depends=('python' 'python-pyaml' 'python-prettytable' 'python-argcomplete'
  'python-xdg')
makedepends=('python-setuptools')
source=("https://github.com/albertodonato/sshoot/archive/v${pkgver}.tar.gz")
sha256sums=('5ba286af71e411ae3a274f0ffcd1d3caca226609b77999e37cab36267b2216c4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
