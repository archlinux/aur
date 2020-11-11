# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: warddr <aur@warddr.eu>
# Submitter: Frank Smit <frank/61924/nl>

pkgname=python-speaklater
pkgver=1.3
pkgrel=9
pkgdesc="Implements a lazy string for python useful for use with gettext."
arch=('any')
url="https://pypi.python.org/pypi/speaklater"
license=("BSD")
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/s/speaklater/speaklater-${pkgver}.tar.gz")
md5sums=('e8d5dbe36e53d5a35cff227e795e8bbf')

package() {
    cd speaklater-$pkgver
    python setup.py install --root="$pkgdir" --prefix=/usr

    install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
