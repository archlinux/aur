# Maintainer: Muhammad Sayuti <muhammad.sayuti94@gmail.com>

pkgname=luminos-greeter
_pkgname=luminos
pkgver=1.0.1
pkgrel=1
pkgdesc="Customizable LightDM Webkit Greeter"
arch=('any')
url="https://github.com/linuxaddict89/luminos-greeter"
license=('GPLv2')
depends=('lightdm' 'webkit2gtk' 'glib2' 'libsoup' 'json-glib' 'libgee')
makedepends=('meson' 'vala')
source=('git://github.com/linuxaddict89/luminos-greeter.git')
provides=('luminos-greeter')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  meson setup build --buildtype=release --prefix=/usr
  ninja -C build
  ninja install -C build
}
