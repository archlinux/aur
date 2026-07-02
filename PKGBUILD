# Maintainer: RXTX4816 <RXTX4816@proton.me>
pkgname=cockpit-dockermanager
pkgver=1.0.8.2
pkgrel=1
pkgdesc="A Cockpit plugin for managing Docker containers"
arch=('any')
url="https://github.com/chrisjbawden/cockpit-dockermanager"
license=('MIT')
depends=('cockpit' 'docker')
source=("git+https://github.com/chrisjbawden/cockpit-dockermanager.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/cockpit-dockermanager"
  install -dm755 "$pkgdir/usr/share/cockpit/dockermanager"
  install -m644 dockermanager/{index.html,app.js,style.css,manifest.json} "$pkgdir/usr/share/cockpit/dockermanager/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
