# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=ttf-fixedsys-excelsior-linux
pkgver=3.0.1
pkgrel=2
pkgdesc="fixedsys font for linux, use only at 12pt"
arch=('any')
url="https://bugs.launchpad.net/ubuntu/+bug/200671"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
license=('custom')
install="ttf-fixedsys-excelsior-linux.install"
source=(http://launchpadlibrarian.net/26228254/FSEX301-L2.ttf)
sha256sums=(e07f8a9edd4b633dba6cc08f12a8d9cbf4d10b177fea64cdb5741c60dd27dfc7)

package() {
  install -m 0755 -d "${pkgdir}/usr/share/fonts/TTF"
  install -m 0644 FSEX301-L2.ttf "${pkgdir}/usr/share/fonts/TTF"
}

