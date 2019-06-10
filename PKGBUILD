# Maintainer : nyyu <mail@nyyu.tk>

_npmname=generator-jhipster
pkgname=nodejs-generator-jhipster
pkgver=6.0.1
pkgrel=1
pkgdesc="Spring Boot + Angular/React in one handy generator"
arch=('any')
url="https://jhipster.github.io/"
license=('APACHE')
depends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('a1f8d9d91fbc77f46209b5023f41a50fccf3bb31d7de3d3d4ae8ca667530bd21')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
