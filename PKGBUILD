pkgname=etlegacy-omnibot
pkgver=0.85.3188
pkgrel=1
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="http://omni-bot.invisionzone.com"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha256sums=('887b4aced7ca0404e09ef7bcfb350a33d41b53646e4130857de213692390f0ae')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy

    # writable user config
    chmod 666 $pkgdir/usr/lib/etlegacy/legacy/omni-bot/et/user/omni-bot.cfg
}
