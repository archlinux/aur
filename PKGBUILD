# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: julroy67 <julroy67@gmail.com>

pkgname=ttf-noto-fonts-emoji-ib
_pkgver=2017-03-10
_commit=733a622
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc="Google Noto emoji fonts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(Apache)
depends=(fontconfig)
conflicts=(noto-fonts-emoji)
provides=(noto-fonts-emoji)
#source=("https://github.com/googlei18n/noto-emoji/archive/v$_pkgver-license-apache.tar.gz")
source=("https://github.com/googlei18n/noto-emoji/archive/$_commit.zip")
sha256sums=('afc002bd0866eb16bd97ea68be4fdd861a56260930a2340449958cb58883b433')

package() {
  cd noto-emoji-*
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 fonts/*.ttf "$pkgdir"/usr/share/fonts/noto
}

