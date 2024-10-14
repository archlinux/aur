# Maintainer: Aleks Grabowski <hurufu+aur@gmail.com>
pkgname=bprolog
pkgver=8.1
pkgrel=3
pkgdesc='Versatile and efficient constraint logic programming (CLP) system'
arch=(x86_64)
url='http://www.picat-lang.org/bprolog/index.html'
license=(unknown)
options=(!strip)
source=('http://www.picat-lang.org/bprolog/download/bp81_linux64.tar.gz')
sha256sums=('d7724ca52c39e0ec4d5506824c1e1fbd2e3336c08ad219612ba38bf550549203')

package() {
    cd BProlog
    install -D --mode=755 bp "$pkgdir/usr/bin/bprolog"
    install -D --mode=644 -t "$pkgdir/usr/share/doc/bprolog" Document/manual.pdf
    mkdir -p "$pkgdir/usr/share/examples"
    cp -a examples "$pkgdir/usr/share/examples/bprolog"
}
