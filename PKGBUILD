# Editor:  Austcool-Walker <0ajwalker@gmail.com>
# Maintainer: Austcool-Walker <0ajwalker@gmail.com>
pkgname=macbuntu-theme
pkgver=1.4.2
pkgrel=1
pkgdesc="default macbuntu theme introduced as the default themes in macbuntu 16.04 lts."
license=("Images belong to there respected Owners I do not take credit for any images I downloaded.")
arch=(any)
#depends=
optdepends=("gnome-shell>=3.30: theme was specifically tuned for GNOME 3.30")
source=("git+https://try.gogs.io/Austcool-Walker/macbuntu-theme.git")
sha512sums=('SKIP')

prepare() {
#mv -v  ${BUILDDIR}/PKGBUILD ${BUILDDIR}/PKGBUILD2
cd macbuntu-theme
#cp -v PKGBUILD ${BUILDDIR}/PKGBUILD
}

build() {
cd macbuntu-theme
makepkg -sfi

}

package() {
echo "no package to make"
}

finalize() {
cd ${srcdir}/macbuntu-theme
cp -v -R *.tar* ${BUILDDIR}/

}