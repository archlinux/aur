# Maintainer: Programador Occidental

pkgname='pass-phrase'
pkgver=1.3
pkgrel=1
pkgdesc='A pass extension to generate passphrases.' 
arch=('any')
url='https://github.com/programadoroccidental/pass-phrase'
license=('GPL3')
depends=('pass')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0725fbeee95ad937a9052cac3ca4c952fafeaefc8b5cdd1e87339f0718b8dcfd77cc7ac3b194e5135b1ed17da2019ea0d0c1ed22361dba7f57827fe71e39f147')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" FORCE_ALL=1 install
}
