# Maintainer:
# Contributor: Alexander Fetting <deeznuts420692@proton.me>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear-data
pkgver=2024.1.4
pkgrel=1
pkgdesc="The FlightGear base package contains the necessary data files to run FlightGear"
arch=('any')
url="https://gitlab.com/flightgear/fgdata"
license=('GPL-2.0-or-later')
depends=('bash' 'perl' 'python')
source=("${url}/-/archive/${pkgver}/fgdata-${pkgver}.tar.gz")
sha256sums=('68d277d5b440b899185cfed597ae45bd85c033e0b420be74656ded9103df6310')

package() {
    cd "fgdata-${pkgver}"
    install -d "${pkgdir}/usr/share/flightgear/data"
    cp -r * "${pkgdir}/usr/share/flightgear/data"
}
