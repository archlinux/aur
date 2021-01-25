# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=windows-xp-icon-theme
pkgver=3.1
pkgrel=1
pkgdesc="Windows XP icon theme for linux (currently in development)"
arch=('any')
url="https://github.com/B00merang-Artwork/Windows-XP"
license=('GPLv2')
makedepends=('git' 'python' 'python-pyaml')
source=("Windows-XP-${pkgver}.tar.gz::https://github.com/B00merang-Artwork/Windows-XP/archive/${pkgver}.tar.gz")
sha256sums=('ba6ab8fc60cd89101d8302b7f392f2aac715582da31aa370da5d569ad6e29d66')

package() {
  cd "Windows-XP-${pkgver}"
  install -d 755 "${pkgdir}/usr/share/icons/windows-xp-icon-theme/"
  cp -ra * "${pkgdir}/usr/share/icons/windows-xp-icon-theme/"
}
