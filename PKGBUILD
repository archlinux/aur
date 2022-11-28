# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.1.0.20221128
_pkgvergh=v0.1.0-alpha-20221128-weekly
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("greptime-linux-amd64-${pkgver}.tgz::https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64.tgz")
sha256sums=("d5658f956b528d05a8089aeb2210f8f373c6d2d89b5e111a6b43fab368a6c929")

package() {
    install -Dm755 "${srcdir}/greptime" "${pkgdir}/usr/bin/greptime"
}
