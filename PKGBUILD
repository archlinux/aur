# Maintainer: Andrea Denisse Gómez-Martínez <denisse at archlinux dot org>
# Contributor: Radu Bîrzu <radu@webative.net>

pkgname=dracula-gtk-theme
_pkgname=Dracula
pkgver=v2.0
pkgrel=1
pkgdesc="This theme provides support for GTK-3 and GTK-2 based desktop environments like Gnome, Unity, Budgie, Pantheon, XFCE, Mate, etc. Also provides support for KDE plasma."
arch=("any")
url="https://github.com/dracula/gtk"
license=('GPL')
optdepends=('ttf-roboto: primary font face defined'
	'ttf-ubuntu-font-family: secondary font face defined'
	'cantarell-fonts: tertiary font face defined')
source=("${pkgname}-$pkgver.tar.gz::${url}/releases/download/$pkgver/${_pkgname}.tar.xz")
sha256sums=('f2b24dc840381264ea6f010cc5f0949089611083d9310a91ffda2a770a074ec4')
sha512sums=('150ea193235c555a528de2bfe5a0f6e06fd91a46cc979004f103acc1f8175381633c4817a1bf0d37cd142d72d20f610b55ef94ebabf41fbd27152bdc430219c0')
b2sums=('9f4aa13fb909ffd3253fdfc60bb04293afc7bd97102f73ac225f7258af0d52e3b0e1adeb390c9a7dbca419bf09adb7f5c5cded5e4b78db564acf1ecedff5fa41')
provides=($pkgname)
conflicts=($pkgname)

package() {
	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
