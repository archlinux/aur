# Contributer: abcfy2 <abcfy2@163.com>

pkgname='deepin-wine6-stable'
pkgver=6.0.0.39
pkgrel=1
pkgdesc="Deepin wine6 stable"
arch=('x86_64')
url="http://www.deepin.org"
license=('Proprietary')
makedepends=('tar')
source=(
    "https://com-store-packages.uniontech.com/appstore/pool/appstore/d/deepin-wine6-stable/deepin-wine6-stable_${pkgver}-${pkgrel}_amd64.deb"
)
noextract=(
    "deepin-wine6-stable_${pkgver}-${pkgrel}_amd64.deb"
)
provides=("deepin-wine6-stable-i386=$pkgver" "deepin-wine6-stable-amd64=$pkgver")
replaces=("deepin-wine6-stable-i386" "deepin-wine6-stable-amd64")
conflicts=("deepin-wine6-stable-i386" "deepin-wine6-stable-amd64")
sha256sums=('baa47abb47c37d4f1c60af279b713d00925870600511f6e997c0a7581cfacc8e')
depends=(
        'alsa-plugins' 'glib2' 'glibc' 'libgphoto2'
        'gst-plugins-base-libs' 'lcms2' 'libldap' 'mpg123'
        'openal' 'libpcap' 'libcanberra-pulse' 'libudev0-shim'
        'libusb' 'vkd3d' 'libx11' 'libxext' 'libxml2'
        'ocl-icd' 'zlib' 'ncurses' 'fontconfig'
        'freetype2' 'gettext' 'libxcursor' 'mesa' 'libjpeg6'
        'libxrandr' 'libxi' 'glu'
        'lib32-alsa-plugins' 'lib32-glib2' 'lib32-glibc' 'libgphoto2'
        'lib32-gst-plugins-base-libs' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
        'lib32-openal' 'lib32-libpcap' 'lib32-libcanberra-pulse' 'lib32-libudev0-shim'
        'lib32-libusb' 'lib32-vkd3d' 'lib32-libx11' 'lib32-libxext' 'lib32-libxml2'
        'lib32-ocl-icd' 'lib32-udis86-git' 'lib32-zlib' 'lib32-ncurses' 'lib32-fontconfig'
        'lib32-freetype2' 'lib32-gettext' 'lib32-libxcursor' 'lib32-mesa' 'lib32-libjpeg6'
        'lib32-libxrandr' 'lib32-libxi' 'lib32-glu'
    )

package_deepin-wine6-stable() {

    mkdir -p "deepin-wine6-stable_${pkgver}-${pkgrel}"
    ar -x "deepin-wine6-stable_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz --output "deepin-wine6-stable_${pkgver}-${pkgrel}"
    tar -xf "deepin-wine6-stable_${pkgver}-${pkgrel}/data.tar.xz" --directory="${pkgdir}"
}
