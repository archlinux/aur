# Maintainer: Tom Wizetek <tom@wizetek.com>

pkgname=redshifter
pkgver=20200404
pkgrel=1
pkgdesc="Control blue light filter (redshift) color temperature and brightness"
arch=('any')
url="https://github.com/wizetek/bash/blob/master/redshifter"
license=('GPL')
depends=('redshift' 'bc' 'bash')
source=("https://raw.githubusercontent.com/wizetek/bash/master/redshifter")
md5sums=('0fe6eba2d4644d88b8e3c17c7f1f7385')

package() {
  install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
}
