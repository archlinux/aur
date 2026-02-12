# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-bin
pkgver=26.4.1.46437
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

sha256sums_x86_64=('c414b99e39a5ba9735432bf3e525c582ed9758014f396591e7549b4d6e1a8fba')

package() {
    cp -a "${srcdir}/usr/"  "${pkgdir}/usr/"
}
