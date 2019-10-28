# By tejonaco <tejonaco@gmail.com>
_pkgname=plymouth-theme-arch-agua
pkgname="${_pkgname}"
pkgver=1
pkgrel=2
pkgdesc='Plymouth theme for Arch Linux inspired by Deepin.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/tejonaco/${_pkgname}/"
license=('GNU')
install="${pkgname}.install"
depends=('plymouth')
makedepends=('git')
source=("https://github.com/tejonaco/$_pkgname/archive/master.zip")
sha256sums=('SKIP')


package() {
  cd "${_pkgname}-master"

  _themedir="$pkgdir/usr/share/plymouth/themes/arch-agua"

  for N in *.png arch-agua.plymouth arch-agua.script; do
    install -Dm644 $N "${_themedir}/$N"
  done

}
