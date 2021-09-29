# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fanninger Thomas <thomas at fanninger dot at>

pkgname=prosody-mod-default-bookmarks
pkgver=2018.08.18
pkgrel=1
_commit="420ebea00cf3"
pkgdesc="allows to add default bookmarks for users"
arch=('any')
url="https://modules.prosody.im/mod_default_bookmarks.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_default_bookmarks"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
