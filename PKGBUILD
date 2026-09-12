# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear-data
pkgver=2024.1.7
pkgrel=1
pkgdesc="The FlightGear base package contains the necessary data files to run FlightGear"
arch=('any')
url="https://gitlab.com/flightgear/fgdata"
license=('GPL-2.0-or-later')
depends=('bash' 'perl' 'python')
source=("${url}/-/archive/${pkgver}/fgdata-${pkgver}.tar.gz")
sha256sums=('9637b3c3c3de86835dd7aa08a2e8d727e35993d99271e9bab74099d4cf6d3e66')

package() {
    cd "fgdata-${pkgver}"
    install -d "${pkgdir}/usr/share/flightgear/data"
    cp -r * "${pkgdir}/usr/share/flightgear/data"
}
