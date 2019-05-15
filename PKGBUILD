pkgname=wee-slack
pkgver=2.3.0
pkgrel=1
pkgdesc='A WeeChat plugin for Slack.com'
url='https://github.com/wee-slack/wee-slack/'
arch=('any')
license=('MIT')
depends=('weechat' 'python2-websocket-client')
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/wee-slack/wee-slack/archive/v${pkgver}.tar.gz")
sha512sums=('69e9beab24e46e2ab4ce8153a44a34ebd89195c4ad1ac7c5daa7b06711f2d11145e62e957127ff77e096709a0fa6de7772ad5af7d140c04fe7c3dff2102dc04b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 wee_slack.py ${pkgdir}/usr/lib/weechat/python/wee_slack.py
}

# vim:set ts=2 sw=2 et:
