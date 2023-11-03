# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="toc"
pkgver=1.0.0
pkgrel=1
pkgdesc="Generate a table of contents from the comments of a file"
url="https://github.com/AlphaJack/toc"
license=("GPL3")
arch=("any")
depends=("awk"
         "bash"
         "perl"
         "sed")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ed77f1fdb44041a1323b43726fc66f87907a9e8fdb5f411203f0297260e9c5ca2de74a0bd4b5eb951dfca909321353af668910927169fbd532c5cd783fd3ddf7')

package(){
 cd "$pkgname-$pkgver"
 install -D -m 755 "toc" -t "$pkgdir/usr/bin"
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/toc"
}
