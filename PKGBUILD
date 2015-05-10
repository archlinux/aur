# Maintainer: K1412 <FD.K1412@openaliasbox.org>
pkgname=schema2ldif
pkgver=1.0
pkgrel=2
pkgdesc="Convert .schema to .ldif." 
arch=('any')
url='https://forge.fusiondirectory.org/projects/schema2ldif'
license=('BSD')

source=("http://repos.fusiondirectory.org/sources/1.0/schema2ldif/${pkgname}-${pkgver}.tar.gz")
md5sums=('6241c0138b56d1b5941f6e9df496aa06')

package() {
  cd ${pkgname}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/bin/
  cp ./bin/schema2ldif ${pkgdir}/usr/bin/

  mkdir -p ${pkgdir}/usr/share/man/man1/
  gzip ./man/schema2ldif.1
  cp ./man/schema2ldif.1.gz ${pkgdir}/usr/share/man/man1/

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./LICENSE ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./README ${pkgdir}/usr/share/doc/${pkgname}/
}

