#Maintainer Guoyi Zhang <GuoyiZhang at malacology dot net>

pkgname=appflowy-bin
_pkgname=appflowy
_pkg=AppFlowy
pkgver=0.0.2
pkgrel=1
pkgdesc="an open-source alternative to Notion"
arch=('x86_64')
url="https://www.appflowy.io/"
license=('AGPL')
provides=('appflowy')
conflicts=('appflowy' 'appflowy-git')
source=("https://github.com/AppFlowy-IO/appflowy/releases/download/${pkgver}/AppFlowy-Linux-arm64.zip")
sha256sums=('ea24fa5359a8c184b2e99d377c7d7600130bbd63672b88507e2e721726bb37e4')

package(){
	install -dm755 "$pkgdir"/usr/{bin,share/{$_pkgname/data,lib,applications}}
	install -Dm 755 $srcdir/$_pkg/app_flowy $pkgdir/usr/bin/$_pkgname
	cp -r $srcdir/$_pkg/data/* $pkgdir/usr/share/$_pkgname/data
	cp -r $srcdir/$_pkg/lib/* $pkgdir/usr/share/lib

}
