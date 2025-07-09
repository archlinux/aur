# ~/hemeshp-pkg/PKGBUILD

pkgname=hemeshp
pkgver=1.0
pkgrel=1
pkgdesc="A scripting language like Bash, created by Hemesh"
arch=('any')
url="https://github.com/hemeshdev/hemeshp"
license=('GPL')
depends=('python')
source=('hemeshp' 'hemeshp_main.py')
md5sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "${srcdir}/hemeshp" "${pkgdir}/usr/bin/hemeshp"
  install -Dm644 "${srcdir}/hemeshp_main.py" "${pkgdir}/usr/bin/hemeshp_main.py"
}
