# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Fanninger Thomas <thomas at fanninger dot at>

pkgname=prosody-mod-mam-archive
pkgver=2024.10.22
pkgrel=1
_commit="fe081789f7b5"
pkgdesc="XEP-0136: Message Archiving for Prosody"
arch=('any')
url="https://modules.prosody.im/mod_mam_archive.html"
license=('MIT')
depends=('prosody')
makedepends=('mercurial')
source=("hg+https://hg.prosody.im/prosody-modules/"#revision=$_commit)
sha1sums=('6022ab2c88326a5c8d1828d873a11a89bf769b27')


package() {
  cd "${srcdir}/prosody-modules/mod_mam_archive"
  find . -type f -name '*.lua' -exec install -Dm 644 '{}' "${pkgdir}/usr/lib/prosody/modules/{}" \;
}
