#_gitauthor="tuxnix"
#_gitbranch="master"
# Maintainer: tuxnix <tuxnix@gmx.com>

pkgver="0.8"
pkgrel="0"
_name="notebook"
pkgname="$_name"
pkgdesc='Markdown Desktop Wiki'
url='https://codeberg.org/tuxnix/notebook'
arch=('any')
license=('GLPv2-only')
depends=('pandoc')
makedepends=('git')
source=('git+https://codeberg.org/tuxnix/notebook')
sha512sums=('SKIP')


package() {
    cd "$srcdir/$_name"
    install -Dm605 $_name "$pkgdir/usr/local/bin/$_name"
    install -Dm605 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
