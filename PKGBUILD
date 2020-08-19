# Maintainer: Kamil Pajek <kamil.pajek@gmail.com>
pkgname=otf-tex-gyre-dejavu-math
pkgver=1.106
pkgrel=1
pkgdesc='The TeX Gyre DejaVu Math font is a math companion to the fine and popular DejaVu text fonts'
arch=('any')
url='http://www.gust.org.pl/projects/e-foundry/tex-gyre-dejavu-math'
license=('custom:GFL')
conflicts=('ttf-dejavu')
source=('http://www.gust.org.pl/projects/e-foundry/tex-gyre-dejavu-math/download/texgyredejavu-math-1106.zip')
b2sums=('801ae4545d03d261050e6ab2d642a471c9664fa8e08a3633dee454eb99b43e910a3653a1b9caba9b1a91f1201d0885c6dc0ba9459062ec8d9e695c3dced678a9')

package() {
  install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname#otf-}"
  install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname#otf-}" \
                   "${srcdir}/texgyredejavu-math-1106/opentype/texgyredejavu-math.otf"

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
                   "${srcdir}/texgyredejavu-math-1106/doc/GUST-FONT-LICENSE.txt" \
                   "${srcdir}/texgyredejavu-math-1106/doc/LICENSE-DejaVu.txt"
}
