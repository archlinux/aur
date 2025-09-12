# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=25.8.0.490
pkgrel=1

pkgdesc="MAX messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libsecret")
optdepends=(
    'libappindicator-gtk3: tray icon'
    'libayatana-appindicator: tray icon'
)

_app_name="MAX"
_filename="${_app_name}.rpm"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("https://download.max.ru/electron/${_filename}")
sha256sums_x86_64=('c26585c7c142eec1d16ddbb2ca6a5956599f6f52497732c31550ed5591ed5164')

package() {
    cp -a "${srcdir}/opt/"  "${pkgdir}/opt/"
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
