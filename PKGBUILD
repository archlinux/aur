# Maintainer: Tu Nombre <tu_email@dominio.com>
pkgname=redondo
pkgver=1.0
pkgrel=1
pkgdesc="Programa que muestra una frase aleatoria de Los Redondos"
arch=('any')
url="https://github.com/arokzZz/redondo.git"
license=('GPL')
depends=()
source=("redondo.sh" "frases.pr")
sha256sums=('SKIP' 'SKIP')  # Se puede calcular el hash si es necesario

prepare() {
  # Aquí podrías agregar algún paso de preparación si es necesario
  return 0
}

build() {
  # En esta sección se construye el paquete, en tu caso no parece ser necesario compilar nada
  return 0
}

package() {
  # Definir la instalación de los archivos en el directorio del paquete
  install -Dm755 "$srcdir/redondo" "$pkgdir/usr/bin/redondo"
  install -Dm644 "$srcdir/frases.pr" "$pkgdir/usr/share/redondo/frases.pr"
}

# Generar el archivo .SRCINFO
