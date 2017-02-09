# Maintainer: Evert Prants <imsonotsleepy@gmail.com>
pkgname=runeloader
pkgver=2.39
pkgrel=2
pkgdesc="The Ultimate RuneScape Toolkit"
arch=('any')
url="https://www.runeloader.com/forum/portal.php"
license=()
depends=('java-runtime')
optdepends=()
options=()
install='runeloader.install'
source=(https://www.runeloader.com/download/jar/RuneLoader.jar runeloader runeloader.desktop runeloader.install)
noextract=("RuneLoader.jar")
md5sums=('8f78e7c3196e8c5d61792ce8d5309a75'
         'e485e9967756e6e9995e3098650fc6da'
         '7cd86c8dc2f308993a7a764b9caa2142'
         '051a5cb51a200ba69bb246b9e647636a')

package() {
        cd "$srcdir"
        install -D -m755 "${srcdir}/runeloader"            "${pkgdir}/usr/bin/runeloader"
        install -D -m644 "${srcdir}/RuneLoader.jar"        "${pkgdir}/usr/share/runeloader/RuneLoader.jar"
        install -D -m644 "${srcdir}/runeloader.desktop"    "${pkgdir}/usr/share/applications/runeloader.desktop"
}

