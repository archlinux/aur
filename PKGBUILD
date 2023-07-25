# Maintainer: Kyuzial <kyuzial@protonmail.com>

pkgname=ttf-twilio
pkgver=1
pkgrel=1
pkgdesc="Twilio fonts"
license=('OFL')
arch=(any)
url="https://github.com/twilio/twilio-sans-mono"
source=("https://github.com/twilio/twilio-sans-mono/raw/main/Twilio-Sans-Mono.zip"
        "https://raw.githubusercontent.com/twilio/twilio-sans-mono/main/LICENSE.txt")
sha256sums=("27e1d437880d408556246b7d69a6f920f58ed4ee23a2266a37d02537435cb557"
            'SKIP')

package() {
  install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 Twilio-Sans-Mono/TTF/TwilioSansMono-*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}