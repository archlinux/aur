pkgname=etlegacy-omnibot
pkgver=0.84.2001 # etlegacy version is slightly newer than the official 0.84 omnibot release
pkgrel=2
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="http://omni-bot.invisionzone.com"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha512sums=('2498e6b73c9da40356043d70a60677df899a4783aeed7043979a1b178a0238c7bed9801a773d93eb1e35a0d85a4b39ed3ab1cd2bffa7d04eec58da1e3a907c07')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy

    # writable user config
    chmod 666 $pkgdir/usr/lib/etlegacy/legacy/omni-bot/et/user/omni-bot.cfg
}
