# Contributor: Anatol Pomozov
# Maintainer: tee < teeaur at duck dot com >

pkgname=osquery-bin
pkgver=5.24.0
pkgrel=1
pkgdesc='SQL powered operating system instrumentation, monitoring, and analytics(upstream binary)'
arch=(x86_64)
url='https://osquery.io'
license=('Apache-2.0 OR GPL-2.0-or-later')
depends=(bash glibc)
provides=(osquery)
conflicts=(osquery)
#source=("https://pkg.osquery.io/linux/osquery-${pkgver}_1.linux_$arch.tar.gz")
source=("https://pkg.osquery.io/deb/osquery_${pkgver}-1.linux_amd64.deb")
b2sums=('14a0bcaa04765a3b23a2782f4dcc80576896bbbd92aa7dd377d5ff88aa18eea87d3a260fb287d35c529077375ff3e0bb3a650aae3831a1aeca8e79dd2cef5a47')

package() {
  tar -xf data.tar.gz -C "$pkgdir" --exclude /etc/init.d/osqueryd --exclude /etc/init.d
}
