# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
# Contributor: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname=aurvote-utils
pkgver=1.1.0
pkgrel=2
pkgdesc='A set of utilities for managing AUR votes'
arch=('any')
url=https://github.com/jadenPete/aurvote-utils
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests')
source=("${pkgname}-${pkgversion}.tar.gz::https://github.com/jadenPete/aurvote-utils/archive/v${pkgver}.tar.gz")
sha256sums=('dcfe41a1e49f7780f24fc84c85cd8e765384fbf009e2d1670707b28b22d2415c')

package() {
	cd "aurvote-utils-${pkgver}"
	install -D aur-vote "${pkgdir}/usr/bin/aur-vote"
	install aur-autovote "${pkgdir}/usr/bin/aur-autovote"
    install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
