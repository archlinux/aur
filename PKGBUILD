# Maintainer: Fijxu <fijxu[at]zzls[dot]xyz>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-dictionaries-es
pkgver=2.6
pkgrel=1
pkgdesc='Spanish dictionaries extension for LibreOffice'
arch=('any')
url='https://extensions.libreoffice.org/extensions/spanish-dictionaries'
license=('GPL3')
groups=('libreoffice-extensions')
conflicts=('languagetool')
source=(https://extensions.libreoffice.org/assets/downloads/98/1659525229/es.oxt)
noextract=('')
sha256sums=('10fa51dffb78f0fc15fd791770813f551da43cf007b52cb8fb6ccb0b4117e85f')


package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
  bsdtar -xf $srcdir/es.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/spanish-dictionaries
}
