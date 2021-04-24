# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-condaindex
pkgver=2021.2.0
_debpkgrel=94
pkgrel=1
pkgdesc="oneAPI Common Install components"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=("https://apt.repos.intel.com/oneapi/pool/main/${pkgname}-${pkgver}-${_debpkgrel}_amd64.deb")
sha256sums=('6ef412eef9e4b6e4919e4edea97d05ddd68b2830b5ff08ae0534346490d5ee5d')

build() {
	tar xvf data.tar.xz
}

package() {
	mv ${srcdir}/opt ${pkgdir}
}
