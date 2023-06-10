pkgname="ancientbeast"
_pkgname="AncientBeast"
pkgver=0.4
pkgrel=1
pkgdesc="Turn Based Strategy Game. Master your beasts!"
arch=('i686' 'x86_64')
url="https://github.com/FreezingMoon/AncientBeast"
makedepends=()
license=('AGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FreezingMoon/AncientBeast/archive/refs/tags/v0.4.tar.gz")
sha256sums=('a1889c32a89ab5080d8301738f432b4abd7c60310ea068fc45d77ef159854b6a')


package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    mv * "${pkgdir}/opt/${pkgname}/"
}
