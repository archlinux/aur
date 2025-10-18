
# Maintainer: Rron Nurboja <rronnurboja@gmail.com>
pkgname=electrotility
pkgver=2.0.0
pkgrel=1
pkgdesc="Ultimate Linux Power Utility Tool"
arch=('any')
url="https://github.com/Rronnurboja/electrotility"
license=('GPL3')
depends=('bash')
optdepends=(
    'curl: for downloading components'
    'wget: alternative download tool'
    'git: for some development features'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rronnurboja/electrotility/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(c29c2476eedd9153de6dd8714e3daa31)  

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 electrotility.sh "$pkgdir/usr/bin/electro"
}
