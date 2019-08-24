pkgname=tccv-git
pkgver=1.2.2
pkgrel=1
pkgdesc='LaTeX class to generate two-columns resumes'
arch=('any')
url='https://github.com/ntd/tccv'
license=('LPPL')
depends=('texlive-core')
makedepends=('git')
source=("${pkgname}::git+https://github.com/ntd/tccv.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 tccv.cls "${pkgdir}/usr/share/texmf-dist/tex/latex/tccv/tccv.cls"
}
