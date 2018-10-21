# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2001
pkgver=0.919
pkgrel=1
pkgdesc="Plane 1 Unicode-based font (TTF)"
arch=('any')
url="https://web.archive.org/web/20101122141939/http://code2000.net/"
license=('custom')
depends=(
    'fontconfig'
    'xorg-fonts-encodings'
    'xorg-mkfontscale'
    'xorg-mkfontdir'
)
source=('https://web.archive.org/web/20101122142330/http://code2000.net/CODE2001.ZIP')
md5sums=('d14291cea24f4f89df5d226f4e2b1307')
sha256sums=('6e8173132072d099db5bdc3f8035a2519f6d92d65beab75efd0c3b697c8fe048')
sha512sums=('16b901ef3553dd40df8fd9b353ba15a09798046e55faeb6350acc8bb5a657a0063cc4eefa19fcedbc01b523430a6a18ad190c8843017897e7f2c2ff68841c352')

package() {
  install -D -m644 CODE2001.TTF "$pkgdir/usr/share/fonts/TTF/Code2001.ttf"
}
