pkgname=etlegacy-omnibot
pkgver=0.91
pkgrel=3
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="https://app.assembla.com/spaces/omnibot/"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha256sums=('f79b8892152bd5db3903a323b0f7306a2bd2ab7f4927749a5a1926396235f3e9')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy
}
