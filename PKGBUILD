# Maintainer: Denis Sheremet <aur@lxlz.space>

pkgname=sferum
pkgver=1.1.12
pkgrel=91

pkgdesc="Образовательная платформа №1"
arch=("x86_64" "i686" "pentium4")
license=("MIT")
categories=("instant_messaging" "network")

url=https://sferum.ru/

depends=("gtk3" "libnotify" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "libappindicator-gtk3" "libsecret")

source_x86_64=("${pkgname}.deb::https://st.mycdn.me/static/sferum/${pkgver//./-}/${pkgname}-amd64.deb")
md5sums_x86_64=("396009e6d502ef7916f5028f7921e1c9")

source_i686=("${pkgname}.deb::https://st.mycdn.me/static/sferum/${pkgver//./-}/${pkgname}-i386.deb")
source_pentium4=("${pkgname}.deb::https://st.mycdn.me/static/sferum/${pkgver//./-}/${pkgname}-i386.deb")
md5sums_i686=("6cee81cfe7402a482c68e7094a8a9d2f")
md5sums_pentium4=("6cee81cfe7402a482c68e7094a8a9d2f")

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
}
