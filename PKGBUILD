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
sha256sums=('a623a1155d555fdc4f780c0caa19c6805c380560ce8583dc38086452a8ca2b73')
sha512sums=('3c7373babb88520cb358d1f4651500621ae2a229538c5952303c452370435c050bc5555f821a7257d56449687107c2e8a92907a19cf7b559464ca95e72b49af7')
b2sums=('13a0e5d56ace99087a0e199b301cc3ce1f21a27f8e32b3030053a2c5cfbefa0c7c9aa724f1db5a23a82f593ff4d64f11bc1802b21221c948a2c059e5b3140297')
provides=($pkgname)
conflicts=($pkgname)

package() {
	cd "${srcdir}/${_pkgname}"

	mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
	cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_pkgname}/"
}
