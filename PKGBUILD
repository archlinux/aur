# Maintainer: zzy-ac <1304024859@qq.com>
pkgname=java-bytecode-editor
pkgver=1
pkgrel=2
pkgdesc="Java Bytecode Editor"
arch=(x86_64)
url="https://github.com/zzy-ac/Java_Bytecode_Editor"
license=('GPL')
depends=('jdk8-openjdk')

source=("https://raw.githubusercontent.com/zzy-ac/Java_Bytecode_Editor/main/Java_Bytecode_Editor.tar.gz")
md5sums=("0107c87f5fbec0ea393e0b521c2205fe")

prepare() {
	mkdir "$pkgname-$pkgver"
	cp -r opt "$pkgname-$pkgver"/opt
	cp -r usr "$pkgname-$pkgver"/usr
}


package() {
	cd "$pkgname-$pkgver"
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}
 
 
