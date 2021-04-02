# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=ez-daily
pkgver=2.1.2
pkgrel=1
pkgdesc="A Tool to Download People's Daily Easily"
arch=('x86_64')
url="https://github.com/Brx86/yun"
license=('GPL3')
depends=('python' 'python-arrow' 'python-requests-html')
source=('https://aya1.xyz/https://github.com/Brx86/yun/releases/download/2/ez-daily.tar.xz')
md5sums=('2c5aedb976a9bbf4dca2bf3565969951')
noextract=()

package() {
  install -Dm755 ez-daily "$pkgdir/usr/bin/ez-daily"
}
