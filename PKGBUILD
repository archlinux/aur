# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna-dssr
pkgver=1.5.9_2016jul22
pkgrel=1
pkgdesc="DSSR, an integrated software tool for Dissecting the Spatial Structure of RNA. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=(x86_64)
url="http://x3dna.org/"
license=('custom')
depends=('glibc')
source=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-64bit/x3dna-dssr")
md5sums=('a26132be01c1375fd732bb9face0627f')

package() {
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
