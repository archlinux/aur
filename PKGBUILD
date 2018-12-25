pkgname=wee-slack
pkgver=2.2.0
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python2-websocket-client')
source=("https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=(
  'b0794c640ffdbb921a726253e3d43a77e6ad37ce75e801188d7a08a95c8d5b6d5bf2bdb0654a1e016c50c03c20d462dbc1de077be47984fbd88e1ca0829b11cf'
)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 wee_slack.py ${pkgdir}/usr/lib/weechat/python/wee_slack.py
}

# vim:set ts=2 sw=2 et:
