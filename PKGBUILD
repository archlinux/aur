# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mathijs Kadijk <maccain13@gmail.com>

pkgname=python-azkaban
pkgver=0.9.5
pkgrel=1
pkgdesc="Lightweight Azkaban client"
arch=('any')
url="https://github.com/mtth/azkaban"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/2b/7f/9a57b857c4756d98e85b5678c0b0806b741fbee53a8762622ea8a10c10f4/azkaban-0.9.5.tar.gz")

package() {
    cd "$srcdir"/azkaban-$pkgver
    python setup.py install --root="$pkgdir" -O1
    install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
sha256sums=('1bca187583d9309ea3e01611e40b75acdcfea3b944e905319651428706eba065')
