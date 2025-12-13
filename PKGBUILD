# Maintainer: Darko Nikolic <dqrk0@proton.me>

pkgname=python-aods
pkgver=0.3.0
pkgrel=1
pkgdesc='small and hackable build system for c'
arch=('x86_64')
url='https://github.com/nikoloc/aods'
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikoloc/aods/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd "aods-$pkgver"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm644 aods.py "$pkgdir$site_packages/aods.py"
}

