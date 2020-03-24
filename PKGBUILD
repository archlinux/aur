# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Prev. Maintainer: orumin <dev at orum.in>

pkgname=slack-term-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Slack client for your terminal"
arch=('x86_64')
url="https://github.com/erroneousboat/slack-term"
source=("https://raw.githubusercontent.com/erroneousboat/slack-term/master/LICENSE"
        "slack-term::${url}/releases/download/v${pkgver}/slack-term-linux-amd64"
        "slack-term.json")
license=('MIT')
provides=('slack-term')
conflicts=('slack-term')
options=()
md5sums=('563e9d16dfa4d970c956ebc0e6e140dd'
         'de55ee75cf41f74af26a6181f5677925'
         '9cdd35c2d48f6d899333ab3721a6464b')

package() {

  install -Dm755 slack-term ${pkgdir}/usr/bin/slack-term
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/slack-term/LICENSE
  install -Dm644 slack-term.json ${pkgdir}/etc/slack-term.json
}

# vim:set ts=2 sw=2 et:
