# Maintainer: leoneii comdir@infonix.info

name=chromium-gost
pkgname=chromium-gost
url="https://github.com/deemru/Chromium-Gost"
pkgver=150.0.7871.128
pkgrel=1
pkgdesc="Chromium-Gost — веб-браузер с открытым исходным кодом на основе Chromium с поддержкой криптографических алгоритмов ГОСТ при установке защищённых соединений через интерфейс msspi"
arch=('x86_64')
license=('MIT')
source=("https://github.com/deemru/Chromium-Gost/releases/download/${pkgver}/chromium-gost-${pkgver}-linux-amd64.deb")
sha256sums=('4d930818d970b0041be54d3e5836d72ca511d9a9d10ddbf2d7ecb2e0d8340dad')

makedepends=(
)
depends=(
)

build() {
  echo "Skiping build....."
  # Извлекаем содержимое RPM
 # rpm2cpio "$srcdir/chromium-gost-${pkgver}-linux-amd64.rpm" | cpio -id -m -P  # -P - это чтобы не удаляло символические ссылки
  # Дополнительные шаги по сборке, если необходимо
  # Например, копируем файлы из извлеченного RPM в каталог сборки
 # mv ./your-package-directory/ /path/to/your/build/directory
  # Запускаем скрипты установки, если необходимо
  # ./configure
  # make
}

package() {
  # Копируем необходимые файлы в каталог пакета
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}

