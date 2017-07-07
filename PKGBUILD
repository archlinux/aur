# Maintainer: Adhi Pambudi <addy4rock@gmail.com>

pkgname=archlabs-compiz-compatibility
pkgver=1.01
pkgrel=1
pkgdesc="Compiz Compatibility Package for ARCHLabs"
arch=('any')
license=('GPL')
depends=('compiz' 'emerald' 'compiz-boxmenu')
makedepends=('git')
provides=('obr-compiz-compatibility')
conflicts=('obr-compiz-compatibility')
source=("git+https://github.com/addy-dclxvi/archlabs-compiz-compatibility.git")
md5sums=('SKIP')
sha256sums=('SKIP')


package() {
    
    mkdir -p "${pkgdir}/etc/skel/.config"
    cp -rf "${scrdir}archlabs-compiz-compatibility/compiz" "${pkgdir}/etc/skel/.config"
    cp -rf "${scrdir}archlabs-compiz-compatibility/compiz-1" "${pkgdir}/etc/skel/.config"
    mkdir -p "${pkgdir}/usr/share/xsessions"
    cp "${scrdir}archlabs-compiz-compatibility/compiz.desktop" "${pkgdir}/usr/share/xsessions"
    mkdir -p "${pkgdir}/usr/bin"
    cp "${scrdir}archlabs-compiz-compatibility/compiz-session-start.sh" "${pkgdir}/usr/bin"
    cp "${scrdir}archlabs-compiz-compatibility/compiz-autostart" "${pkgdir}/usr/bin"
    

}

# -*- mode: bash;-*-

