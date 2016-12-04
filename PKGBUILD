pkgname=now-font
pkgver=24
pkgrel=1
pkgdesc="Now Font"
arch=(any)
url=https://fontlibrary.org/en/font/now
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("https://fontlibrary.org/assets/downloads/now/92f81dc6f3ba4a48ba3e70f5e826207d/now.zip")
install=$pkgname.install
md5sums=('92f81dc6f3ba4a48ba3e70f5e826207d')

package(){
	cd "$srcdir"
	find ./ -type f -name "Now-*.otf" -exec install -m 644 -D "{}" "$pkgdir/usr/share/fonts/now/{}" \;
}
