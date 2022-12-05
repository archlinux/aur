# Maintainer: Ning Sun <n at sunng dot info>

pkgname=greptimedb-bin
pkgver=0.1.0.20221205
_pkgvergh=v0.1.0-alpha-20221205-weekly
pkgrel=1
pkgdesc='Open-source time-series database.'
arch=('x86_64')
url='https://github.com/GreptimeTeam/greptimedb'
license=('Apache-2.0')
provides=('greptimedb')
conflicts=()

source=("greptime-linux-amd64-${pkgver}.tgz::https://github.com/GreptimeTeam/greptimedb/releases/download/${_pkgvergh}/greptime-linux-amd64.tgz")
sha256sums=("fed5fddadb2d580cbf68d4a2dcfa4e7f2686f04bf4a557c7525e3125fbeb66fb")

package() {
    install -Dm755 "${srcdir}/greptime" "${pkgdir}/usr/bin/greptime"
}
