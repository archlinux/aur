# Maintainer: E-Hern Lee <ehern.lee@gmail.com>

pkgname=gargoyle-bin
pkgver=2023.1
pkgrel=2
pkgdesc="AppImage for Interactive Fiction multi-interpreter that supports all major IF formats."
license=('GPL')
conflicts=('gargoyle' 'gargoyle-git')
url="https://github.com/garglk/garglk"
arch=('any')
_pkgname=${pkgname//-bin/}
options=(!strip) # required for AppImages
source=("${_pkgname}-${pkgver}::https://github.com/garglk/garglk/releases/download/${pkgver}/${_pkgname}-x86_64.AppImage")
sha512sums=('f770622cd50fb9a7f238b04fbf9b66f93b2632a1e981a661c7348d7b8fa3a3e123e92fb4b7f226506346053af193c1a35257bb7697bfe2b20bc62ccb71bfa6fd')

package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}" "$pkgdir/usr/bin/${_pkgname}"
}
