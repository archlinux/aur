pkgname=m32-edit
pkgver=3.2
pkgrel=1
epoch=
pkgdesc="M32 Edit for Midas M32 mixer"
arch=('x86_64')
url="https://www.musictribe.com/Categories/Midas/Mixers/Digital/M32/p/P0B3I/downloads"
license=('custom:proprietary')
source=('https://downloads.music-group.com/software/behringer/M32/M32-Edit_LINUX_64bit_3.2.tar.gz'
        'm32-edit.desktop'
        'm32-edit.png')
md5sums=('cdbfdb6cfc1c14ad2e4be6fd4b7f639f'
         '2322e5fbc050bfb19dfe719093c63b69'
         '027a21ff0e8bda95fe62e97488b1c6e4')

package() {
  cd "${srcdir}"
  install -D -m755 "${srcdir}/M32-Edit"         "${pkgdir}/usr/bin/m32-edit"
  install -D -m644 "${srcdir}/m32-edit.desktop" "${pkgdir}/usr/share/applications/m32-edit.desktop"
  install -D -m644 "${srcdir}/m32-edit.png"     "${pkgdir}/usr/share/pixmaps/m32-edit.png"
}
