# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$

pkgname=latex-template-acm
pkgver=200904
pkgrel=1
pkgdesc="The official ACM SIG Proceedings Format style for LaTeX (acm_proc_article-sp v3.2SP, sig-alternate v2.4 and sigplanconf v1.8)"
arch=('any')
url="http://www.acm.org/sigs/publications/proceedings-templates, http://sigplan.acm.org/authorInformation.htm"
_sigproc_url="http://www.acm.org/sigs/publications/"
_sigplan_url="http://sigplan.acm.org/"
license=('')
groups=()
depends=('texlive-latex3')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=texlive.install
source=(${_sigproc_url}sigproc-sp.pdf
${_sigproc_url}acm_proc_article-sp.cls
${_sigproc_url}sigproc-sp.tex
${_sigproc_url}sigproc.bib
${_sigproc_url}flies.eps
${_sigproc_url}fly.eps
${_sigproc_url}rosette.ps
${_sigproc_url}sig-alternate.pdf
${_sigproc_url}sig-alternate.cls
${_sigproc_url}sig-alternate.tex
${_sigplan_url}sigplanconf.cls
${_sigplan_url}sigplanconf-template.tex
${_sigplan_url}sigplanconf-template10.tex
${_sigplan_url}sigplanconf-template11.tex
${_sigplan_url}sigplanconf-guide.pdf)
md5sums=('ae11eddebdf6d30071a8cfac0c8984fb'
         '49fc14f68a73f326183ff0d766bec0c2'
         '0ac6b024a088e6d6f1cdfbdfe68f85e1'
         '045cff45096bc53833df7eca105d1ace'
         'c6a1b19bf288f26bc2dba4b72ac7d457'
         '557a5283c73690acc0ef2d5a1adc5e61'
         'da992183e40385e6cab3e7d4feece0f4'
         '239175bb1c14c0ee1288e2b1bac694e6'
         '0043b85d599385e40b673bc3325248f8'
         'dba56cd52fbb4fba62d9fa0585b6e0ca'
         '0ff75357bcf9b5b25962f3c7bc18146f'
         '60b41a8463ae87374ae99dfdfa04ee6c'
         '4e94835d0b432831e54701ec2fa0800f'
         '7db95b194a770fa2ee90fce0f80d9cd7'
         '08c2fa4df6473c2f1bb150797f82f448')

build() {
  cd "$pkgdir"
  mkdir -p usr/share/texmf-dist/tex/latex/
  cd usr/share/texmf-dist/tex/latex/
  mkdir sigproc sigplan
  cp $srcdir/{acm_proc_article-sp,sigproc,flies,fly,rosette,sig-alternate}* \
    sigproc
  cp $srcdir/sigplanconf* \
    sigplan
}

# vim:set ts=2 sw=2 et:
