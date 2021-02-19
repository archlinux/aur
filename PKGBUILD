# Maintainer: ashka <aur AT ashka DOT me>

pkgname=crunchy-postgresql-operator-bin
pkgver=4.6.1
pkgrel=1
pkgdesc="Crunchydata PostgreSQL Kubernetes operator"
arch=('x86_64')
url="https://github.com/CrunchyData/postgres-operator"
license=('Apache')
source=('https://github.com/CrunchyData/postgres-operator/releases/download/v4.6.1/pgo')
md5sums=('60ce4edeb3e3944855b03c68b841626f')

package() {
	install -Dm755 "${srcdir}/pgo" "${pkgdir}/usr/bin/pgo"
}
