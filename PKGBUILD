# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Carl George < arch at cgtx dot us >

_name=gnome-shell-impatience
_uuid=impatience@gfxmonk.net

pkgname=gnome-shell-extension-impatience
pkgver=0.5.1
_tag="version-$pkgver"
pkgrel=1
pkgdesc='Speed up the gnome-shell animation speed'
arch=('any')
url="https://github.com/timbertson/$_name"
license=('GPL3')
depends=('gnome-shell>=1:45' 'gnome-shell<1:47')
source=($_name-$pkgver.tar.gz::$url/archive/$_tag.tar.gz)
sha256sums=('9b29b58ff87ed5931e7f8ffb65ece9c12e422482fe52d5b78eff6f023f621cf0')

package() {
    cd $_name-$_tag
    install -dm755 "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
    cp -r impatience/* "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
}
