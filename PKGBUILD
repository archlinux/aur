# Maintainer: Martin Villagra <mvillagra0@gmail.com>
pkgname=msbuild-15.3-bin
_pkgver=15.3+xamarinxplat.2017.07.20.13.52-0xamarin3+ubuntu1404b1
pkgver=${_pkgver//[+-]/_}
pkgrel=3
pkgdesc="Xamarin implementation of the Microsoft bui    ld system"
arch=('x86_64')
depends=('mono>=5.0.0')
provides=('msbuild')
conflicts=('msbuild')
url="https://github.com/mono/msbuild"
license=('MIT')
source=("msbuild-amd64-v${_pkgver}.deb::http://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/msbuild_${_pkgver}_all.deb")
sha256sums=('82dd69ce80fad051d93bb432bfc83228b300ecd8e9209695b0f4823c0c5427a5')
 
package() {
    cd "${srcdir}"
 
    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
