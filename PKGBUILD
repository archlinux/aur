# Maintainer: mox <de ünderscöre mox )ä] zoho döt com>
pkgname=pcf-profont-powerline
pkgver=1
pkgrel=4
pkgdesc='A small bitmap font which is absolutely great for programming. Patched to include the powerline symbols.'
arch=('any')
url='http://tobiasjung.name/profont/'
license=('MIT')
#depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
depends=('xorg-fonts-encodings' 'xorg-mkfontdir' 'xorg-mkfontscale' 'fontconfig')
optdepends=('powerline: Statusline plugin for various programs that uses the additional symbols that are added to the normal powerline font.')
install=$pkgname.install
source=(ProFontPowerline-10.pcf.gz)
noextract=('ProFontPowerline-10.pcf.gz')
sha256sums=('7aca87318ece401921e683c426a314f1f100c32824e80e10c7d6e56cd7e46858')

package() {
  install -Dm664 ProFontPowerline-10.pcf.gz "${pkgdir}"/usr/share/fonts/misc/ProFontPowerline-10.pcf.gz
}
