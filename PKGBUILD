# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=pixiv-dl
pkgver=1.0
pkgrel=1
pkgdesc="A Pixiv Images Downloader Based on Python3"
arch=('any')
url="https://github.com/Brx86/Pixiv-1"
license=('GPL3')
depends=('python')
makedepends=('git')
source=('pixiv.py')
md5sums=('a7a9ce2726e23cb569d54a9cd2983c75')

package() {
  install -Dm755 pixiv.py "$pkgdir/usr/bin/pixiv-dl"
}
