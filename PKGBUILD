# Maintainer: Ray Chung <ray20020809@gmail.com>
pkgname=instagram-web
pkgver=0.99
pkgrel=1
pkgdesc="A browser based imstagram client"
arch=(i686 x86_64)
url="SKIP"
license=('GPL')
depends=('electron')
makedepends=()
source=('git+https://github.com/ray1422/instagram-web.git')
md5sums=('SKIP')

package(){
    install -Dm 755 "$pkgname/instagram.desktop" "$pkgdir/usr/share/applications/instagram.desktop"
    mkdir "$pkgdir/opt"
    mv "$pkgname" "$pkgdir/opt/instagram-web"
}

