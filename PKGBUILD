pkgname=redondo
pkgver=1.0
pkgrel=1
pkgdesc="Programa que muestra una frase aleatoria de Los Redondos"
arch=('any')
url="https://github.com/arokzZz/redondo.git"
license=('GPL')
depends=()
source=("redondo" "frases.pr")
sha256sums=('SKIP' 'SKIP')  # Si los archivos están en tu repositorio

prepare() {
  return 0
}

build() {
  return 0
}

package() {
  install -Dm755 "$srcdir/redondo" "$pkgdir/usr/bin/redondo"
  install -Dm644 "$srcdir/frases.pr" "$pkgdir/usr/share/redondo/frases.pr"
}

  # Aquí podrías agregar algún paso de preparación si es nece
  # En esta sección se construye el paquete, en tu caso no parec
