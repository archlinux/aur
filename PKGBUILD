pkgname=amber-lang-bin
_pkgname=amber
pkgver=0.5.1.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL-3.0')
provides=('amber-lang')
depends=('bash' 'bc')
conflicts=('amber-bash-bin' 'amber-bash-git' 'amber-lang-git')

source_x86_64=("https://github.com/amber-lang/amber/releases/download/0.5.1-alpha/amber-linux-gnu-x86_64.tar.xz")
source_aarch64=("https://github.com/amber-lang/amber/releases/download/0.5.1-alpha/amber-linux-gnu-aarch64.tar.xz")

sha256sums_x86_64=('4deaaa2d63aa4addcf8514efa11446f76ac998b7ccbb290eb821966c82992729')
sha256sums_aarch64=('c1ecad1e98404fd0e1d8817e11feeabb8cc3061d1229d5b963ba204fad3ed671')

package() {
  cd $srcdir
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
