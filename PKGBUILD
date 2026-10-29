# Maintainer: loki5512344 <mauhhhh7@gmail.com>

pkgname=wherry-bin
pkgver=0.1.0
pkgrel=3
pkgdesc="A modern dual-pane file manager with SFTP/FTP/FTPS support (pre-compiled)"
arch=('x86_64')
url='https://git.wihuk.pro/boba/Wherry'
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
source=("https://git.wihuk.pro/boba/Wherry/releases/download/v$pkgver/wherry-v$pkgver-x86_64-linux.tar.gz"
        "https://git.wihuk.pro/boba/Wherry/releases/download/v$pkgver/wherry-v$pkgver-x86_64-linux.tar.gz.asc")
sha256sums=('686fb6d52e090404b0be44b566f2f914cf91bede437cf4141c1e59496d925ee9'
            'SKIP')
validpgpkeys=('CB67D9090663FFB2E21E0CB0253067914055423B')  # loki5512344

package() {
  cp -r "$srcdir/usr" "$pkgdir/"
}
