# Contributer: abcfy2 <abcfy2@163.com>

pkgname=('deepin-wine5-stable' 'deepin-wine5-stable-i386' 'deepin-wine5-stable-amd64')
pkgver=5.0.34
pkgrel=1
pkgdesc="Deepin Wine5 stable"
arch=('x86_64')
url="http://www.deepin.org"
license=('Proprietary')
makedepends=('tar')
source=(
    "https://community-store-packages.deepin.com/appstore/pool/appstore/d/deepin-wine5-stable/deepin-wine5-stable_${pkgver}-${pkgrel}_amd64.deb"
    "https://community-store-packages.deepin.com/appstore/pool/appstore/d/deepin-wine5-stable/deepin-wine5-stable-amd64_${pkgver}-${pkgrel}_amd64.deb"
    "https://community-store-packages.deepin.com/appstore/pool/appstore/d/deepin-wine5-stable/deepin-wine5-stable-i386_${pkgver}-${pkgrel}_i386.deb"
)
noextract=(
    "deepin-wine5-stable_${pkgver}-${pkgrel}_amd64.deb"
    "deepin-wine5-stable-amd64_${pkgver}-${pkgrel}_amd64.deb"
    "deepin-wine5-stable-i386_${pkgver}-${pkgrel}_i386.deb"
)
sha256sums=('40e0371d64102295ec3426e9058df9743e3419505a1eb4ec675b6305ddd0f02e'
            'dbb69bbecbc3e758500c92dc4656936c54f20c84e31c5a105ab29326d04375a6'
            '6366441e1f2017e7f0fbdf287983b21fd44c2be0e97a3b6e36081f45a5550c12')

package_deepin-wine5-stable() {
    depends=("deepin-wine5-stable-i386=$pkgver" "deepin-wine5-stable-amd64=$pkgver")

    mkdir -p "deepin-wine5-stable_${pkgver}-${pkgrel}"
    ar -x "deepin-wine5-stable_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz --output "deepin-wine5-stable_${pkgver}-${pkgrel}"
    tar -xf "deepin-wine5-stable_${pkgver}-${pkgrel}/data.tar.xz" --directory="${pkgdir}"
}

package_deepin-wine5-stable-i386() {
    # deepin-wine5-i386 deb dependencies (Note: i386):
    # Depends: libasound2 (>= 1.0.16), libc6 (>= 2.28), libglib2.0-0 (>= 2.12.0), libgphoto2-6 (>= 2.5.10), libgphoto2-port12 (>= 2.5.10), libgstreamer-plugins-base1.0-0 (>= 1.0.0), libgstreamer1.0-0 (>= 1.4.0), liblcms2-2 (>= 2.2+git20110628), libldap-2.4-2 (>= 2.4.7), libmpg123-0 (>= 1.13.7), libopenal1 (>= 1.14), libpcap0.8 (>= 0.9.8), libpulse0 (>= 0.99.1), libudev1 (>= 183), libusb-1.0-0 (>= 2:1.0.16), libvkd3d1 (>= 1.0), libx11-6, libxext6, libxml2 (>= 2.9.0), ocl-icd-libopencl1 | libopencl1, udis86, zlib1g (>= 1:1.1.4), libasound2-plugins, libncurses6 | libncurses5 | libncurses
    # Recommends: libcapi20-3, libcups2, libdbus-1-3, libfontconfig1, libfreetype6, libglu1-mesa | libglu1, libgnutls30 | libgnutls28 | libgnutls26, libgsm1, libgssapi-krb5-2, libjpeg62-turbo | libjpeg8, libkrb5-3, libodbc1, libosmesa6, libpng16-16 | libpng12-0, libsane | libsane1, libsdl2-2.0-0, libtiff5, libv4l-0, libxcomposite1, libxcursor1, libxfixes3, libxi6, libxinerama1, libxrandr2, libxrender1, libxslt1.1, libxxf86vm1
    depends=(
        'lib32-alsa-plugins' 'lib32-glib2' 'lib32-glibc' 'libgphoto2'
        'lib32-gst-plugins-base-libs' 'lib32-lcms2' 'lib32-libldap' 'lib32-mpg123'
        'lib32-openal' 'lib32-libpcap' 'lib32-libcanberra-pulse' 'lib32-libudev0-shim'
        'lib32-libusb' 'lib32-vkd3d' 'lib32-libx11' 'lib32-libxext' 'lib32-libxml2'
        'lib32-ocl-icd' 'deepin-udis86' 'lib32-zlib' 'lib32-ncurses' 'lib32-fontconfig'
        'lib32-freetype2' 'lib32-gettext' 'lib32-libxcursor' 'lib32-mesa' 'lib32-libjpeg6'
        'lib32-libxrandr' 'lib32-libxi' 'lib32-glu'
    )

    mkdir -p "deepin-wine5-stable-i386_${pkgver}-${pkgrel}"
    ar -x "deepin-wine5-stable-i386_${pkgver}-${pkgrel}_i386.deb" data.tar.xz --output "deepin-wine5-stable-i386_${pkgver}-${pkgrel}"
    tar -xf "deepin-wine5-stable-i386_${pkgver}-${pkgrel}/data.tar.xz" --directory="${pkgdir}"
}

