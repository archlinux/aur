# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=wl-color-picker
pkgver=1.4
pkgrel=1
pkgdesc="A wayland color picker that also works on wlroots"
arch=('any')
url="https://github.com/jgmdev/wl-color-picker"
license=('MIT')
depends=('grim' 'slurp' 'zenity' 'imagemagick' 'wl-clipboard' 'libnotify')
source=(
  "https://github.com/jgmdev/wl-color-picker/archive/v${pkgver}.tar.gz"
)
md5sums=(
  '851aaf902ae4798d969efe5042fbcd9c'
)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make -j1 DESTDIR="${pkgdir}" install
}
