pkgname=etlegacy-omnibot
pkgver=0.86.3369
pkgrel=1
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="http://omni-bot.invisionzone.com"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha256sums=('0379394d395c2076d7f471dfd5f8d8d08b3d6e3f35a3a7b363130d81cec43167')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy

    # writable user config
    chmod 666 $pkgdir/usr/lib/etlegacy/legacy/omni-bot/et/user/omni-bot.cfg
}
