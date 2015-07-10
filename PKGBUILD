# Maintainer: Giancarlo Razzolinit <grazzolini@gmail.com>

pkgname=keepass-plugin-keeagent-beta
pkgver=0.7.2
pkgrel=1
pkgdesc="SSH Agent Plugin for KeePass - Beta Version"
license=('BSD')
depends=('keepass')
provides=('keepass-plugin-keeagent-beta')
conflicts=('keepass-plugin-keeagent')
arch=('any')
url="http://lechnology.com/software/keeagent/"
DLAGENTS='http::/usr/bin/curl -fLC - --user-agent Firefox --retry 3 --retry-delay 3 -o %o %u'
install=$pkgname.install
source=('http://lechnology.com/wp-content/uploads/2015/07/KeeAgent_Beta_v0.7.2.zip' "$pkgname.install")
sha512sums=('cac363471908f5acfd5ae5a28b3beed5d710af87273bbb2cb747a579562acfd6c37d430a3d1b00bc349cad75147b5579dc775afece292a04e6694e2ed2be1208'
            'af3e0d450c82053f6564dee90f0c3a4f7f06fec1bc4061a6eb4811cc0f5ce764635529aea8501e71f8ca7b3f08d01d9c791975a22bc737def3517232d1efd92a')

package() {
    mkdir -p "${pkgdir}"/usr/share/keepass/plugins
    install -m644 KeeAgent.plgx "${pkgdir}"/usr/share/keepass/plugins/
}
