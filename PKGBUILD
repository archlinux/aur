# Maintainer: Dave Shoreman <aur+nextshot at dsdev dot io>
pkgname=nextshot
pkgver=0.8.2
pkgrel=1
pkgdesc="A simple screenshot tool that uploads to Nextcloud and works with Sway and X11"
arch=('x86_64')
url="https://github.com/dshoreman/nextshot"
license=('GPL')
source=(https://github.com/dshoreman/nextshot/archive/v0.8.2.tar.gz)
md5sums=('b4b1ab471694b251d38fd2a3a7a459be')


package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin"
    cp -p nextshot.sh "$pkgdir/usr/bin/nextshot"
}
