# Maintainer: levinit <levinit@outlook.com>
pkgname=adhosts
pkgver=0.3
pkgrel=2
pkgdesc="google hosts and blocking ads hosts.用于科学上网和屏蔽广告的hosts."
arch=(any)
url="https://github.com/levinit/$pkgname"
license=('GPL')
depends=('curl')

source=("https://github.com/levinit/adhosts/archive/master.zip")
md5sums=('SKIP')

package() {
        cd $srcdir/$pkgname/
        install -Dm755 $pkgname "$pkgdir/usr/bin/adhosts"
}
