# Maintainer: tekacs <pkg@tekacs.com>

pkgname=quill-chat
pkgver=2020.09.18
pkgrel=1
pkgdesc='Quill - Messaging for groups and teams that stay focused'
arch=('x86_64')
url="https://quill.chat/"
license=('Proprietary')
options=('!emptydirs' '!strip')
depends=('at-spi2-core' 'gtk3' 'libxtst' 'libnotify' 'nss' 'xdg-utils')
optdepends=('ttf-ms-win10: emoji support')

source=('https://storage.googleapis.com/app-releases-dl.quill.chat/linux/Quill-Latest.rpm')
sha256sums=('SKIP')

package() (
    mkdir -p "${pkgdir}/opt/"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/opt/." "${pkgdir}/opt/"
    cp -r "${srcdir}/usr/lib/." "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/usr/share/." "${pkgdir}/usr/share/"
)
