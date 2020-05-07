# Maintainer: orumin <dev@orum.in>

pkgname=coccigrep
pkgver=1.20
pkgrel=1
pkgdesc='coccigrep is a semantic grep for the C language based on coccinelle'
arch=('any')
url='http://home.regit.org/software/coccigrep/'
license=('GPL3')
depends=('python-setuptools')
makedepends=('python-setuptools')
source=("https://github.com/regit/coccigrep/archive/v$pkgver.tar.gz")
sha256sums=('624840bac93b92b723bb89be1bf712717b984e7ab34c4712ec2a6135136df421')

package() {
  cd "coccigrep-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
}
