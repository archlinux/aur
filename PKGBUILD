# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=26.2.2.43936
pkgrel=1

pkgdesc="MAX messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=("libxcb" "libxinerama" "libxcomposite" "xcb-util-wm" "libva" "libvdpau" "libnotify")

_app_name="MAX"
_filename="${_app_name}-${pkgver}.rpm"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("https://download.max.ru/linux/rpm/el/9/${arch}/${_filename}")

sha256sums_x86_64=('6a6c21a4f08d65de3c3cbcec52ff63de3c916c5c876cd3462d83c669c3a3f5d6')

package() {
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
