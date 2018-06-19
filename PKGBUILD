# Maintainer: Monsieur Tino <waste@mrtino.eu>

pkgname=(pythonqt-for-screencloud)
pkgver=3.0
pkgrel=2
pkgdesc="A dynamic Python binding for Qt applications, like screencloud. Binary version."
arch=('x86_64')
url="http://pythonqt.sourceforge.net/"
license=('GPL2')
conflicts=('pythonqt')

source_x86_64=('https://download.opensuse.org/repositories/home:/olav-st/Debian_9.0/amd64/libpythonqt-qt5_3.0-1_amd64.deb')
sha256sums_x86_64=('1bb86e38fb25d2b239a840620a611410e07447e45e8a88b22c99dfcdeccf3f63')

package() {
        cd "${srcdir}"

        tar -xf data.tar.xz -C "${pkgdir}"
}
