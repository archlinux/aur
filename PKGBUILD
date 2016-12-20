# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=firehose_get
pkgver=0.4.8
pkgrel=1
pkgdesc="TCGA data portal"
arch=('any')
url="http://gdac.broadinstitute.org/"
license=('unknown')
depends=('bash')
makedepends=('unzip')
source=("http://gdac.broadinstitute.org/runs/code/firehose_get-v$pkgver.zip")
noextract=("firehose_get-v$pkgver.zip")
md5sums=('fe4978f075460e5548aecc07d88cf51e')

package() {
  mkdir -p "$pkgdir/usr/bin"
  unzip -d "$pkgdir/usr/bin" firehose_get-v$pkgver.zip
}
