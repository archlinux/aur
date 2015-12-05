# Maintainer: tjbp <archlinux@tjbp.net>

pkgname='starmade'
pkgver='latest'
pkgrel='1'
pkgdesc='StarMade is a voxel-based 3D sandbox space shooter'
arch=('i686' 'x86_64')
url='http://starmade.org/'
license=('custom')
source=(
    'http://files.star-made.org/StarMade-Starter.jar'
    'starmade'
    'starmade.desktop'
    'starmade.png'
)
sha256sums=(
    'f44c730c435a12540455b7ffde2230496aa04479148cafe165481d9b09769990'
    'a6f46320f5683bf77f4b1dc6cdec54ab7f64f11504130924ac44bd7033e39004'
    '78d7e0a4ec3e0b5c9ddabe696d5589bd5ac64ed751085b95ef18c27053c36e4e'
    '226c86f6d29bc93319e559e0df97cae484bf8501d2c1fbf6c1363c8e4ec8ee24'
)

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/starmade" "${pkgdir}/usr/bin/starmade"
    install -D -m644 "${srcdir}/StarMade-Starter.jar" "${pkgdir}/usr/share/starmade/StarMade-Starter.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/starmade.desktop" "${pkgdir}/usr/share/applications/starmade.desktop"
    install -D -m644 "${srcdir}/starmade.png" "${pkgdir}/usr/share/pixmaps/starmade.png"
}
