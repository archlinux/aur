# Maintainer: Denis Sheremet <aur@lxlz.space>

pkgname=sferum
pkgver=1.1.10
pkgrel=85.1

pkgdesc="Образовательная платформа №1"
arch=("x86_64" "i686" "pentium4")
license=("MIT")
categories=("instant_messaging" "network")

url=https://sferum.ru/

depends=("gtk3" "libnotify" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "libappindicator-gtk3" "libsecret")

source_x86_64=("${pkgname}.deb::https://st.mycdn.me/static/sferum/${pkgver//./-}/${pkgname}-amd64.deb")
md5sums_x86_64=("fff7bd875476523346c2d5358f092a9e")

source_i686=("${pkgname}.deb::https://st.mycdn.me/static/sferum/${pkgver//./-}/${pkgname}-i386.deb")
source_pentium4=("${pkgname}.deb::https://st.mycdn.me/static/sferum/${pkgver//./-}/${pkgname}-i386.deb")
md5sums_i686=("c0f1824ad90a573f6e844e8c874cf580")
md5sums_pentium4=("c0f1824ad90a573f6e844e8c874cf580")

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
}
