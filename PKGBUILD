# Maintainer: ashka <aur AT ashka DOT me>

pkgname=crunchy-postgresql-operator-bin
pkgver=4.7.3
pkgrel=1
pkgdesc="Crunchydata PostgreSQL Kubernetes operator"
arch=('x86_64')
url="https://github.com/CrunchyData/postgres-operator"
license=('Apache')
source=("https://github.com/CrunchyData/postgres-operator/releases/download/v${pkgver}/pgo")
md5sums=('218d69c21e2e39bb9b8de7b968b1227b')

package() {
	install -Dm755 "${srcdir}/pgo" "${pkgdir}/usr/bin/pgo"
}
