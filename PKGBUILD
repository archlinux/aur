# Maintainer: mortzprk <mortz.prk@gmail.com>

pkgname=nixnote2
_pkgname=nixnote2
pkgver=2.0
_pkgver="NixNote2%20-%202.0"
pkgrel=1
pkgdesc="Formerly called nevernote, nixnote is a clone of Evernote designed to run on Linux"
url="http://www.sourceforge.net/projects/nevernote"
arch=('x86_64' 'i686')
license=('GPL2')
provides=('nixnote2')
conflicts=('nixnote' 'nixnote2-git' 'nixnote-beta')
replaces=('nixnote')
source=("nixnote2.desktop")

depends=('mimetex' 'opencv' 'poppler-qt5' 'qt5-base' 'qt5-webkit' 'sqlite' 'tidyhtml' 'qtwebkit' 'libcurl-compat')
sha256sums=('227e6b13fce129adb492b1ab4b94eb3b56777a5939d02ae606b07f217bdb6182')
source_x86_64=("https://superb-sea2.dl.sourceforge.net/project/nevernote/${_pkgver}/Linux/Qt5/${_pkgname}-2.0_amd64.tar.gz")
sha256sums_x86_64=('932055ac4e47e205b95642c19000e7c8fe06e688e536fa9d1ec49ecdaf86eab4')
source_i686=("https://superb-sea2.dl.sourceforge.net/project/nevernote/${_pkgver}/Linux/Qt5/${_pkgname}-2.0_i386.tar.gz")
sha256sums_i686=('9a829cd33ad7fbd6f1e83a0b3182aa3e6be2c56a9f5dbd6ed32cc320b0f9cec2')

package() {
    cp -R "${srcdir}/nixnote2/usr" "${pkgdir}/"
    install -D -m644 nixnote2.desktop ${pkgdir}/usr/share/applications/nixnote2.desktop
}
