# Maintainer: Jeicobroot-jrt
pkgname=spackit
pkgver=1.0
pkgrel=1
pkgdesc="Kit de herramientas y alias personalizados"
arch=('any')
url="https://github.com/Jeicobroot-jrt/Spackit"
license=('MIT')
depends=('bash' 'git')
source=("git+https://github.com/Jeicobroot-jrt/Spackit.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/Spackit"
  # Instalamos el script en /usr/bin/ para que se ejecute escribiendo 'spackit'
  install -Dm755 setup_aliases.sh "$pkgdir/usr/bin/spackit"
}
