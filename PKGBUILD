# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=gnome-shell-extension-status-area-horizontal-spacing
pkgver=2.2
pkgrel=0
pkgdesc="This is a GNOME shell extension that reduces the horizontal spacing between status area icons (top-right of the panel: volume indicator, etc)."
arch=('any')
url="https://bitbucket.org/mathematicalcoffee/status-area-horizontal-spacing-gnome-shell-extension"
license=('unknow')
depends=('gnome-shell')
source=('https://bitbucket.org/mathematicalcoffee/status-area-horizontal-spacing-gnome-shell-extension/get/default.tar.gz')
sha256sums=('7634799b6869fc0aa019ba82a452b269b955e9978fac95a20ca941d540b3446a')

package() {
  _uuid='status-area-horizontal-spacing@mathematical.coffee.gmail.com'

  cd mathematicalcoffee-status-area-horizontal-spacing-gnome-shell-extension-*
  make
  install -d "${pkgdir}/usr/share/gnome-shell/extensions"

  cp -af "${_uuid}" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
