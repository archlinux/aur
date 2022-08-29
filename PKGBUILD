# Maintainer: Sergii Fesenko <sergii_f@outlook.com>


pkgname=lucene-grep-bin
pkgver=2022.07.27
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
provides=(lucene-grep)
source=("https://github.com/dainiusjocas/lucene-grep/releases/download/v${pkgver}/lmgrep-v${pkgver}-linux-amd64-static.zip")
sha256sums=('d87afba6448e85552828379c3858f06afb8469f2ed7a39560b15e7944663e3f8')

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 -D lmgrep "$pkgdir"/usr/bin/lmgrep
}
