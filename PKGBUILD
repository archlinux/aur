# Contributor: Anatol Pomozov
# Maintainer: tee < teeaur at duck dot com >

pkgname=osquery-bin
pkgver=5.23.1
pkgrel=1
pkgdesc='SQL powered operating system instrumentation, monitoring, and analytics(upstream binary)'
arch=(x86_64)
url='https://osquery.io'
license=('Apache-2.0 OR GPL-2.0-or-later')
depends=(bash glibc)
provides=(osquery)
conflicts=(osquery)
#replaces=(osquery)
#source=("https://pkg.osquery.io/linux/osquery-${pkgver}_1.linux_$arch.tar.gz")
source=("https://pkg.osquery.io/deb/osquery_${pkgver}-1.linux_amd64.deb")
b2sums=('5dacc8f70f00f1ca2f897472fb4c07c930afbf192982da4497aa3221a2a8c7af415687a174b3393710f8ad32d57e736e5824433a6ed9a5fc4edb27c81382492d')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
}
