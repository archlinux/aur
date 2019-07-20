# Maintainer : Robert Gonciarz <gonciarz (malpa) gmail (kropka) com>
# Upstream author: Deepu K Sasidharan

_npmname=generator-jhipster-vuejs
pkgname=nodejs-generator-jhipster-vuejs
pkgver=1.1.0
pkgrel=1
pkgdesc="Vue.js blueprint for JHipster"
arch=('any')
url="https://github.com/jhipster/jhipster-vuejs"
license=('Apache2')
depends=('npm' 'nodejs-generator-jhipster')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('e9dc177d8a22fa351e06e13b9f6650f0a13574a664b9e0650c54de84adcef237')
install="${pkgname}.install"

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  find "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules -type d -exec chmod 755 {} \;
}
