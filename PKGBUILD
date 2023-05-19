# Maintainer:  Carl Kempe o@gfy.lol
pkgname=hack-nf-git
pkgver=20230517
pkgrel=1
pkgdesc="A typeface designed for source code. Patched with Nerd Fonts iconics."
arch=(any)
url="https://github.com/ryanoasis/nerd-fonts"
_raw_url="$url/raw/master/patched-fonts/Hack"
license=('MIT')
depends=('fontconfig')
source=(
  "HackNerdFont-Bold.ttf::$_raw_url/Bold/HackNerdFont-Bold.ttf"
  "HackNerdFont-BoldItalic.ttf::$_raw_url/BoldItalic/HackNerdFont-BoldItalic.ttf"
  "HackNerdFont-Regular.ttf::$_raw_url/Regular/HackNerdFont-Regular.ttf"
  "HackNerdFont-Italic.ttf::$_raw_url/Italic/HackNerdFont-Italic.ttf"
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  date +%Y%m%d
}

package() {
  install -dm0755 ${pkgdir}/usr/share/fonts/TTF
  install -Dm0644 ${srcdir}/*.ttf ${pkgdir}/usr/share/fonts/TTF
}
