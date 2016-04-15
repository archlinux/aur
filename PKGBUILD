# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna-dssr
_pkgver=1.5.3
pkgver=${_pkgver}_2016apr11
pkgrel=1
pkgdesc="DSSR, an integrated software tool for Dissecting the Spatial Structure of RNA. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('i686' 'x86_64')
url="http://x3dna.org/"
license=('custom')
depends=('glibc')
source_i686=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-32bit/x3dna-dssr")
md5sums_i686=('739415feaa9e7ca8f29964b1759bc692')
source_x86_64=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-64bit/x3dna-dssr")
md5sums_x86_64=('a8671ecb489ffc0a5931204087eade78')

package() {
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
