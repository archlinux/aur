# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=mediawiki-uploadwizard
pkgver=1.26
pkgrel=1
pkgdesc="Provides a user-friendly tool for uploading multimedia"
arch=("i686" "x86_64")
url="ihttps://www.mediawiki.org/wiki/Extension:UploadWizard"
license=("GPL2")
depends=("mediawiki")
source=("mediawiki-uploadwizard-${pkgver}.tar.gz::https://extdist.wmflabs.org/dist/extensions/UploadWizard-REL1_26-729d674.tar.gz")
sha512sums=("ae3cd7c273806f0fd3b6f1ff45907d33f07d2e860944f4a36fccff099505a8e620e01fe45e3361c1eb21d87b8c96230beb34dd8e5c7641c039f2e1c4ac27cc32")

package() {
  install -d "$pkgdir/usr/share/webapps/mediawiki/extensions"
  cp -ar "${srcdir}/UploadWizard" "$pkgdir/usr/share/webapps/mediawiki/extensions/"
}
