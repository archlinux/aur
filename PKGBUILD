# Maintainer: Stefan Ott <stefan@ott.net>
pkgname="blink1-python"
pkgver=0.3.0
pkgrel=1
pkgdesc="Official Python library for blink(1) USB RGB LED notification devices"
arch=("any")
url="https://github.com/todbot/${pkgname}"
license=("MIT")

depends=("python" "python-webcolors" "python-hidapi")
makedepends=("git" "python-setuptools")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/todbot/blink1-python/archive/${pkgver}.tar.gz")
sha512sums=("8b9bcb0c80f77b1a0346ac3974ee5f281fbb4ac481b95fe1dd363079c9fa15d9daf11034cd29820cdd4132e3816579d51c639a319be0e39a75bc28b00331085d")

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
