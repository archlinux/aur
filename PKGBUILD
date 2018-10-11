pkgname=wee-slack
pkgver=2.1.1
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python2-websocket-client')
source=("https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('953c599c6ba612bb956587c1e206147cbcf7693f0cdbe0a65e0661ae64d432762b3010950d4bd7a8fef5e5cc05dd8c79850ae3eb16926b60b118bdfab4a99e56')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 wee_slack.py ${pkgdir}/usr/lib/weechat/python/wee_slack.py
}

# vim:set ts=2 sw=2 et:
