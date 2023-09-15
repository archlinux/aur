# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-text-sparv'
pkgver=2.60
pkgrel=1
pkgdesc="The Reina-Valera Bible (1909) is a Spanish Bible translation based on the Textus Receptus."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-text-sparv"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-text-sparv/sword-text-sparv_2.60-1_all.deb")
sha256sums=('5c87f9b2bc97457e8a872f5bae7ea7ce59cb3de1dcee73e4d4740451863694cf')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr $(pwd)/../pkg/${pkgname}/usr
}
