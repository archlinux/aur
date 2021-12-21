# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: nullableVoidPtr <nullableVoidPtr _ gmail _ com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

pkgname="python-pdfminer.six"
_name="${pkgname#python-}"
pkgver=20211012
pkgrel=1
pkgdesc="Community maintained fork of pdfminer"
url="https://pdfminersix.readthedocs.io/"
arch=("any")
license=("MIT")
depends=("python>=3.6" "python-chardet" "python-cryptography")
makedepends=("python-setuptools")
provides=("python-pdfminer")
conflicts=("python-pdfminer")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0351f17d362ee2d48b158be52bcde6576d96460efd038a3e89a043fba6d634d7')

package(){
 cd "${_name}-${pkgver}"
 export PYTHONHASHSEED=0
 python setup.py install --root="$pkgdir" --optimize=1
}
