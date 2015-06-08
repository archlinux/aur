# Maintainer: FadeMind <fademind@gmail.com>

pkgname=yakuake-l10n-frameworks
pkgver=2.9.9.87
pkgrel=2
pkgdesc="Language packs for yakuake-frameworks"
arch=('any')
url="https://www.kde.org/applications/system/yakuake"
license=('GPL')
depends=('yakuake-frameworks-git')
source=('yl10nf.tar.xz::https://copy.com/T7RYKoI977qTjmCh/yl10nf.tar.xz?download=1')
sha256sums=('aaf509c9fa6a208785ae39a6b5ec3a71a26c8ed242e297854e5c47d1e6668216')

package() {
	install -dm755 ${pkgdir}/usr/share/locale/
	cd ${srcdir}/l10n/
	cp -rf * ${pkgdir}/usr/share/locale/
}
