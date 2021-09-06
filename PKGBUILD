# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
pkgver=5.2.4_1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'  'liblockfile'  'dtkwidget')
source_x86_64=("https://community-packages.deepin.com/deepin/pool/non-free/d/deepin-mail/deepin-mail_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('1bde1a9ba7c36255b386e6d39528db5286e7a38a52891cd2b90959507896d19d5afe9694c72736cd8c68795f1c779bee1492f8516a0ffca8dbd417801c1a4f4b')

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
}
