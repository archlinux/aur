# Maintainer: Denis Sheremet <aur@lxlz.space>

pkgname=sferum
pkgver=1.1.10
pkgrel=85

pkgdesc="Образовательная платформа №1"
arch=("x86_64")
license=("MIT")
categories=("instant_messaging" "network")

url=https://sferum.ru/

depends=("gtk3" "libnotify" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "libappindicator-gtk3" "libsecret")

source=("${pkgname}.deb::https://st.mycdn.me/static/sferum/latest/${pkgname}-amd64.deb")
md5sums=("fff7bd875476523346c2d5358f092a9e")

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
}
