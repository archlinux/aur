pkgname=etlegacy-omnibot
pkgver=0.87.2
pkgrel=1
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="http://omni-bot.invisionzone.com"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha256sums=('6b5897e87c390d8008228f707d349333ef7ee1c423b4c766d0aea5f5d1fc4dfb')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy

    # writable user config
    chmod 666 $pkgdir/usr/lib/etlegacy/legacy/omni-bot/et/user/omni-bot.cfg
}
