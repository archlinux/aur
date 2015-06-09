# Contributor: xifs <imxifs@gmail.com>

pkgname=myword
pkgver=0.9.5
pkgrel=1
pkgdesc="A featureful word recite tool by tualatrix"
arch=('any')
url="http://imtx.cn/"
license=('GPL2')
depends=('python' 'pygtk' 'gnome-python')
provides=('myword' 'myword-book')

source=("http://code-of-tualatrix.googlecode.com/files/myword_0.9.5-1.tar.gz")
md5sums=('572a204bd2775752c7179534720b8016')

build() {
	cd "$srcdir/myword"  || return 1
	mkdir -p "$startdir/pkg/usr/share/myword" || return 1
	mkdir -p "$startdir/pkg/usr/share/applications" || return 1
	mkdir -p "$startdir/pkg/usr/bin" || return 1
	cp -rv src/* "$startdir/pkg/usr/share/myword/"  || return 1
	cp -v myword.desktop "$startdir/pkg/usr/share/applications/myword.desktop"  || return 1
	cp -v myword "$startdir/pkg/usr/bin/myword"  || return 1
}
