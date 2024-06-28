# Maintainer: Lucas Rooyakkers <lucas rooyakkers @ pm me>
pkgname=gt-100fxfloorboard
pkgfoo=GT-100FxFloorBoard
pkgver=20240419
pkgrel=1
pkgdesc="GT-100 Fx FloorBoard midi editor software for the Boss GT-100 Guitar Amp Effects processor."
arch=('x86_64')
url="https://fxfloorboard.sourceforge.io/info.php?model=gt-100"
license=('GPL3')
provides=("$pkgname")
source=("https://sourceforge.net/projects/fxfloorboard/files/GT-100FxFloorboard/GT-100FxFloorBoard_linux-64.tar.xz")
b2sums=('19afa02a3413ef3f8a1ce77a3ff2ae117a1bfcf7202e53268285e32f431e2e0b79b3ae7c3424dad692151509d531341ea5fdda5ccffb404b54df06f2c1fbb3da') 

package() { 
    mkdir -p "${pkgdir}"/opt/
    mkdir -p "${pkgdir}"/usr/bin/
    cp -r "${srcdir}"/"${pkgfoo}" "${pkgdir}"/opt/"$pkgfoo"
    ln -s "/opt/${pkgfoo}/${pkgfoo}" "${pkgdir}/usr/bin/${pkgfoo}"
}
