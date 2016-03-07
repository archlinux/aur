# Maintainer: John Gowers <wjg27 at bath dot ac dot uk>
pkgname="cmll"
pkgver=0.9e
pkgrel=1
pkgdesc="A TeX package to write Linear Logic symbols"
arch=(any)
url="https://www.ctan.org/tex-archive/fonts/cmll"
license=('GPL')
install=cmll-latex.install
depends=(texlive-core)
source=("http://mirrors.ctan.org/fonts/cmll.zip")
sha256sums=('32d20341c3f3e9c70a09e93b6deb660472dbfb5ca099e14a0c3bf97e4424c474')

package() {
  unzip cmll.zip
  cd cmll
  ./install.sh "${pkgdir}/usr/share/texmf-dist"
}
