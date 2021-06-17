# Maintainer: ashka <aur AT ashka DOT me>

pkgname=crunchy-postgresql-operator-bin
pkgver=4.7.0
pkgrel=1
pkgdesc="Crunchydata PostgreSQL Kubernetes operator"
arch=('x86_64')
url="https://github.com/CrunchyData/postgres-operator"
license=('Apache')
source=("https://github.com/CrunchyData/postgres-operator/releases/download/v${pkgver}/pgo")
md5sums=('4c0395782f5bfc10b24c817fc9967f60')

package() {
	install -Dm755 "${srcdir}/pgo" "${pkgdir}/usr/bin/pgo"
}
