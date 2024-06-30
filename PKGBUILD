pkgname=etlegacy-omnibot
pkgver=0.91
pkgrel=1
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (omni-bot files)"
arch=('i686' 'x86_64')
url="https://app.assembla.com/spaces/omnibot/"
license=('custom')
depends=('etlegacy-mod')
source=('http://mirror.etlegacy.com/omnibot/omnibot-linux-latest.tar.gz')
sha256sums=('d51b457c0296e3e69f6f4e72617ff2ae06e06b446bf7be16feb8d2d8f5bad6ce')

package() {
    # omni-bot
    mkdir -p $pkgdir/usr/lib/etlegacy/legacy
    mv omni-bot $pkgdir/usr/lib/etlegacy/legacy
}
