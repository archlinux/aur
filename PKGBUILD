# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=pcstat
pkgver=2014_05_02
pkgrel=1
pkgdesc="Utility to get page cache stats for files"
arch=('i686' 'x86_64')
url="https://github.com/tobert/pcstat"
license=('Apache')
depends=()

source=("https://raw.githubusercontent.com/tobert/pcstat/master/LICENSE")
source_i686=("https://github.com/tobert/pcstat/raw/2014-05-02-01/pcstat.x86_32")
source_x86_64=("https://github.com/tobert/pcstat/raw/2014-05-02-01/pcstat.x86_64")

sha256sums=('6dc0e068dcf3a5bc8e054205b85b7720e1d49265bbc64bf515d2cf79197df69a')
sha256sums_i686=('2041b610b21929ab8b96e36c20653530878dbfe77006ed065b6e1448f5c80896')
sha256sums_x86_64=('a7275b65348c3de555410ab7e5c2dde0d2952bed9c691befbf71ac8ae10538e4')

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 pcstat.x86_* "$pkgdir/usr/bin/pcstat"
}
