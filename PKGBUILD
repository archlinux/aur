# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.1.0.20221122
_pkgvergh=v0.1.0-alpha-20221122-nightly
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64.tgz")
sha256sums=("95b77fe818d1292d7fcbd40245a7e29049cc946cb957f98d2e806eb825a14c31")

package() {
    install -Dm755 "${srcdir}/greptime" "${pkgdir}/usr/bin/greptime"
}
