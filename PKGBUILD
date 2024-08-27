# Maintainer: Hans Müller <schreibemirhalt@gmail.com>
pkgname=pdfgrep_sixel
pkgdesc="pdfgrepSIXEL quickly searches text in PDF document files and displays pages containing results as images in terminals supporting SIXEL graphics. (Uses magick, pdfgrep & pdftocairo from poppler) 🔎📄→🖼🖥👀"
pkgver=0.3.0
pkgrel=1
arch=('any')
url=https://github.com/schrmh/pdfgrepSIXEL
license=('unknown')
depends=('pdfgrep' 'imagemagick' 'poppler')
source=(pdfgrepSIXEL)
md5sums=(3dc5e8a9f86b51072ac5d8c44faeea74)

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/pdfgrepSIXEL"
}
