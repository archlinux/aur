# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-text-kjv'
pkgver=14.3
pkgrel=1
pkgdesc="This is the King James Version of the Holy Bible (also known as the Authorized Version) with embedded Strong's Numbers."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-text-kjv"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-text-kjv/sword-text-kjv_14.3-1_all.deb")
sha256sums=('9f463f28ce665f6f528fc723179722bced880a4c5485f7a41bf742838315de57')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
