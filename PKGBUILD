# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=chrome-shutdown-hook
pkgver=1.1
pkgrel=1
pkgdesc="Gently shutdown Chrome on logout from Gnome Shell."
arch=('any')
url="https://www.google.com/chrome/index.html"
license=('GPL')
depends=('procps-ng' 'python2' 'gnome-python')
optdepends=('gnome-tweak-tool: to enable this hook as a Gnome Startup Application')
license=('GPL')
source=("chrome-shutdown-hook.desktop"
        "chrome-shutdown-hook.py")
md5sums=('45087b31730315e1ed785205739d9943'
         'b5025192b032fb0e3dfa92c9684a3c8c')

package() {
  cd "${srcdir}"
  install -Dm755 "chrome-shutdown-hook.py" "${pkgdir}/usr/bin/chrome-shutdown-hook"
  install -Dm644 "chrome-shutdown-hook.desktop" "${pkgdir}/usr/share/applications/chrome-shutdown-hook.desktop"
}

# vim: ts=2 sw=2 et:
