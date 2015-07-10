# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent
pkgver=0.6.3
pkgrel=2
pkgdesc="SSH Agent Plugin for KeePass"
license=('BSD')
depends=('keepass')
provides=('keepass-plugin-keeagent')
conflicts=('keepass-plugin-keeagent-beta')
arch=('any')
url="http://lechnology.com/software/keeagent/"
DLAGENTS='http::/usr/bin/curl -fLC - --user-agent Firefox --retry 3 --retry-delay 3 -o %o %u'
install=$pkgname.install
source=('http://lechnology.com/wp-content/uploads/2015/04/KeeAgent_v0.6.3.zip' "$pkgname.install")
sha512sums=('22fa181f6b09276a3b85cd8b5cdbc01d5ed014303357c6c26521e6ee6c239bfeafbeeca5f1ee068cca3771c2ae54e201c61ddb3e89c2fbf29185fb34e642fadc'
            'b7d249f9b60cc7d7c7a57dddbe5544d769b6fa6987636fc2816e7a1d1bcea0f38a6a8e9a2d26fca49227a7a51ecb25f7c501dceb7bb45ec367f7f739012301b6')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeeAgent.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
