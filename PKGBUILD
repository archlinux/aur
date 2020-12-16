pkgname=python-gooise
_name="${pkgname#python-}"
pkgver=2020.7.18.8
pkgrel=1
pkgdesc="A Google Image Search automation tool."
arch=("x86_64")
url="https://gitlab.com/scpketer/gooise.git"
license=("GPL3")
depends=("python" "python-selenium" "python-requests")
makedepends=("python-setuptools")
source=("https://pypi.io/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("SKIP")

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

