# Maintainer: Martin Mlynář <nexus+arch@smoula.net>
pkgname=dokku-psql-single-container
pkgver=0.3.22
pkgrel=1
pkgdesc="Dokku plugin - postgresql, one-container"
arch=(i686 x86_64)
url="https://github.com/Flink/dokku-psql-single-container"
license=(MIT)
depends=(
	'dokku'
)
makedepends=(
	'git'
)
source=(
  "git+https://github.com/Flink/dokku-psql-single-container.git#tag=v0.3.22"
  "${pkgname}.install"
)
sha256sums=(
  'SKIP'
  '10883701e5b6737064ffc10a932cfcd467ba45c6ee3ebd4f500a86ffc7f2fb06'
)
install=${pkgname}.install

package() {
  cd "${srcdir}/$pkgname"

  mkdir -p "${pkgdir}"/var/lib/dokku/plugins/psql-sc
  cp -r * "${pkgdir}"/var/lib/dokku/plugins/psql-sc
}

