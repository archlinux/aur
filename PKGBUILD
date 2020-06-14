# Maintainer: willemw <willemw12@gmail.com>

pkgname=daily-wallpaper-git
pkgver=r82.0b5e9e0
pkgrel=1
pkgdesc="Change wallpaper automatically with the Photo of The Day of you loved source"
arch=('x86_64')
url="https://github.com/atareao/daily-wallpaper"
license=('MIT')
depends=('python-gobject' 'python-lxml' 'python-cssselect' 'python-requests' 'python-crontab' 'python-plumbum' 'gtk3' 'libnotify')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
}

