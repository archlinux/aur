pkgname=amber-lang-bin
_pkgname=amber
pkgver=0.6.0.alpha
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
arch=('x86_64' 'aarch64')
license=('GPL-3.0')
provides=('amber-lang')
depends=('bash' 'bc')
conflicts=('amber-bash-bin' 'amber-bash-git' 'amber-lang-git')

source_x86_64=("https://github.com/amber-lang/amber/releases/download/0.6.0-alpha/amber-linux-gnu-x86_64.tar.xz")
source_aarch64=("https://github.com/amber-lang/amber/releases/download/0.6.0-alpha/amber-linux-gnu-aarch64.tar.xz")

sha256sums_x86_64=('578d3d6335aca1bfc902477a1553561990505a8727ecd9b848af20a072867ee4')
sha256sums_aarch64=('b5f3b46cc2f3eaabc51c136eb46d000cbcbf21b68e5efc61926c54ed509fe9ae')

package() {
  cd $srcdir
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
