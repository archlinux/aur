# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=superfamily
pkgver=13.1
pkgrel=1
pkgdesc=''
arch=('any')
license=('custom')
url='http://supfam.org'
depends=('hmmer')
makedepends=('bash')
provides=()
path="/SUPERFAMILY/downloads"
source=(
        "$url$path/downloads.tar.gz"
)

sha512sums=(
'SKIP'
)

package() {
  mkdir -p  "$pkgdir/opt/$pkgname/"
  #find * -maxdepth 0 -regex '.+\.gz|.+\.tgz' -prune -o -print0 | xargs -0 -i cp -rf {} "$pkgdir/opt/$pkgname/"
  #cp -rf hmmscoring/* "$pkgdir/opt/$pkgname/"
  install -D license/* "$pkgdir/opt/$pkgname/"
  install -D SUPERFAMILY/* "$pkgdir/opt/$pkgname/"
  
}
