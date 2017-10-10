# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=recultis
pkgver=1.1.2
pkgrel=1
pkgdesc="Return to the cult games. On Linux, with modern, open source engines. Requires the multilib repository to be enabled."
arch=('x86_64')
url="https://makson96.github.io/Recultis"
license=('GPL3')
install=recultis.install
depends=('python' 'pyqt5-common' 'xorg-server' 'binutils' 'mesa' 'openal')
    optdepends=('dpkg: alternative to ar.')
    makedepends=('lib32-glibc' 'lib32-libstdc++5')
source=(https://codeload.github.com/makson96/Recultis/tar.gz/v${pkgver})
md5sums=('dcd6cabb2e8284bc9efc13163b670dc3')

package()   {
    mv Recultis-${pkgver} Recultis
    mkdir opt
    mv Recultis opt
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

