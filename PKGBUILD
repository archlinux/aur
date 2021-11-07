# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2000
pkgver=1.173
pkgrel=2
pkgdesc="Unicode TT font with extensive glyph coverage"
arch=('any')
url="https://www.code2001.com/"
license=('custom')
source=('https://code2001.com/CODE2000.ZIP')
md5sums=('5281ed33db4e79eaec09e27d65714d3d')
sha256sums=('a3a28c96ff5fb31d86f2d6e61e2d58f082acc53e27012cd4a92a87d0c72d3d50')
sha512sums=('d38efd87906ed3ad7fd0ab2eb92da1fcafa42321e1306f79b7b7cb9df1ab76fa3f47490a3d61dcb0af2ed5de9443e9caf7a617aea526552e546d3f0ee4459a0d')

package() {
  install -D -m644 CODE2000.TTF "$pkgdir/usr/share/fonts/TTF/Code2000.ttf"
  install -D -m644 CODE2000.HTM "$pkgdir/usr/share/licenses/ttf-code2000/Code2000.html"
}
