pkgname=netchecker
pkgver=1.0.6
pkgrel=1
pkgdesc="Simple network checker with JSON configuration"
arch=('any')
url="https://github.com/radlesner/netchecker"
license=('GPL-3.0')
depends=('bash' 'jq' 'iputils')

source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$pkgname"

  install -Dm755 netchecker "$pkgdir/usr/bin/netchecker"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
