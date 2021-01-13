pkgname=tmpsms
pkgver=1.0.0
pkgrel=2
depends=('fzf' 'jq' 'curl')
arch=('any')
url="https://github.com/sdushantha/tmpsms"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('97b602bb2a7139a4b01bc3f9d536738ece100bedb7dd812411c5396d252b693b')

package() {
  cd "$pkgname-$pkgver"
	chmod +x "tmpsms"
  install -Dm755 "tmpsms" "$pkgdir/usr/bin/tmpsms"
}
