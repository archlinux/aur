# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake-qrp-textures
pkgver=1.00
pkgrel=1
pkgdesc="High Quality Textures for Quake from the Quake Revitalization Project (QRP)"
url="http://facelift.quakedev.com/"
license=('custom')
arch=('any')
depends=('quake')
makedepends=('p7zip')
conflicts=()
provides=()
install=
source=("QRP_map_textures_v.${pkgver}.pk3.7z::http://facelift.quakedev.com/downloads/dl_dod.se.php?f=QRP_map_textures_v.${pkgver}.pk3.7z" \
"QRP_normalmap_textures_add-on_v.${pkgver}.pk3.7z::http://facelift.quakedev.com/downloads/dl_dod.se.php?f=QRP_normalmap_textures_add-on_v.${pkgver}.pk3.7z")
md5sums=('9958c0130d129aacdb36cbd4a68b1fbb'
         'ff88d1ef2b3e78560c2bd20843a25424')

build() {
    # Create Destination Directories
    install -d $pkgdir/opt/quake/id1/

    # Install Textures
    7z x -o$pkgdir/opt/quake/id1/ $srcdir/QRP_map_textures_v.${pkgver}.pk3.7z \
        QRP_map_textures_v.${pkgver}.pk3

    # Install Noramlmap Textures
    7z x -o$pkgdir/opt/quake/id1/ $srcdir/QRP_normalmap_textures_add-on_v.${pkgver}.pk3.7z \
        QRP_normalmap_textures_add-on_v.${pkgver}.pk3
}
