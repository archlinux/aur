pkgname=etlegacy-omnibot
pkgver=0.87.1
pkgrel=1
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="http://omni-bot.invisionzone.com"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha256sums=('e25cfe88d37848b1f53be057530b918c4870167c5c31ab17c7ff3ccef2fa22c4')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy

    # writable user config
    chmod 666 $pkgdir/usr/lib/etlegacy/legacy/omni-bot/et/user/omni-bot.cfg
}
