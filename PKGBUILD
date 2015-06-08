# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=pivaders
pkgver=0.2
pkgrel=1
pkgdesc="Space Invaders game"
arch=('any')
url="https://github.com/russb78/${pkgname}"
license=('GPL2')
depends=('python' 'python2-pygame')
conflicts=('pivaders-git')
source=("https://github.com/russb78/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha1sums=('a576ce00302b9dab87e75d83947943dc10d4d287'
          '60183ae638d48bc5493eb318e54fb61a6454cfa3')
 
package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" ${pkgdir}/usr/bin/${pkgname}
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -r ${srcdir}/${pkgname}-${pkgver}/${pkgname}/* ${pkgdir}/usr/share/${pkgname}/
}
