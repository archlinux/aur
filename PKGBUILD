# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix

pkgname=ambiance-rw
pkgver=3.0
pkgrel=1
pkgdesc="A re-interpretation of the Ambiance theme. "
arch=('any')
url="https://www.gnome-look.org/p/1197991/"
license=('GPL3')
options=(!strip)
source=(
"https://dl.opendesktop.org/api/files/download/id/1510441834/Ambiance-RW-${pkgver}.tar.xz"
"https://dl.opendesktop.org/api/files/download/id/1510441808/Ambiance-RW-${pkgver}-BLUE.tar.xz"
"https://dl.opendesktop.org/api/files/download/id/1510441860/Ambiance-RW-${pkgver}-DS.tar.xz"
"https://dl.opendesktop.org/api/files/download/id/1510441849/Ambiance-RW-${pkgver}-DS-BLUE.tar.xz"
)
sha256sums=('bae3858d7ddee3ecb587a03c837f7042acb600e4c785e70acfdbc7bc3aa7c21f'
            '22b19d8c686e825e03526a78f4e295e6b7b9ebbffe01851f1947bdcb646cabbe'
            '34808140e36d582328c6ca3725c69e5be669a605e1a63f36811b02af7d4e554c'
            '2b195b3113684760d0d9a8242aadfe811e3c20f76a7eba38bcd2fee66d01f204')

package() {
  install -d ${pkgdir}/usr/share/themes
  cp -r ${srcdir}/Ambiance-RW-${pkgver} ${pkgdir}/usr/share/themes/
  cp -r ${srcdir}/Ambiance-RW-${pkgver}{-BLUE,-DS,-DS-BLUE} ${pkgdir}/usr/share/themes/
}
