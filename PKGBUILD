# Maintainer: zzy-ac <1304024859@qq.com>
pkgname=markdown-editor-zzy-ac
pkgver=1
pkgrel=1
pkgdesc="markdown editor by zzy-ac"
arch=(x86_64)
url="https://github.com/zzy-ac/markdown-editor-zzy-ac/"
license=('GPL')
depends=('electron')
source=("https://github.com/zzy-ac/markdown-editor-zzy-ac/raw/main/markdown-editor-zzy-ac.tar.gz")
md5sums=("1f822dcc931d3e71261157b55eb6f7ed")

prepare() {
	mkdir "$pkgname-$pkgver"
	cp -r usr "$pkgname-$pkgver"/usr
}


package() {
	cd "$pkgname-$pkgver"
    cp -r usr ${pkgdir}
}
 
 
