pkgname=firehose_get
pkgver=0.4.3
pkgrel=1
pkgdesc="TCGA data portal"
arch=('any')
url="http://gdac.broadinstitute.org/"
license=('unknown')
depends=('bash')
makedepends=('unzip')
source=("http://gdac.broadinstitute.org/runs/code/firehose_get-v$pkgver.zip")
noextract=("firehose_get-v$pkgver.zip")
md5sums=('a3da043d086458be1ae62bc5fc48f9d0')

package() {
    mkdir -p "$pkgdir/usr/bin"
    unzip -d "$pkgdir/usr/bin" firehose_get-v$pkgver.zip
}
