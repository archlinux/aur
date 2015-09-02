# Maintainer: softeye<tsg340521@163.com>
_pkgname=rsense
pkgname=vim-$_pkgname
pkgver=0.3
pkgrel=1
pkgdesc="Vim plugin for ruby autocomlete,You need set g:rsenseHome properly in vimrc."
arch=('any')
url="http://cx4a.org/pub/rsense"
license=('GPL3')
groups=('vim-plugins')
depends=('vim' 'ruby' 'jre7-openjdk')
source=($url/$_pkgname-$pkgver.tar.bz2)
md5sums=('78b6d5aeb195a01ec955f50d97fde27e')
package(){
    cd $srcdir
    install -dm755 $pkgdir/opt
    cp -af $_pkgname-$pkgver $pkgdir/opt
    cd $pkgdir/opt/$_pkgname-$pkgver
    chmod +x bin/rsense
    install -dm755 $pkgdir/usr/share/vim/vimfiles/plugin
    cp -f etc/rsense.vim $pkgdir/usr/share/vim/vimfiles/plugin
}
