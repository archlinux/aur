# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna-dssr
pkgver=1.6.2_2016sept19
pkgrel=1
pkgdesc="DSSR, an integrated software tool for Dissecting the Spatial Structure of RNA. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('x86_64')
url="http://x3dna.org/"
license=('custom')
depends=('glibc')
source=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-64bit/x3dna-dssr")
md5sums=('956ec249235d7a89c64c0286ba79f749')

package() {
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
