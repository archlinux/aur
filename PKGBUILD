# Maintainer: Toria <ninetailedtori@uwu.gal>
# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=clang-bin-cc-cxx
pkgver=0.2
pkgrel=1
pkgdesc="Relink /bin/cc to clang, and /bin/cxx to clang++."
arch=('any')
license=('GPL')
depends=('clang')
provides=('cc' 'cxx')
conflicts=('clangbincc')
install="${pkgname}.install"
source=("${pkgname}.hook")
b2sums=('191b062389ce98dcab8d943cb77363d811af8e5c616d4de41765619fe21ca9d4523db396c75454d29a24ec930a272e624844f8f35a39de370ad06b2d2be2dc70')
sha512sums=('611d05773013df738901c0519c68234cfdfec68c57f90f9ca269f4f9d2ec98569fe37199aa7d6336d5f9a71c7fc7ca782781c043718be36a97e1450f3013b073')
sha384sums=('6d6d0298900e550355399a071e3830d974ac12d67c9195052ae43f8156146e26b0f7acd17eea72822963bccae1fa2ebc')
sha256sums=('793e306f7cdc0cd8a63073c10b75b49156d5996ea9b66cdf2f185147076ebf1a')

package() {
	cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
