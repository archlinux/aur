# Maintainer: Sergii Fesenko <sergii_f@outlook.com>


pkgname=lucene-grep-bin
pkgver=2023.01.30
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
provides=(lucene-grep)
source=("https://github.com/dainiusjocas/lucene-grep/releases/download/v${pkgver}/lmgrep-v${pkgver}-linux-amd64-static.zip")
sha256sums=('710bbecf763dc69463bb7964574e8c3c282526df3b7afc5891441b9fbb88b0c5')

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 -D lmgrep "$pkgdir"/usr/bin/lmgrep
}

