# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.11
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-git')
# No longer provide official pre-build x32 pkg.
# Suggest to use cbmc or cbmc-git if you are in x32 platform
source=("http://www.cprover.org/cbmc/download/cbmc-5-11-linux-64.tgz")
sha256sums=('6be102146cebe21390c78062eedadd3368b93790af2147313ac6f6cc11958ea6')

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
