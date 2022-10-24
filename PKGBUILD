# Maintainer: Yarema aka Knedlyk <yupadmin (at) gmail (dot) com>

pkgname=ddrescue-gui
pkgver=2.1.1
pkgrel=4
pkgdesc="A simple GUI frontend to make ddrescue (a command-line data recovery tool) easier to use."
arch=('any')
url="https://www.hamishmb.com/html/ddrescue-gui.php"
depends=('python' 'python-getdevinfo' 'python-wxpython' 'ddrescue' 'parted' 'lshw' 'python-requests' 'python-beautifulsoup4' )
license=('GPL3')
#source=(https://www.hamishmb.com/files/Downloads/ddrescue-gui/${pkgver}/OtherDistro/ddrescue-gui_${pkgver}~otherdistro-0ubuntu1~ppa1.tar.gz)
source=(#https://www.hamishmb.com/files/Downloads/ddrescue-gui/${pkgver}/OtherDistro/ddrescue-gui_${pkgver}~otherdistro-0ubuntu1~ppa1.tar.gz)
https://www.hamishmb.com/files/Downloads/ddrescue-gui/${pkgver}/Fedora/ddrescue-gui-${pkgver}-7.1-f34.noarch.rpm)
provides=('ddrescue-gui')

prepare() {
    cd ${srcdir}/
    #${pkgname}-${pkgver}
#    sed -i 's/python3/python2/g'  "${srcdir}/${pkgname}-${pkgver}/ddrescue-gui.desktop"
}

package() {
    cd ${srcdir}/
    #${pkgname}-${pkgver}
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/pixmaps
    mkdir -p ${pkgdir}/usr/share/polkit-1/actions/

#    cp -r "${srcdir}/${pkgname}-${pkgver}/images" "${pkgdir}/usr/share/${pkgname}"
#    cp -r "${srcdir}/${pkgname}-${pkgver}/other" "${pkgdir}/usr/share/${pkgname}"
#    cp -r "${srcdir}/${pkgname}-${pkgver}/Tools" "${pkgdir}/usr/share/${pkgname}"
#    cp -r "${srcdir}/${pkgname}-${pkgver}/Tests" "${pkgdir}/usr/share/${pkgname}"
#    cp -r "${srcdir}/${pkgname}-${pkgver}/docs" "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/usr" "${pkgdir}"

#    install -D -m755 ${srcdir}/${pkgname}-${pkgver}/*.py "${pkgdir}/usr/share/${pkgname}"
#    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/ddrescue-gui.desktop" "${pkgdir}/usr/share/applications"
#    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/ddrescue-gui.png" "${pkgdir}/usr/share/pixmaps"
#    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/${pkgname}"
#    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/org.hamishmb.ddrescue-gui.policy" "${pkgdir}/usr/share/polkit-1/actions/"
}
sha256sums=('c68c7f45fa77485cebe53ccfb70f18568a34c4189105cc0266169b8fa4cfc520')
