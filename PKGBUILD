# Contributor: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Kuklin István <kuklinistvan@zoho.com>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=anki-official-binary-bundle
pkgver=2.1.66
pkgrel=10
pkgdesc="[Meta-PKG] Please migrate to anki-bin (or other anki pkg); delete this meta-pkg"
arch=('any')
url="https://aur.archlinux.org/packages/anki-bin"
license=('AGPL3')

package_anki-official-binary-bundle() {
  provides=('anki')
  optdepends=(
    'anki-bin: prebuilt binary'
    'anki>2.1.66: source build (Qt6)'
    'anki-qt5: source build (Qt5)'
    'anki-git: source build from main development branch'
  )
  install="${pkgname}.install"
}