package_deepin-wine5-stable-amd64() {
    # deepin-wine5-i386 deb dependencies (Note: i386):
    # Depends: libasound2 (>= 1.0.16), libc6 (>= 2.28), libglib2.0-0 (>= 2.12.0), libgphoto2-6 (>= 2.5.10), libgphoto2-port12 (>= 2.5.10), libgstreamer-plugins-base1.0-0 (>= 1.0.0), libgstreamer1.0-0 (>= 1.4.0), liblcms2-2 (>= 2.2+git20110628), libldap-2.4-2 (>= 2.4.7), libmpg123-0 (>= 1.13.7), libopenal1 (>= 1.14), libpcap0.8 (>= 0.9.8), libpulse0 (>= 0.99.1), libudev1 (>= 183), libusb-1.0-0 (>= 2:1.0.16), libvkd3d1 (>= 1.0), libx11-6, libxext6, libxml2 (>= 2.9.0), ocl-icd-libopencl1 | libopencl1, udis86, zlib1g (>= 1:1.1.4), libasound2-plugins, libncurses6 | libncurses5 | libncurses
    # Recommends: libcapi20-3, libcups2, libdbus-1-3, libfontconfig1, libfreetype6, libglu1-mesa | libglu1, libgnutls30 | libgnutls28 | libgnutls26, libgsm1, libgssapi-krb5-2, libjpeg62-turbo | libjpeg8, libkrb5-3, libodbc1, libosmesa6, libpng16-16 | libpng12-0, libsane | libsane1, libsdl2-2.0-0, libtiff5, libv4l-0, libxcomposite1, libxcursor1, libxfixes3, libxi6, libxinerama1, libxrandr2, libxrender1, libxslt1.1, libxxf86vm1
    depends=(
        'alsa-plugins' 'glib2' 'glibc' 'libgphoto2'
        'gst-plugins-base-libs' 'lcms2' 'libldap' 'mpg123'
        'openal' 'libpcap' 'libcanberra-pulse' 'libudev0-shim'
        'libusb' 'vkd3d' 'libx11' 'libxext' 'libxml2'
        'ocl-icd' 'deepin-udis86' 'zlib' 'ncurses' 'fontconfig'
        'freetype2' 'gettext' 'libxcursor' 'mesa' 'libjpeg6'
        'libxrandr' 'libxi' 'glu'
    )

    mkdir -p "deepin-wine5-stable-amd64_${pkgver}-${pkgrel}"
    ar -x "deepin-wine5-stable-amd64_${pkgver}-${pkgrel}_amd64.deb" data.tar.xz --output "deepin-wine5-stable-amd64_${pkgver}-${pkgrel}"
    tar -xf "deepin-wine5-stable-amd64_${pkgver}-${pkgrel}/data.tar.xz" --directory="${pkgdir}"
}
