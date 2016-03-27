# Maintainer: Valerio Pizzi (pival81) <pival81@yahoo.com>

pkgname=mybsmart
pkgver=1
pkgrel=1
pkgdesc="Accedi gratuitamente a una ricca proposta di contenuti multimediali, libri digitali, strumenti di lavoro per insegnare e per apprendere."
arch=("x86_64" "i686")
url="bsmart.it"
license=('unknown')
source_x86_64=('http://res.bsmart.it.s3.amazonaws.com/mybsmart_desktop/releases/production/linux/x64/MybSmart.deb')
source_i686=('http://res.bsmart.it.s3.amazonaws.com/mybsmart_desktop/releases/production/linux/ia32/MybSmart.deb')
noextract=('MybSmart.deb')
md5sums_x86_64=('SKIP')
md5sums_i686=('SKIP')

package() {
 ar p MybSmart.deb data.tar.xz | tar xJ
 mv usr $pkgdir
}
