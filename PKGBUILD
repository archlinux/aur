# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname="python-onetimepass"
pkgver=1.0.1
pkgrel=2
pkgdesc="Module for generating and validating HOTP and TOTP tokens"
url="https://github.com/tadeck/onetimepass"
license=("MIT")
arch=("any")
depends=("python-six")
makedepends=("python-setuptools")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2dbeec63eed7866a5b3d297ce7a05b081a7e10153f88020e1530b033ff13f123')

build(){
 cd "onetimepass-$pkgver"
 python setup.py build
}

package(){
 cd "onetimepass-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
