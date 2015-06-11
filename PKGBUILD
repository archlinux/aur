# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Lawrence Lee <valheru@facticius.net>

pkgname=latex-fitch
pkgver=1.6
pkgrel=2
pkgdesc="A LaTeX package for Fitch-style proofs"
arch=('any')
url="http://folk.uio.no/johanw/FitchSty.html"
license=('GPL')
depends=('tetex')
install=fitch.install
#source=(http://folk.uio.no/johanw/fitch.sty)
source=(fitch.sty)
md5sums=('d62bdd0267c217d6017baef950b9205a')

package() {
  install -Dm644 "${srcdir}/fitch.sty" "${pkgdir}/usr/share/texmf-dist/tex/latex/fitch"
}
