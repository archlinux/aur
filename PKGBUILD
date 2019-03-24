# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=5.8.2
pkgrel=1
pkgdesc="Spring Boot + Angular/React in one handy generator"
arch=('any')
url="https://jhipster.github.io/"
license=('APACHE')
depends=('nodejs-yeoman')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('153bfaf4e778a3797a22704d6a2d7630a1b4741131bc72352bacd075c51fed24')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
