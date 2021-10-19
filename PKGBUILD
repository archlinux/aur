# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
pkgver=5.2.12_1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'  'liblockfile'  'dtkwidget')
source_x86_64=("https://community-packages.deepin.com/deepin/pool/non-free/d/deepin-mail/deepin-mail_${pkgver//_/-}_amd64.deb")
sha512sums_x86_64=('b6b370e94968eb3e7d05cf3d29fa83490fa2775eb1c158d74f268771beba31a749b1b7dc8ae577581cbc88bb3d198dff38f7389f9b17d4061e5ec67b37873198')

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
}
