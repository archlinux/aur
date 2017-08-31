# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=recultis
pkgver=1.1.0
pkgrel=1
pkgdesc="Return to the cult games. On Linux, with modern, open source engines."
arch=('x86_64')
url="https://makson96.github.io/Recultis"
license=('GPL')
install=recultis.install
depends=('python' 'pyqt5-common')
source=(https://codeload.github.com/makson96/Recultis/tar.gz/v${pkgver})
md5sums=('2237f900ab4fc5b89aef398b00e2f312')

package()   {
    mv Recultis-1.1.0 Recultis
    mkdir opt
    mv Recultis opt
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

