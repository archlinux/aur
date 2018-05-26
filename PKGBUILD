# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: orumin <dev at orum.in>

pkgname=slack-term
pkgver=0.4.0
pkgrel=1
pkgdesc="Slack client for your terminal"
arch=('x86_64')
url="https://github.com/erroneousboat/slack-term"
source=("https://raw.githubusercontent.com/erroneousboat/slack-term/master/LICENSE"
        "slack-term::${url}/releases/download/v${pkgver}/slack-term-linux-amd64"
        "slack-term.json")
license=('MIT')
options=()
md5sums=('563e9d16dfa4d970c956ebc0e6e140dd'
         '8db633b31bc1b2823da0155ab93e3427'
         '9cdd35c2d48f6d899333ab3721a6464b')

package() {

  install -Dm755 slack-term ${pkgdir}/usr/bin/slack-term
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 slack-term.json ${pkgdir}/etc/slack-term.json
}

# vim:set ts=2 sw=2 et:
