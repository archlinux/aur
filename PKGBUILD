# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
# Contributor: Kevin Van Lierde <kevin.van.lierde@gmail.com>
pkgname=tuxedo-backlight-control
pkgver=0.6
pkgrel=1
arch=('x86_64')
license=('MIT')
url=https://github.com/webketje/tuxedo-backlight-control
source=('git+https://github.com/webketje/tuxedo-backlight-control')
sha256sums=('SKIP')
sha512sums=('SKIP')
pkgdesc='GUI utility built on top of TUXEDO Keyboard. Provides a bash CLI (backlight) and a minimal Python UI.'
depends=('python' 'tk' 'polkit')
package() {
  mkdir -p "${pkgdir}/usr/share/tuxedo-backlight-control/"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/backlight.py" "${pkgdir}/usr/local/bin/backlight"
  install -Dm644 "${srcdir}/tuxedo-backlight-control/src/usr/share/polkit-1/actions/webketje.tuxedo-backlight-control.policy" "${pkgdir}/usr/share/polkit-1/actions/webketje.tuxedo-backlight-control.policy"
  install -Dm644 "${srcdir}/tuxedo-backlight-control/src/usr/share/applications/tuxedo-backlight-control.desktop" "${pkgdir}/usr/share/applications/tuxedo-backlight-control.desktop"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/ui.py" "${pkgdir}/usr/share/tuxedo-backlight-control/ui.py"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/backlight.py" "${pkgdir}/usr/share/tuxedo-backlight-control/backlight.py"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/icon.png" "${pkgdir}/usr/share/tuxedo-backlight-control/icon.png"
  install -D "${srcdir}/tuxedo-backlight-control/src/usr/share/tuxedo-backlight-control/colors.py" "${pkgdir}/usr/share/tuxedo-backlight-control/colors.py"
}
