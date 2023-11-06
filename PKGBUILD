# Contributor: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Kuklin István <kuklinistvan@zoho.com>
# Contributor: Aria Moradi <aria.moradi007 at gmail dot com>

pkgname=anki-official-binary-bundle
pkgver=any
pkgrel=16
epoch=1
pkgdesc="[Meta-PKG] Migrate to anki-bin (or other 'anki' pkg); delete this meta-pkg"
arch=('any')
url="https://aur.archlinux.org/packages/anki-bin"
license=('AGPL3')

package() {
  provides=('anki')
  optdepends=(
    'anki-bin: maintained prebuilt binary package (install manually)'
  )
  install="${pkgname}.install"
}
