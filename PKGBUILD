pkgname=etlegacy-omnibot
pkgver=0.91
pkgrel=2
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="https://app.assembla.com/spaces/omnibot/"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha256sums=('84403ac7efe60edd9edbd48d2767e8571b5414f32ff1321d970f3e087baed495')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy
}
