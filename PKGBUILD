# Maintainer: Alexandru Bocioacă (robocioaca) <arch-aur.20.telemea@spamgourmet.com>

pkgname=otf-sweden-sans
pkgver=1
pkgrel=5
pkgdesc="Sweden Sans typeface is the key element in the Sweden Brand Identity. It works to maintain consistency, create clarity, and handle the Sweden brand legacy."
arch=('any')
url="https://sharingsweden.se/the-sweden-brand/brand-visual-identity/typography"
license=('custom')
depends=(fontconfig xorg-mkfontscale)
install=otf-sweden-sans.install
source=(https://sharingsweden.se/app/uploads/2024/10/SwedenSans_typekit_family.zip)
sha256sums=('548b15a193c6609b122d5bd1c31edb10ed5f1d60d764eee0a4fc8b4647568326')

package() {
  cd "${srcdir}/SwedenSans_OTF"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}

