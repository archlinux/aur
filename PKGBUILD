# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Neil Booth <$(echo "a3l1dXBpY2hhbkBnbWFpbC5jb20=" | base64 -d)>

pkgname=python-bitcoinx-git
pkgver=0.0.1
pkgrel=1
pkgdesc='Library of Bitcoin functions'
arch=('any')
url='https://github.com/kyuupichan/bitcoinX'
license=('MIT')
depends=('python-pycryptodomex' 'python-coincurve')
provides=('python-bitcoinx-git' 'python-bitcoinx')
conflicts=('python-bitcoinx-git' 'python-bitcoinx')
source=('git+https://github.com/kyuupichan/bitcoinX')
sha256sums=('SKIP')
package() {
    cd "$srcdir/bitcoinX/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
