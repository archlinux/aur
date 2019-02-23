pkgname=otf-firamath
pkgver=0.4_beta_3
pkgrel=1
pkgdesc="Fira Math is a sans-serif font with Unicode math support"
arch=(any)
license=(custom:ofl)
depends=(fontconfig)
source=("https://github.com/firamath/firamath/releases/download/v0.4-beta-3/firamath-otf.zip")
url="https://github.com/firamath"
md5sums=(5ef995d974a76ce31b97fdf38827aff3)

package() {
  cd "$srcdir"
  install -Dm644 *.otf -t "${pkgdir}"/usr/share/fonts/OTF/
}
