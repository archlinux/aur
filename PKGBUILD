# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=yuioto-keyring
_name=yuioto
pkgver=20240207
pkgrel=1
pkgdesc='yuioto PGP keyring'
arch=('any')
url='https://github.com/yuioto/yuioto-keyring'
license=('GPL')
source=("${pkgname}::git+$url.git#tag=${pkgver}")
sha512sums=('SKIP')
install=${pkgname}.install

package() {
	install -Dm644 ${pkgname}/${_name}.gpg $pkgdir/usr/share/pacman/keyrings/${_name}.gpg
	install -Dm644 ${pkgname}/${_name}-revoked $pkgdir/usr/share/pacman/keyrings/${_name}-revoked
	install -Dm644 ${pkgname}/${_name}-trusted $pkgdir/usr/share/pacman/keyrings/${_name}-trusted

}
