# Maintainer: Mikhail Velichko  <efklid@gmail.com>
# Maintainer: Lolka Team <support@lolka.app>

pkgname=lolka-bin
pkgver=1.0.86
pkgrel=1
#epoch=1
_pkgname=Lolka

pkgdesc="Lolka - voice chat and screen sharing application"
arch=("x86_64")
url="https://lolka.app"
license=("MIT")
categories=("network")
provides=(lolka)
conflicts=()
depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "util-linux-libs" "libsecret" "pipewire" "pipewire-pulse")

optdepends=(
    "libappindicator: for system tray icon" 
)

source=("${_pkgname}_${pkgver}_amd64.deb::https://storage.yandexcloud.net/lolka-electron/releases/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=("419cc5bd37beb6d016c8112750dbc7c60c6d491be23500e913e19add4f871729")
install=${pkgname}.install

prepare() {
    tar -xf data.tar.xz
}

build() {
    :
}

check() {
    :
}

package() {
    cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
}
