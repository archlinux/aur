# Maintainer: loki5512344 <mauhhhh7@gmail.com>

pkgname=wherry-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern dual-pane file manager with SFTP/FTP/FTPS support (pre-compiled)"
arch=('x86_64')
url='https://github.com/loki5512344/Wherry'
license=('GPL3')
depends=(
  'gcc-libs'
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'librsvg'
  'openssl'
  'libssh2'
  'dbus'
)
source=("https://github.com/loki5512344/Wherry/releases/download/v$pkgver/wherry-v$pkgver-x86_64-linux.tar.gz")
sha256sums=('d00bedf0ea2890a18d5c506880a33f4bd87eeec2228309279a3d06b1657a7b5e')

package() {
  cp -r "$srcdir"/* "$pkgdir"/
}
