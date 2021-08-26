# Maintainer: ashka <aur AT ashka DOT me>

pkgname=crunchy-postgresql-operator-bin
pkgver=4.7.2
pkgrel=1
pkgdesc="Crunchydata PostgreSQL Kubernetes operator"
arch=('x86_64')
url="https://github.com/CrunchyData/postgres-operator"
license=('Apache')
source=("https://github.com/CrunchyData/postgres-operator/releases/download/v${pkgver}/pgo")
md5sums=('46898b915a209d9fd44d7402e56956ac')

package() {
	install -Dm755 "${srcdir}/pgo" "${pkgdir}/usr/bin/pgo"
}
