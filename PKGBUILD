# Maintainer: Kondrachuk Andrii andriy.kondrachuk@gmail.com
# Maintainer: Demir Yerli demiryerli@gmail.com
pkgname="asudo-bin"
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Another version of sudo"
arch=("x86_64")
source=("asudo.sh")
sha512sums=("SKIP")

prepear() {
sudo rm -rf $pkgdir/asudo.sh
sudo rm -rf /usr/bin/asudo
}

package() {
sudo mkdir -p "${pkgdir}/usr/bin"
sudo cp "${srcdir}/asudo.sh" "${pkgdir}/usr/bin/asudo"
sudo chmod +x "${pkgdir}/usr/bin/asudo"
}
