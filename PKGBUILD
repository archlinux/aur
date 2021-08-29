# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=ez-daily
pkgver=2.1.3
pkgrel=1
pkgdesc="A Tool to Download People's Daily Easily"
arch=('x86_64')
url="https://github.com/Brx86/yun"
license=('GPL3')
depends=('xdg-user-dirs' 'python' 'python-arrow' 'python-requests-html' )
source=('https://github.com/Brx86/yun/releases/download/2/ez-daily-2.tar.xz')
md5sums=('38ea7a8add550e03cb70bf52e11beb64')
noextract=()

package() {
  install -Dm755 ez-daily-2 "$pkgdir/usr/bin/ez-daily"
}
