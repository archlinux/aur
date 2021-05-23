# Maintainer: Sergii Fesenko <sergii_f@outlook.com>


pkgname=lucene-grep-bin
pkgver=2021.05.02
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
provides=(lucene-grep)
source=("https://github.com/dainiusjocas/lucene-grep/releases/download/v${pkgver}/lmgrep-v${pkgver}-linux-static-amd64.zip")
sha256sums=('42a7bba27d8fce89ff049acf14e61ac7a70ab6a874875972c2366ea6b39a107a')

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 -D lmgrep "$pkgdir"/usr/bin/lmgrep
}

