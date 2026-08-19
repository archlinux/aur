# Maintainer: Caitlyn Williams <caitlyn dot williams at proton dot me>

pkgname=localsend-ufw-rules
pkgver=1.0.0
pkgrel=1
pkgdesc="Add UFW rule(s) for LocalSend's used ports"
arch=('any')
license=('Unlicense')
depends=('localsend' 'ufw')
options=('!emptydirs')
source=("localsend-rules")
install=localsend-rules.install

package() {
	install -Dm755 localsend-rules ${pkgdir}/etc/ufw/applications.d/localsend
}

sha256sums=('ad840a5211462c01325208d953276cacbdc51faed844695388ac0f5ebf47cb5f')
