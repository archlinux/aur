# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>

pkgname=ocaml-includepatch
pkgver=1.0
pkgrel=2
license=('custom')
arch=('any')
pkgdesc="OCAML saves its includefiles in /usr/lib/ocaml/caml. Due to the unusual location for these files which makes compiling certain libraries impossible, this package symlinks this path to /usr/include/caml"
url="http://caml.inria.fr/ocaml/"
depends=('ocaml')

package() {
	install -d "${pkgdir}/usr/include"
	ln -s "/usr/lib/ocaml/caml" "${pkgdir}/usr/include/caml"
}
