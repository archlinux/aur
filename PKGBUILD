# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=26.5.1.48203
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

sha256sums_x86_64=('d1c96bc02c1dc23bd3091f3d003f095d69af82de5213a751508d45eafb26bd6b')

package() {
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
