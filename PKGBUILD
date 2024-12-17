# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christopher Snowhill <kode54@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=eos_portable_archive
pkgver=5.1
pkgrel=6
pkgdesc="A portable binary archive to be used with boost::serialization"
arch=('any')
url="https://epa.codeplex.com/"
license=('BSL-1.0')
depends=('boost')
source=("https://github.com/daldegam/eos-portable-archive/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c0aec98afc77affb3654c691ccf1128c938ebb46813cf753627f0e13c21fd734')

package() {
  cd "$srcdir/eos-portable-archive-${pkgver}/eos"
  for file in *.hpp;
  do
	install -Dm644 $file "$pkgdir/usr/include/eos/$file"
  done
}
