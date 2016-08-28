# Maintainer: Pierre PAILLEUX <pailleux.pierre@gmail.com>
pkgname=bhash_crack-git
pkgrel=1
pkgver=1.6
pkgdesc='Hash cracking tool written in Bash'
arch=('any')
license=('SYPLicense')
makedepends=('git')
provides=('bhash_crack')
conflicts=('bhash_crack')
source=("${pkgname}::git+https://github.com/pPailleux/bhash_crack.git")
sha512sums=('SKIP')

package() {
    install -Dm0644 ${srcdir}/${pkgname}/bhash_crack.sh ${pkgdir}/opt/${pkgname}/bhash_crack.sh
    install -Dm0750 ${srcdir}/${pkgname}/output_sample ${pkgdir}/opt/${pkgname}/output_sample
}
