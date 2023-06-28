# Maintainer: Ivan Volkov <angrycore at yandex dot ru>

pkgname=contentreader-pdf
pkgver=15.1.0.1778
pkgrel=1
license=('custom')
pkgdesc="Content AI ContentReader is the best PDF manipulation software for Linux so far."
arch=('i686')
url="https://contentai.ru/pdf-editor-office"
source=("https://cdn.contentai.ru/CRLinux/ContentReaderPDF15.rpm")
md5sums=('972c1e12145db7d0d3e88254869ca27a')
options=(!strip)
depends=()

package() {
   cd "${srcdir}/"
   for _x in etc opt usr
   do
      cp -r --preserve=mode "$_x/" "${pkgdir}"
   done
}
