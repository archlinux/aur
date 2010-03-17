# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
# vim:set ts=2 sw=2 et:

pkgname=latex-template-acm
pkgver=201003
pkgrel=1
pkgdesc="ACM SIG Proceedings Format style for LaTeX (acm_proc_article-sp v3.2SP, sig-alternate v2.4, sigplanconf v2.3 and the unofficial sigplan-proc-varsize v1.4)"
arch=('any')
url="http://www.acm.org/sigs/publications/proceedings-templates, http://sigplan.acm.org/authorInformation.htm, http://www.isi.edu/~johnh/SOFTWARE/LATEX/"
_sigproc_url="http://www.acm.org/sigs/publications"
_sigplan_url="http://www.sigplan.org"
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
${_sigplan_url}/sigplanconf-template10.tex
${_sigplan_url}/sigplanconf-template11.tex
${_sigplan_url}/sigplanconf-guide.pdf
http://www.isi.edu/~johnh/SOFTWARE/LATEX/sigplan-proc-varsize-package.tar.gz
)

build() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/{sigproc,sigplan,sigplan-proc-varsize}
  cp ${srcdir}/{acm_proc_article-sp,sigproc,flies,fly,rosette,sig-alternate}* \
    ${pkgdir}/usr/share/texmf-dist/tex/latex/sigproc
  cp ${srcdir}/sigplanconf* ${pkgdir}/usr/share/texmf-dist/tex/latex/sigplan
  tar xzvf ${srcdir}/sigplan-proc-varsize-package.tar.gz \
    -C ${pkgdir}/usr/share/texmf-dist/tex/latex/sigplan-proc-varsize
}

md5sums=('77a0365d2aefcff5ba5a2673f9ea8e5b'
         '49fc14f68a73f326183ff0d766bec0c2'
         '67858fe744bc76972e689a01d2a4415b'
         '045cff45096bc53833df7eca105d1ace'
         'c6a1b19bf288f26bc2dba4b72ac7d457'
         '557a5283c73690acc0ef2d5a1adc5e61'
         'da992183e40385e6cab3e7d4feece0f4'
         '400600fe9911a1256ab40406d8085c5b'
         '8753848f67f8203fc161e28be692156e'
         'c95cf4562f95e7bf533143ef1c37e678'
         '9946f571cb31cc6bfb45e1281c042f79'
         '00ffefdab78bb8eb9039a8d2d5a31a94'
         '4e94835d0b432831e54701ec2fa0800f'
         '7db95b194a770fa2ee90fce0f80d9cd7'
         '85b8aa489fa4f227f290fb16bb17f4c7'
         '216c50b96e931516e9c3fba2567d5838')
