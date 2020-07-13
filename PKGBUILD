# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=6.10.1
pkgrel=1
pkgdesc="Spring Boot + Angular/React in one handy generator"
arch=('any')
url="https://www.jhipster.tech/"
license=('APACHE')
depends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('65304b03bb52f8a7501e4074475b386c8c6e57692e30c878f49335e1d1dd9afd')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
