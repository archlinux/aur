# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: warddr <aur@warddr.eu>
# Submitter: Frank Smit <frank/61924/nl>

pkgname=python-speaklater
pkgver=1.3
pkgrel=12
pkgdesc="Implements a lazy string for python useful for use with gettext."
arch=('any')
url="https://pypi.python.org/pypi/speaklater"
license=("BSD")
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/s/speaklater/speaklater-${pkgver}.tar.gz")
sha256sums=('59fea336d0eed38c1f0bf3181ee1222d0ef45f3a9dd34ebe65e6bfffdd6a65a9')

package() {
    cd speaklater-$pkgver
    python setup.py install --root="$pkgdir" --prefix=/usr

    install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
