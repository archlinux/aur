# Contributor: Cyberpunk <apocalipsisfull-2011@outlook.com>
# Maintainer: Cyberpunk <apocalipsisfull-2011@outlook.com>

pkgname=argcomplete
pkgver=0.8.9
pkgrel=1
pkgdesc="Argcomplete provides easy, extensible command line tab completion of arguments for your Python script."
arch=('any')
url="https://pypi.python.org"
license=('Apache')
depends=('python2' 'python')
source=('https://pypi.python.org/packages/source/a/argcomplete/argcomplete-0.8.9.tar.gz')
sha256sums=('98f04fa2ca22479459d8ba04583dca653a41c2d7a57648ba7f3b4d7e19ea82be')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
sha256sums=('98f04fa2ca22479459d8ba04583dca653a41c2d7a57648ba7f3b4d7e19ea82be')
