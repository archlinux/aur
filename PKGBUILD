# Maintainer: Lucas Rooyakkers <lucas rooyakkers @ pm me>
pkgname=gt-100fxfloorboard
pkgfoo=GT-100FxFloorBoard
pkgver=20221108
pkgrel=1
pkgdesc="GT-100 Fx FloorBoard midi editor software for the Boss GT-100 Guitar Amp Effects processor."
arch=('x86_64')
url="https://fxfloorboard.sourceforge.io/info.php?model=gt-100"
license=('GPL3')
provides=("$pkgname")
source=("https://downloads.sourceforge.net/project/fxfloorboard/GT-100FxFloorboard/GT-100FxFloorBoard_linux-64.tar.gz")
md5sums=('655ec4b32c412ca5c36d2be2d1a9c550') 

package() { 
    mkdir -p "${pkgdir}"/opt/
    mkdir -p "${pkgdir}"/usr/bin/
    cp -r "$pkgfoo"_linux-64 "${pkgdir}"/opt/"$pkgfoo"
    ln -s "/opt/${pkgfoo}/${pkgfoo}" "${pkgdir}/usr/bin/${pkgfoo}"
}
