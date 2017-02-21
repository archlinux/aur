# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

pkgname=arc-kde
pkgver=20170218
pkgrel=1
pkgdesc="Arc theme for KDE Plasma 5"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/${pkgname}"
license=('GPL3')
options=('!strip')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('5c7dbe80f06b027527ada72b43934d116aed0c2a5717a3103946c7c45a5d74d7')

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
