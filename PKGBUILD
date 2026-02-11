# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=26.3.0.45842
pkgrel=1

pkgdesc="MAX messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=("libxcb" "libxinerama" "libxcomposite" "xcb-util-wm" "libva" "libvdpau" "libnotify")
optdepends=('gnome-keyring: Fixses startup in Gmome. Store passwords and encryption keys.')


_app_name="MAX"
_filename="${_app_name}-${pkgver}.rpm"

provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("https://download.max.ru/linux/rpm/el/9/${arch}/${_filename}")

sha256sums_x86_64=('aed26b6bcea988a58f3d10f51a1d7aea08a2bbd66a281aa766dbf8b283edc1f3')

package() {
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
