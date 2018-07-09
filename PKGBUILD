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
sha256sums=('a8f7406245fd148e9dae101d21cf375b5cdd4890d7a7a32f3b574cb106e039f1')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
