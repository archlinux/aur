# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# vim:set ts=2 sw=2 et:

pkgname=latex-template-acm
pkgver=201312
pkgrel=1
pkgdesc="ACM SIG Proceedings Format style for LaTeX (acm_proc_article-sp v3.2SP, sig-alternate v2.4, sigplanconf v2.5 and the unofficial sigplan-proc-varsize v1.4)"
arch=('any')
url="http://www.acm.org/sigs/publications/proceedings-templates, http://sigplan.acm.org/authorInformation.htm, http://www.isi.edu/~johnh/SOFTWARE/LATEX/"
_sigproc_url="http://www.acm.org/sigs/publications"
_sigplan_url="http://drupal.sigplan.org/sites/default/files"
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
source=(${_sigproc_url}/sigproc-sp.pdf
${_sigproc_url}/acm_proc_article-sp.cls
${_sigproc_url}/sigproc-sp.tex
${_sigproc_url}/sigproc.bib
${_sigproc_url}/flies.eps
${_sigproc_url}/fly.eps
${_sigproc_url}/rosette.ps
${_sigproc_url}/sig-alternate.pdf
${_sigproc_url}/sig-alternate.cls
${_sigproc_url}/sig-alternate.tex
${_sigplan_url}/sigplanconf.cls
${_sigplan_url}/sigplanconf-template.tex
${_sigplan_url}/sigplanconf-guide.pdf
http://www.isi.edu/~johnh/SOFTWARE/LATEX/sigplan-proc-varsize-package.tar.gz
)
package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/{sigproc,sigplan,sigplan-proc-varsize}
  cp ${srcdir}/{acm_proc_article-sp,sigproc,flies,fly,rosette,sig-alternate}* \
    ${pkgdir}/usr/share/texmf-dist/tex/latex/sigproc
  cp ${srcdir}/sigplanconf* ${pkgdir}/usr/share/texmf-dist/tex/latex/sigplan
  tar xzvf ${srcdir}/sigplan-proc-varsize-package.tar.gz \
    -C ${pkgdir}/usr/share/texmf-dist/tex/latex/sigplan-proc-varsize
}

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
