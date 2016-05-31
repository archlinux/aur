# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna-dssr
pkgver=1.5.5_2016may25
pkgrel=1
pkgdesc="DSSR, an integrated software tool for Dissecting the Spatial Structure of RNA. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('i686' 'x86_64')
url="http://x3dna.org/"
license=('custom')
depends=('glibc')
source_i686=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-32bit/x3dna-dssr")
md5sums_i686=('7188c44887904143664742777bbfa017')
source_x86_64=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-64bit/x3dna-dssr")
md5sums_x86_64=('30e76380bba397139b75d78b25175549')

package() {
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
