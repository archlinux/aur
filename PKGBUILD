# Maintainer: flan_suse <windows2linux AT zoho DOT com>
pkgname=xcursor-arch-simple
pkgver=1.1
pkgrel=1
pkgdesc="Simple blue Arch Linux cursor theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Arch+Cursor+Theme+(simple)?content=135902"
license=('GPL')
groups=()
depends=()
source=('http://gnome-look.org/CONTENT/content-files/135902-ArchCursorTheme.tar.gz')
md5sums=('ac2c9e3c6ddc46b36793007e6a5eeb48')

build() {
    
    # Move into source directory
    cd "${srcdir}"

    # Remove unnecessary preview images
    rm -f ArchCursorTheme/preview*.png

    # Create installation directories
    install -d -m755 "${pkgdir}/usr/share/icons/"

    # Install the cursor theme
    cp -rf "ArchCursorTheme" "${pkgdir}/usr/share/icons/"

}


