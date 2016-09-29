# Maintainer: Jonathan Duck <duckbrain30@gmail.com>
pkgname=typora
pkgver=0.9.19
pkgrel=3
pkgdesc="Typora will give you a seamless experience as both a reader and a writer."
arch=('x86_64')
filename="${pkgname}_${pkgver}_amd64.deb"
url="https://typora.io/"
source=("https://typora.io/./linux/$filename")
md5sums=('30b9881f6d698a5442dff96002d9d812')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	rm -rf "${pkgdir}"/usr/share/lintian/
	chmod -R 755 "$pkgdir"
}
