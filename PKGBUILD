# Maintainer: A. Husen <hi@husen.id>
pkgname=nordic-polar-theme
_pkgname=Nordic-Polar
pkgver=1.9.0
pkgrel=1
pkgdesc="A Gtk3.20+ theme created using the awesome Nord color palette."
arch=("any")
url="https://github.com/EliverLara/Nordic-Polar"
license=('GPL3')
conflicts=('nordic-polar-theme-git')
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}.tar.xz")
sha512sums=('4d90cc1f5b54625de6da74ec1dcb9e43407903c3180e486d70e335e45d9422475dc40c930929e40b7dcf76a361c0bc5af7d98e6e29119aca5498433c2587d58e')

package() {
	cd "${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/themes/$_pkgname"
    cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
