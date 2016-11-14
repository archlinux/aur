# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: ekse <ekse.0x@gmail.com>
pkgname=halberd
pkgver=0.2.4
pkgrel=4
pkgdesc="Tool to discover HTTP load balancers"
url='https://github.com/jmbr/halberd'
license=("GPL")
depends=('python2')
arch=('i686' 'x86_64')
provides=('halberd')
conflicts=('halberd-git')
makedepends=('python-setuptools')
source=("https://github.com/jmbr/halberd/archive/${pkgver}.tar.gz")
sha512sums=('133eb683f46a078b45023198746c583ae96cd54b75eedbc46a3d49675307927a7d9f05383e312b589fa5efe79e68c75fcd1d31649df2852ca27cc5d30c307672')

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}
