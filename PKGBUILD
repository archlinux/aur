# Maintainer: Maoyin Sun <simonmysun@gmail.com>
pkgname=cartlife-bin
_pkgname=${pkgname%-bin}
pkgver=1.6
pkgrel=1
pkgdesc="CartLife, a simulation video game developed by Richard Hofmeier"
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/cartlife/"
license=('custom')
depends=('libxext' 'libxcursor' 'libxpm' 'libxxf86vm' 'libx11' 'zlib' 'gcc-libs')
provides=("${_pkgname}")
source=("https://sourceforge.net/projects/cartlife/files/OpenSores_0.1/CartLife_OS_0.1_Linux.zip/download" ${_pkgname}.sh)
sha256sums=('89ccf505311d9d4a495237588fe34d6629acbfd8a040270d2575e05d9196fbdb' 'b5742c14948d669acc146089e34fae65e3ff4419f24cd4504e8bfcaaf8b85c5e')

package() {
    # Launcher
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

    # Binaries
    install -Dm755 "Linux/data/ags32" "${pkgdir}/usr/share/${_pkgname}/ags32"
    install -Dm755 "Linux/data/ags64" "${pkgdir}/usr/share/${_pkgname}/ags64"
    
    # Libraries

    install -Dm644 "Linux/data/lib32/alleg-alsadigi.so" "${pkgdir}/usr/share/${_pkgname}/lib32/alleg-alsadigi.so"
    install -Dm644 "Linux/data/lib32/alleg-alsamidi.so" "${pkgdir}/usr/share/${_pkgname}/lib32/alleg-alsamidi.so"
    install -Dm644 "Linux/data/lib32/libaldmb.so.1" "${pkgdir}/usr/share/${_pkgname}/lib32/libaldmb.so.1"
    install -Dm644 "Linux/data/lib32/liballeg.so.4.4" "${pkgdir}/usr/share/${_pkgname}/lib32/liballeg.so.4.4"
    install -Dm644 "Linux/data/lib32/libdumb.so.1" "${pkgdir}/usr/share/${_pkgname}/lib32/libdumb.so.1"
    install -Dm644 "Linux/data/lib32/libfreetype.so.6" "${pkgdir}/usr/share/${_pkgname}/lib32/libfreetype.so.6"
    install -Dm644 "Linux/data/lib32/libogg.so.0" "${pkgdir}/usr/share/${_pkgname}/lib32/libogg.so.0"
    install -Dm644 "Linux/data/lib32/libtheora.so.0" "${pkgdir}/usr/share/${_pkgname}/lib32/libtheora.so.0"
    install -Dm644 "Linux/data/lib32/libvorbisfile.so.3" "${pkgdir}/usr/share/${_pkgname}/lib32/libvorbisfile.so.3"
    install -Dm644 "Linux/data/lib32/libvorbis.so.0" "${pkgdir}/usr/share/${_pkgname}/lib32/libvorbis.so.0"
    install -Dm644 "Linux/data/lib32/modules.lst" "${pkgdir}/usr/share/${_pkgname}/lib32/modules.lst"
    
    install -Dm644 "Linux/data/lib64/alleg-alsadigi.so" "${pkgdir}/usr/share/${_pkgname}/lib64/alleg-alsadigi.so"
    install -Dm644 "Linux/data/lib64/alleg-alsamidi.so" "${pkgdir}/usr/share/${_pkgname}/lib64/alleg-alsamidi.so"
    install -Dm644 "Linux/data/lib64/libaldmb.so.1" "${pkgdir}/usr/share/${_pkgname}/lib64/libaldmb.so.1"
    install -Dm644 "Linux/data/lib64/liballeg.so.4.4" "${pkgdir}/usr/share/${_pkgname}/lib64/liballeg.so.4.4"
    install -Dm644 "Linux/data/lib64/libdumb.so.1" "${pkgdir}/usr/share/${_pkgname}/lib64/libdumb.so.1"
    install -Dm644 "Linux/data/lib64/libfreetype.so.6" "${pkgdir}/usr/share/${_pkgname}/lib64/libfreetype.so.6"
    install -Dm644 "Linux/data/lib64/libogg.so.0" "${pkgdir}/usr/share/${_pkgname}/lib64/libogg.so.0"
    install -Dm644 "Linux/data/lib64/libtheora.so.0" "${pkgdir}/usr/share/${_pkgname}/lib64/libtheora.so.0"
    install -Dm644 "Linux/data/lib64/libvorbisfile.so.3" "${pkgdir}/usr/share/${_pkgname}/lib64/libvorbisfile.so.3"
    install -Dm644 "Linux/data/lib64/libvorbis.so.0" "${pkgdir}/usr/share/${_pkgname}/lib64/libvorbis.so.0"
    install -Dm644 "Linux/data/lib64/modules.lst" "${pkgdir}/usr/share/${_pkgname}/lib64/modules.lst"

    # Assets
    install -Dm644 "Linux/data/cartlife.ags" "${pkgdir}/usr/share/${_pkgname}/cartlife.ags"
    install -Dm644 "Linux/data/cartlife.002" "${pkgdir}/usr/share/${_pkgname}/cartlife.002"
    install -Dm644 "Linux/data/cartlife.001" "${pkgdir}/usr/share/${_pkgname}/cartlife.001"
    install -Dm644 "Linux/data/audio.vox" "${pkgdir}/usr/share/${_pkgname}/audio.vox"
    install -Dm644 "Linux/data/speech.vox" "${pkgdir}/usr/share/${_pkgname}/speech.vox"

    # Default config
    install -Dm644 "Linux/data/acsetup.cfg" "${pkgdir}/usr/share/${_pkgname}/acsetup.cfg"

    # Licenses
    install -Dm644 "Linux/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -Dm644 "Linux/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "Linux/data/licenses/ags-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/ags-copyright"
    install -Dm644 "Linux/data/licenses/liballegro4.4-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/liballegro4.4-copyright"
    install -Dm644 "Linux/data/licenses/libdumb1-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/libdumb1-copyright"
    install -Dm644 "Linux/data/licenses/libfreetype6-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/libfreetype6-copyright"
    install -Dm644 "Linux/data/licenses/libogg0-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/libogg0-copyright"
    install -Dm644 "Linux/data/licenses/libtheora0-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/libtheora0-copyright"
    install -Dm644 "Linux/data/licenses/libvorbis0a-copyright" "${pkgdir}/usr/share/licenses/${pkgname}/libvorbis0a-copyright"
    
    # Docs
    install -Dm644 "Linux/readme.html" "${pkgdir}/usr/share/doc/${pkgname}/readme.html"
    install -Dm644 "Linux/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "Linux/readmeimages/ags.jpg" "${pkgdir}/usr/share/doc/${pkgname}/readmeimages/ags.jpg"
    install -Dm644 "Linux/readmeimages/ags-over.jpg" "${pkgdir}/usr/share/doc/${pkgname}/readmeimages/ags-over.jpg"
    install -Dm644 "Linux/readmeimages/readme_01.jpg" "${pkgdir}/usr/share/doc/${pkgname}/readmeimages/readme_01.jpg"
    install -Dm644 "Linux/readmeimages/readme_03.jpg" "${pkgdir}/usr/share/doc/${pkgname}/readmeimages/readme_03.jpg"
}