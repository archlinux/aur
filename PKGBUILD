# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=arc-kde
pkgver=20170116
pkgrel=1
pkgdesc="Arc theme for KDE Plasma 5"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
license=('GPL3')
options=('!strip')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('cb907143183e9a088bb274d90f9d2c29b4a732e64fa687c0acebd734b91b6391')

package() {
    cd ${pkgname}-${pkgver}
    mkdir -p ${pkgdir}/usr/share
 
    cp -r plasma "${pkgdir}"/usr/share
    cp -r aurorae "${pkgdir}"/usr/share
    cp -r color-schemes "${pkgdir}"/usr/share
    cp -r konsole "${pkgdir}"/usr/share
    # Not sure whether this is the right place to provide this script…
    rm "${pkgdir}"/usr/share/plasma/desktoptheme/Arc-Dark/fix-menubar.sh
}
