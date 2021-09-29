# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fanninger Thomas <thomas at fanninger dot at>

pkgname=prosody-mod-e2e_policy
pkgver=2018.11.30
pkgrel=1
_commit="a76c420eca61"
pkgdesc="encourage usage of End-to-end encryption for chat and MUC messages"
arch=('any')
url="https://modules.prosody.im/mod_e2e_policy.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('SKIP')


package() {
  cd "${srcdir}/prosody-modules/mod_e2e_policy"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}