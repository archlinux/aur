# Maintainer: luxemboye <luxemboye protonmail com>

pkgname=stardict-web1913
pkgver=2.4.2
pkgrel=1
pkgdesc="Webster's Revised Unabridged Dictionary (1913) for StarDict"
arch=('any')
url="http://download.huzheng.org/dict.org/"
license=('GPL')
optdepends=('stardict: view the dictionary in a GUI'
            'sdcv: view the dictionary in a terminal')
source=(http://download.huzheng.org/dict.org/stardict-dictd-web1913-$pkgver.tar.bz2)
sha256sums=('68f79667136b4bb6f101409d4dc7e95ac430073f36d2f822d9b265b0b841d946')

package() {
	mkdir -p "$pkgdir/usr/share/stardict/dic/web1913"
  cd $srcdir/stardict-dictd-web1913-$pkgver
	install -m 644 *.dict.dz *.idx *.ifo "$pkgdir/usr/share/stardict/dic/web1913/"
}
