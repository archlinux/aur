# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=suwell-reader-bin
_pkgname=cn.suwell.reader.appstore
pkgver=3.0.22.0916
pkgrel=2
pkgdesc="OFD Reader Professional 3.0 From Suwell .LTD"
providers="Beijing Suwell .LTD"
arch=('x86_64')
url="https://www.suwell.cn/"
_downurl="https://com-store-packages.uniontech.com"
license=('unknown')
conflicts=()
depends=('libxt' 'libjpeg6-turbo' 'qrencode' 'gstreamer0.10-base' 'gtk2' 'glu')
options=()
source=("${_pkgname}_${pkgver}.deb::${_downurl}/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${pkgver}-1_amd64.deb")
sha512sums=('aee548785f56b910663cf59d37309691122d9e1998b7e9ae4e5469a1066d09f8fbfee7bf13a991ce53148bb8a309cc428f9fdf8b2fc677ded4857b598169f5df')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
    rm -r "${pkgdir}/opt/apps/cn.suwell.reader/info"
}