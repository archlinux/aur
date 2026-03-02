# Maintainer: leoneii comdir@infonix.info

name=happ-desktop
pkgname=happ-desktop
url="https://github.com/Happ-proxy/happ-desktop"
pkgver=2.2.0
pkgrel=2
pkgdesc="Happ is a mobile application designed for convenient proxy server management, powered by the robust Xray core."
arch=('x86_64')
license=('custom')
source=("https://github.com/Happ-proxy/happ-desktop/releases/download/${pkgver}/Happ.linux.x64.pkg.tar.zst")
noextract=("Happ.linux.x64.pkg.tar.zst")
sha256sums=('3838da92c952de0ac92f985cc26d67311efe1f50ca7f0cba5e2959f0fbb4892f')


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
  cd "$srcdir"
 # pacman -U --noconfirm ./Happ.linux.x64.pkg.tar.zst
  # Копируем необходимые файлы в каталог пакета
 # echo "Extracting the data.tar.zst..."
#bsdtar -xf data.tar.zst -C "$pkgdir/"
}

