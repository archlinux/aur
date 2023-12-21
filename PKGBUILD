# Contributor: Liviu Solcovenco <solcovenco dot liviu at gmail dot com>
# Contributor: Philip Deljanov <philip dot deljanov at gmail dot com>
# Contributor: bohoomil <bohoomil at zoho dot com>

pkgname=freetype2-infinality-remix
pkgver=2.13.1
pkgrel=1
pkgdesc="[Meta-PKG] EOL; please delete. Use freetype2 from [extra] repository"
arch=(any)
license=('GPL')
url='https://gitlab.archlinux.org/archlinux/packaging/packages/freetype2/-/commit/5b4370f7'
install=freetype2.install

package() {
    depends=("freetype2>=${pkgver}")
    conflicts=('freetype2-infinality' 'freetype2-infinality-ultimate')
}
