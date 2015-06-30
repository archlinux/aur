# Maintainer: Konstantin Shalygin (k0ste@opentech.ru)

pkgname='thunderbird-usebccinstead'
pkgver='3.4'
pkgrel='0'
pkgdesc='Before the sending occurs it looks for recipients addressed using either TO or CC. When found, it will take action based upon the user-specified options that have been set'
arch=('any')
url='https://addons.mozilla.org/en-US/thunderbird/addon/use-bcc-instead'
license=('MPL')
depends=('thunderbird')
source=("usebccinstead.xpi::https://addons.mozilla.org/thunderbird/downloads/file/288906/use_bcc_instead-3.4-tb.xpi?src=version-history")
sha256sums=("49bc1530ec9289c9495dca7b60b2d58350ab6de8cfd28f78b8739de5547e9171")

package() {
  pushd "$srcdir"
  install -Dm644 "usebccinstead.xpi" "$pkgdir/usr/lib/thunderbird/extentions/usebccinstead.xpi"
  popd
}
