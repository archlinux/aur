# Maintainer: softeye<tsg340521@163.com>
pkgname=vim-autocomplpop
pkgver=2.14.1
pkgrel=1
pkgdesc="With this plugin, your vim comes to automatically opens popup menu for 
completions when you enter characters or move the cursor in Insert mode. It 
won't prevent you continuing entering characters."
arch=('any')
url="https://bitbucket.org/ns9tks"
license=('MIT')
groups=('vim-plugins')
depends=('vim>=7.0')
source=($pkgname-$pkgver.tar.gz::$url/$pkgname/get/$pkgver.tar.gz)
md5sums=('20a05e67c12cc39a57ada1496dcf8417')
package(){
    cd $srcdir
    _subdir=$(ls|grep -m1 $pkgname)
    cd $_subdir
    install -dm755 $pkgdir/usr/share/vim/vimfiles
    cp -a autoload plugin doc $pkgdir/usr/share/vim/vimfiles
}
