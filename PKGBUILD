# Maintainer: Sukbeom Kim <sukbeom.kim@gmail.com>
pkgname=klicknmenu
pkgver=0.1
pkgrel=1
pkgdesc="X11 based lightweight menu application"
arch=('any')
url="https://github.com/seokbeomKim/klicknmenu"
license=('GPL')
depends=('')
source=("git://github.com/seokbeomKim/klicknmenu")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    
    sudo make install
    
    cp .klicknmenu.example ~/.klicknmenu.example

    echo "Please copy the ~/.klicknmenu.example to ~/.klicknmenu and modify the file appropriately as you want.";
}

