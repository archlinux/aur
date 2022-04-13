# Maintainer: levinit <levinit@outlook.com>
pkgname=adhosts
pkgver=0.5
pkgrel=1
pkgdesc="update blocking ads hosts.更新屏蔽广告的hosts."
arch=(any)
url="https://github.com/levinit/$pkgname"
license=('GPL')
depends=('curl')

source=("https://github.com/levinit/adhosts/archive/refs/heads/main.zip")
md5sums=('22cc147c12809d57e2427652b1c10bbf')

package() {
        cd $srcdir/$pkgname-main/
        install -Dm755 $pkgname "$pkgdir/usr/bin/adhosts"
}
