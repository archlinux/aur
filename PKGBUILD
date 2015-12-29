# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='chromium-reduced-security'
pkgver=1.0.0
pkgrel=1
pkgdesc="launch Chrome with reduced Logjam security to access sites with 'weak ephemeral Diffie-Hellman public key' Cisco RV042"
arch=('any')
url='http://superuser.com/questions/966855/force-chrome-to-ignore-a-weak-ephemeral-diffie-hellman-public-key'
depends=('chromium')
install="${pkgname}.install"
source=('chromium-reduced-security.desktop')
sha256sums=('344506f92cc7c4e28e64795765828de2ef1c38b6325a384d1c2d9e6757803fce')

package() {
  set -u
  install -Dm644 'chromium-reduced-security.desktop' -t "${pkgdir}/usr/share/applications"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
