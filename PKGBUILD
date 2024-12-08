# Maintainer: Valters Tomsons <valters.tomsons at protonmail dot com>

pkgname="quixel-bridge-blender"
pkgver=3.6
pkgrel=2
pkgdesc="A plugin for Blender 4.3 which allows exporting assets from Quixel Bridge."
arch=('any')
url="https://quixel.com/bridge"
license=('custom:Commercial')
depends=('zlib')
options=(!strip)
source=("https://quixel-megascans-static.s3.us-west-2.amazonaws.com/bridge/plugins_12/blender/linux/${pkgver}.zip")
sha256sums=('a5e33c03092d47bb3a9cb74783039af71bdc1265ddd38d309c6de7ab76e3e63f')

package() {
    install -Dm755 "${srcdir}/MSPlugin/__init__.py" "${pkgdir}/usr/share/blender/4.3/scripts/startup/MSPlugin/__init__.py"
}
