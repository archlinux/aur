# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=firehose_get
pkgver=0.4.13
pkgrel=1
pkgdesc="TCGA data portal"
arch=('any')
url="http://gdac.broadinstitute.org/"
license=('unknown')
depends=('bash')
makedepends=('unzip')
source=("http://gdac.broadinstitute.org/runs/code/firehose_get-v$pkgver.zip")
sha256sums=('397eabdbe3725e9f1fdd948255a76d8f3a7e9d6ad6ed59d14692ca2ecc02fadb')

prepare() {
    cd "$srcdir"
    unzip -o firehose_get-v$pkgver.zip
}

package() {
    install -Dm755 "$srcdir"/firehose_get "$pkgdir"/usr/bin/firehose_get
}
