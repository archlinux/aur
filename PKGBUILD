PACKAGER="Wings-Fantasy <hxshijie@outlook.com>"
pkgname=winrar
pkgver=6.0.0
pkgrel=1
pkgdesc="集文件压缩、加密、打包和数据备份为一体的实用软件"
arch=(x86_64)
url="https://www.win-rar.com/"
license=('custom')
source=("https://www.win-rar.com/fileadmin/winrar-versions/rarlinux-x64-$pkgver.tar.gz")
md5sums=('72c0e02195ee3ab7bc10eb747bc559f2')
provides=('rar' 'unrar')
conflicts=('rar-beta' 'unrar' 'rar')
replaces=('unrar')

package() {
	cd rar
	mkdir -p $pkgdir/usr/local/bin
	mkdir -p $pkgdir/etc
	mkdir -p $pkgdir/usr/local/lib
	cp rar unrar $pkgdir/usr/local/bin
	cp rarfiles.lst $pkgdir/etc
	cp default.sfx $pkgdir/usr/local/lib
}

