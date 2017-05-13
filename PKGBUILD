# Maintainer: Carl George < arch at cgtx dot us >

_name='gnome-shell-impatience'
_owner='timbertson'
_uuid='impatience@gfxmonk.net'

pkgname='gnome-shell-extension-impatience'
pkgver=0.4.5
_tag="version-$pkgver"
pkgrel=1
pkgdesc='Speed up the gnome-shell animation speed'
arch=('any')
url="https://github.com/$_owner/$_name"
license=('GPL3')
source=("$url/archive/$_tag.tar.gz")
sha256sums=('2e8b649e64b33a20fa2f46af85e78dd697b3a63b4ed4e019626e556dfdf8af89')

package() {
    depends=('gnome-shell')
    cd $_name-$_tag
    install --directory --mode 0755 "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    cp -r impatience/* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
