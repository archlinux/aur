# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=yuioto-keyring
_name=yuioto
pkgver=20240207
pkgrel=2
pkgdesc='yuioto PGP keyring'
arch=('any')
url='https://github.com/yuioto/yuioto-keyring'
license=('GPL')

source=("${pkgname}-${pkgver}::$url/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('66873b4cea3e39b0d5cbf47120597ea0c6fbed3f7b3cf25c39639be300908ff38d8aec40f63ae78719bd48fa33f6a4db83fcb06990fb2d1e6986fc1ec91ae56b')
install=${pkgname}.install

package() {
	install -Dm644 ${pkgname}/${_name}.gpg $pkgdir/usr/share/pacman/keyrings/${_name}.gpg
	install -Dm644 ${pkgname}/${_name}-revoked $pkgdir/usr/share/pacman/keyrings/${_name}-revoked
	install -Dm644 ${pkgname}/${_name}-trusted $pkgdir/usr/share/pacman/keyrings/${_name}-trusted

}
