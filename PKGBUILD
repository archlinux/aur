# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >

_pkgbase='plasma-browser-integration-extension'
pkgname="${_pkgbase}-meta"
pkgver=1
pkgrel=1
pkgdesc='Meta-PKG to install web browser extension(s) for KDE Plasma desktop integration'
arch=(any)
license=(None)
url='https://community.kde.org/Plasma/Browser_Integration'

package() {
  provides=("${_pkgbase}")
  depends=('plasma-browser-integration')
  optdepends=(
    'chromium-extension-plasma-integration: Google Chrome / Chromium / Vivaldi extension'
    'firedragon-extension-plasma-integration: Firedragon addon'
    'firefox-extension-plasma-integration-bin: Firefox addon'
    'librewolf-extension-plasma-integration: Librewolf addon'
  )
}
