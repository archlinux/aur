# Maintainer: Stefan Ott <stefan@ott.net>
pkgname="blink1-python"
pkgver=0.3.1
pkgrel=1
pkgdesc="Official Python library for blink(1) USB RGB LED notification devices"
arch=("any")
url="https://github.com/todbot/${pkgname}"
license=("MIT")

depends=("python" "python-webcolors" "python-hidapi")
makedepends=("git" "python-setuptools")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/todbot/blink1-python/archive/${pkgver}.tar.gz")
sha512sums=("ea017913ba3ebb20b553ee9981037cc861ded8a6cbc0a2d8b2c2995635113489c6ee6b9649f343960aa27b5a9cb196362e5a96c08d21afc38ef3b6abdc069c2d")

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
