# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact <admin@azccriminal.space>

pkgname=plasma-system-ai
pkgver=1.0.o1
pkgrel=1
pkgdesc="Plasma-supported structure for an AI-based Linux system"
arch=('any')
url="https://github.com/Zamanhuseyinli/Linux-AI"
license=('GPL2')
depends=('python' 'python-setuptools')
makedepends=('git')
source=("git+https://github.com/Zamanhuseyinli/Linux-AI.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Linux-AI/DE-AI/Plasma-system-AI"
  # Optionally generate dynamic version here
  echo "1.0.0"
}

build() {
  cd "$srcdir/Linux-AI/DE-AI/Plasma-system-AI"
  python setup.py build
}

package() {
  cd "$srcdir/Linux-AI/DE-AI/Plasma-system-AI"
  python setup.py install --root="$pkgdir/" --optimize=1
}
