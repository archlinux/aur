# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=sheepchat
_pkgver=392
pkgname="${_pkgname}-bin"
pkgver=1.9.132
pkgrel=1
pkgdesc="Multi chat for Streamers"
arch=('x86_64')
url="https://github.com/${_pkgname}/desktop"
license=('custom:unknown')
depends=("libappindicator-gtk3")
source=("${url}/releases/download/${_pkgver}/${_pkgname}-${pkgver}-linux-x64-setup-prod.deb")
sha512sums=("24d45d8cb48fe78b53184dc0b7c2e8925f90c978eaaf499a30deda28f80fc09ca3a9a39564b9a27ea661d6bf9b4c99864998b97cafe190f1f588a856870abef3")

prepare() {
  tar -xvf data.tar.xz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}
