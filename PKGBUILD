# Maintainer: Sergii Fesenko <sergii_f@outlook.com>


pkgname=lucene-grep-bin
pkgver=2023.09.29
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
provides=(lucene-grep)
source=("https://github.com/dainiusjocas/lucene-grep/releases/download/v${pkgver}/lmgrep-v${pkgver}-linux-amd64-static.zip")
sha256sums=('07dbb263a957cbfd188620c5ed5974f6c182dda608cd8f9f99d20a8659f82835')

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 -D lmgrep "$pkgdir"/usr/bin/lmgrep
}

