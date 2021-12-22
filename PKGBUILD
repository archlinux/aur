# Maintainer: Nathan Robinson <nrobinson2000@me.com>
pkgname=adapta-nokto-cinnamon-cantarell
pkgver=0.1.1
pkgrel=1
arch=('any')
license=('GPL2')
depends=('cantarell-fonts' 'adapta-gtk-theme')

pkgdesc="Pacman hook to change Adapta Nokto Cinnamon font to Cantarell"

source=($pkgname.hook cinnamon.css.patch)
sha256sums=('c582a944c1468593c4d0f6fe408ef91fd3d627cee77b0633f4dffbf8fe093389'
            '1c60428d1e5bb4b3de233412139111bc424f3b18b94f7571190fa6e06b85d937')

package() {
    install -Dm644 cinnamon.css.patch "$pkgdir/usr/share/$pkgname/cinnamon.css.patch"
    install -Dm644 $pkgname.hook "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
}
