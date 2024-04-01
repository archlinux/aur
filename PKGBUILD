# Maintainer: nbebaw <nader.bebawy@gmx.de>

pkgname=archub-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="Command-line tool designed for managing packages in AUR"
arch=(x86_64)
url="https://github.com/nbebaw/Archub"
license=(MIT)
depends=(git)
provides=(archub)
conflicts=(archub)
source_x86_64=("archub-${pkgver}::https://github.com/nbebaw/Archub/releases/download/v$pkgver/archub")
sha256sums_x86_64=('c0b0d6292f082f6a16f500c596d6b9d79e4b3859a76814b357756f782f6aa6fa')

package() {
	install -Dm755 "archub-${pkgver}" "${pkgdir}/usr/bin/archub"
    # todo: install license since is not common
}
