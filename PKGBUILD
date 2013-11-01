# Maintainer: 謝致邦<Yeking@Red54.com>

pkgname=lubuntu-artwork
pkgver=0.38.1
pkgrel=1
pkgdesc='artwork of Lubuntu'
arch=('any')
url='http://wiki.ubuntu.com/Lubuntu/Artwork'
license=('GPL')
optdepends=('gtk-engine-murrine: gtk2 theme support'
'elementary-icons: icons support'
'gtk-engine-unico: gtk3 theme support')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/lubuntu-artwork/lubuntu-artwork_$pkgver.tar.gz")
md5sums=('912a533c5840019edd9fa33db9e75512')

package(){
	cp -r $srcdir/lubuntu-artwork-$pkgver/usr $pkgdir
}
