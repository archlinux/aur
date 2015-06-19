# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: ekse <ekse.0x@gmail.com>
pkgname=halberd
pkgver=0.2.4
pkgrel=3
pkgdesc="Tool to discover HTTP load balancers"
url='https://github.com/jmbr/halberd'
license="GPL"
depends=('python2')
arch=('i686' 'x86_64')
provides=('halberd')
conflicts=('halberd-git')
source=("http://halberd.superadditive.com/dist/halberd-${pkgver}.tar.gz")
md5sums=('d60d0fba8f379ea72c623ad1dd6052c3')

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python2 setup.py install --root "${pkgdir}"
}
