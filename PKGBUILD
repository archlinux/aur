
# Maintainer: MRtecno98 <mr.tecno98@gmail.com>
pkgname=w3m-imgcat
pkgver=0.1
pkgrel=2
pkgdesc="A simple script to print images to stdout"
arch=(any)
license=('MIT')
depends=('w3m')
conflicts=('imgcat-bin' 'imgcat-git')
source=( 'imgcat' 'LICENSE' )

package() {
	install -Dm 755 "$srcdir/imgcat" "$pkgdir/usr/bin/imgcat"
	install -D "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('99258484cb9ccb0bf6a951891a4e8eb0'
         '2786fa3697f2142cf1adf11552dec8eb')
