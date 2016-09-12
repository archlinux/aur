# Maintainer: Anton Novosyolov <anton.novosyolov@gmail.com>
# Contributor:

pkgname=python-slacker
_pkgname=slacker
pkgver=0.9.25
pkgrel=1
pkgdesc="Slacker is a full-featured Python interface for the Slack API"
arch=('i686' 'x86_64')
url="http://github.com/os/slacker/"
license=('apache')
groups=('devel')
depends=('python')
makedepends=('python-pip')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/os/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('4805019b528b22fbf31879feaf1cbbe5')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
