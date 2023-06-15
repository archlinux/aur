# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="reqnotes-bin"
pkgver=1.8
pkgrel=1
pkgdesc="Personal Notes Application, Cross platform desktop application, developed with .NET 6 and Avalonia UI"
arch=('x86_64')
url="https://github.com/ReqBaa/ReqNotes"
_downurl="https://raw.githubusercontent.com/ReqBaa/repo"
license=('GPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('fontconfig' 'glibc' 'zlib' 'gcc-libs')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_downurl}/main/pool/main/r/${pkgname%-bin}/${pkgname%-bin}_${pkgver}-0ubuntu1_amd64.deb")
sha256sums=('08c7edd178beb43194eca99bf06ce9a788949b70e917458e9832272ac0db209c')

package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
}