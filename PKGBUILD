pkgname=tgforge
pkgver=0.1.0
pkgrel=1
pkgdesc="Bash library for building Telegram bots"
arch=('any')
url="https://github.com/user14923929/tgforge"
license=('GPL-3.0-or-later')
depends=('curl' 'jq' 'bash')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00692fa08ddd2560c1823847b7add4a8b71fe58edf64c488c3acf627c853032d')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 tgforge "$pkgdir/usr/lib/$pkgname/$pkgname"
}
