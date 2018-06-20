pkgname=wee-slack
pkgver=2.0.0
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python2-websocket-client')
source=("https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('f5c1046bb16a4cd42b5288fdb08ccdf1ce6c26f17ba3eff182ce3c21e553d11f6c27cbca9684c14fca87fcdcaeb5edb81b19d67810cc263670bd6988f505189c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 wee_slack.py ${pkgdir}/usr/lib/weechat/python/wee_slack.py
}

# vim:set ts=2 sw=2 et:
