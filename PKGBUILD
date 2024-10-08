# Maintainer: vik <vik at divd dot net>

pkgname=filebot-cli
pkgver=5.1.5
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://www.filebot.net/"
license=('Commercial')
depends=('java-runtime' 'mediainfo')
makedepends=()
checkdepends=()
provides=('filebot')
options=(!strip)
install=$pkgname.install
conflicts=('filebot47' 'filebot')
source=("https://get.filebot.net/filebot/FileBot_${pkgver}/FileBot_${pkgver}-aur.tar.xz")
sha256sums=('5ce11f2528e8764bcd09a2c093aee698d2b118d11cfcab7fa128a4003172d330')
validpgpkeys=('B0976E51E5C047AD0FD051294E402EBF7C3C6A71')

package() {
    mkdir -p "${pkgdir}/usr/share" "${pkgdir}/usr/bin"
    cp -dpr --no-preserve=ownership "${srcdir}/usr/share/filebot" "${pkgdir}/usr/share"
}