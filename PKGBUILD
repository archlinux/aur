# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Carl George < arch at cgtx dot us >

_name=gnome-shell-impatience
_owner=timbertson
_uuid=impatience@gfxmonk.net

pkgname=gnome-shell-extension-impatience
pkgver=0.5.0
_tag="version-$pkgver"
pkgrel=1
pkgdesc='Speed up the gnome-shell animation speed'
arch=('any')
url="https://github.com/$_owner/$_name"
license=('GPL3')
depends=('gnome-shell>=1:45' 'gnome-shell<1:46')
source=($_name-$pkgver.tar.gz::$url/archive/$_tag.tar.gz)
sha256sums=('68eddf2564b1897d74604814b9abc1fb5d46638b3d0ad524352fd6bce38c02cd')

package() {
    cd $_name-$_tag
    install -dm755 "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
    cp -r impatience/* "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
}
