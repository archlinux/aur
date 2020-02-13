# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# contributor: Matt Monaco <cx monaco matt>
# contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail com>

pkgname=vim-webapi
pkgver=0.3
pkgrel=1
pkgdesc="Vim Interface to Web API"
arch=(any)
url=https://github.com/mattn/webapi-vim
license=(UNKNOWN)
depends=(vim curl)
groups=(vim-plugins)
source=($url/archive/$pkgver.tar.gz)
sha256sums=('7e97e8ddb1497dae0226569cdf713418cfa0995913c8869339f50fe6bfb6f9f4')

package() {
	cd webapi-vim-$pkgver
	for f in autoload/webapi/* doc/* example/*; do
		install -D "$f" "$pkgdir"/usr/share/vim/vimfiles/"$f"
	done
}
