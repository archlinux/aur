# Contributor: Kemel Zaidan <kemelzaidan@gmail.com>
# Maintainer: Aaron Liu <a a ronliu0130@gmail.com>
# Contributor: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname=aurvote-utils-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A set of utilities for managing AUR votes'
arch=('any')
url=https://github.com/gwuen/aurvote-utils
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests')
source=("aurvote-utils-bin-${pkgversion}.tar.gz::https://github.com/gwuen/aurvote-utils/archive/v${pkgver}.tar.gz" 'migrator')
sha256sums=('fd8b6748a6d4b7176957a488431ffea6bfbe8bb656105a83a902d38b90fd74dd')

package() {
	cd "aurvote-utils-${pkgver}"
	install -D aur-vote "${pkgdir}/usr/bin/aur-vote"
	install aur-autovote "${pkgdir}/usr/bin/aur-autovote"
    install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/aurvote-utils-bin/LICENSE"
}

