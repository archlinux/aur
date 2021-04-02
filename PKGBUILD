# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=ez-daily
pkgver=2.0.1
pkgrel=2
pkgdesc="A Tool to Download People's Daily Easily"
arch=('x86_64')
url="https://github.com/Brx86/yun"
license=('GPL3')
depends=('python' 'python-arrow' 'python-requests-html')
source=('https://aya1.xyz/https://github.com/Brx86/yun/releases/download/2/ez-daily.tar.xz')
md5sums=('db42a21d26cd5bed0d053fc7a33c19a4')
noextract=()

package() {
  install -Dm755 ez-daily "$pkgdir/usr/bin/ez-daily"
}
