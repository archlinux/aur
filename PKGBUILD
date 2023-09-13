# Maintainer: taotieren <admin@taotieren.com>

pkgname=kibot
pkgver=1.6.3
pkgrel=4
epoch=
pkgdesc="KiCad automation utility"
arch=('any')
url="https://github.com/INTI-CMNB/KiBot"
license=('GPL-3.0')
groups=()
depends=(
    blender
    ghostscript
    git
    librsvg
    imagemagick
    openscad
    rar
    kicad
    kicost
    pandoc
    pcbdraw
    python
    python-kiauto
    python-kibom
    python-colorama
    python-kidiff
    python-lark-parser
    python-lxml
    python-kikit
    python-numpy
    python-markdown2
    python-mistune
    python-pyaml
    python-qrcodegen
    python-requests
    python-xlsxwriter
    python-xvfbwrapper
    python-yaml
    xorg-server-xvfb
    )
makedepends=("python-setuptools")
checkdepends=(python-pytest)
optdepends=('kicad-interactivehtmlbom: Interactive HTML BOM generation plugin for KiCad'
    'kicad-library: KiCad symbol, footprint and template libraries'
    'kicad-library-3d: KiCad 3D model libraries')
provides=()
conflicts=(kibot-git)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('9d127beee846cf80cee7892375804ff1bc4b504922618b865447c916295301ba')
#validpgpkeys=()

package() {
    cd "${srcdir}/KiBot-${pkgver}"
    python setup.py install --no-compile --root="$pkgdir"
}
