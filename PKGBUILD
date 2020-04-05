# Maintainer: Arijit Dey <arijid79@gmail.com>
pkgname=pbss-snap
pkgver=1.1
pkgrel=2
pkgdesc="Practically Better Style Sheets"
arch=("any")
url="https://github.com/arijit79/Pbss/"
license=('MIT')
depends=("python>=3.7")
makedepends=('git' 'python-setuptools')
conflicts=("pbss-git" "pbss")
changelog=
source=('https://github.com/arijit79/Pbss/releases/download/v1.1/pbss-snap-1.1.tar.gz')
noextract=()
md5sums=('SKIP')

package() {
    sudo pip install $srcdir/pbss-${pkgver}
}
