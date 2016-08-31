# Maintainer: Michael Goehler <somebody dot here at gmx dot de>

pkgname=chrome-shutdown-hook
pkgver=1.3.1
pkgrel=1
pkgdesc="Gently shutdown Chrome/Chromium on logout from Gnome Shell."
arch=('any')
url="https://www.google.com/chrome/index.html"
license=('GPL')
depends=('procps-ng' 'python2' 'gnome-python')
optdepends=('gnome-tweak-tool: to enable this hook as a Gnome Startup Application')
license=('GPL')
source=("chrome-shutdown-hook.desktop"
        "chrome-shutdown-hook.py")
md5sums=('e9e039b29bf1c7a027ef6b3a2946b6a9'
         '58b7aaee6f7ccdef4508f38f72b96bb1')

package() {
  cd "${srcdir}"
  install -Dm755 "chrome-shutdown-hook.py" "${pkgdir}/usr/bin/chrome-shutdown-hook"
  install -Dm644 "chrome-shutdown-hook.desktop" "${pkgdir}/usr/share/applications/chrome-shutdown-hook.desktop"
}

# vim: ts=2 sw=2 et:
