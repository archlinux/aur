# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=ckube
pkgver=1.0.0
pkgrel=1
pkgdesc='raymarch cubes in your unix terminal'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/soybin/ckube'
license=('MIT')
depends=('gcc' 'ncurses')
provides=('ckube')
_tag=d9d1ec2122c51875da62014ae49fc3e0c989b42e
source=(
  git+$url.git#tag=${_tag}
)
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

