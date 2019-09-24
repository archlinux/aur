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
source=("git+https://github.com/Austcool-Walker/macbuntu-theme.git")
sha512sums=('SKIP')

prepare() {
chmod -v +x ${BUILDDIR}/makepkg
}

package() {
cd macbuntu-theme
${BUILDDIR}/makepkg -sfi

}

finalize() {
cd macbuntu-theme
cp -v -R *.pkg.tar* ${BUILDDIR}/

}