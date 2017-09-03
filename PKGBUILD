# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=recultis
pkgver=1.1.0
pkgrel=3
pkgdesc="Return to the cult games. On Linux, with modern, open source engines. Requires the multilib repository to be enabled."
arch=('x86_64')
url="https://makson96.github.io/Recultis"
license=('GPL3')
install=recultis.install
depends=('python' 'pyqt5-common' 'xorg-server' 'binutils' 'mesa' 'openal')
    optdepends=('dpkg: alternative to ar.')
    makedepends=('lib32-glibc' 'lib32-libstdc++5')
source=(https://codeload.github.com/makson96/Recultis/tar.gz/v${pkgver})
md5sums=('2237f900ab4fc5b89aef398b00e2f312')

package()   {
    mv Recultis-1.1.0 Recultis
    mkdir opt
    mv Recultis opt
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

