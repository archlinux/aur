# Maintainer: Sergii Fesenko <sergii_f@outlook.com>


pkgname=lucene-grep-bin
pkgver=2022.05.25
pkgrel=1
pkgdesc="Grep-like utility based on Lucene Monitor compiled with GraalVM native-image"
arch=(x86_64)
url="https://github.com/dainiusjocas/lucene-grep"
license=('APACHE')
provides=(lucene-grep)
source=("https://github.com/dainiusjocas/lucene-grep/releases/download/v${pkgver}/lmgrep-v${pkgver}-linux-amd64-static.zip")
sha256sums=('d2dd4352f8c52e91bef000fa9e7e8839a2d9eaf3f3385e743cdd00d101af33c7')

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 -D lmgrep "$pkgdir"/usr/bin/lmgrep
}
