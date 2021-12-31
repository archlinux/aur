# Maintainer: Demir Yerli demiryerli@gmail.com
pkgname="dotnetpublisher-bin"
pkgbase="dotnetpublisher"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Compile .NET file for GNU/Linux easily "
arch=("x86_64")
source=("dotnetpublisher.sh")
sha512sums=("SKIP")

prepear() {
sudo rm -rf ${pkgdir}/dotnetpublisher.sh
sudo rm -rf /usr/bin/dotnetpublisher
}

package() {
sudo mkdir -p "${pkgdir}/usr/bin"
sudo cp "${srcdir}/dotnetpublisher.sh" "${pkgdir}/usr/bin/dotnetpublisher"
sudo chmod +x "${pkgdir}/usr/bin/dotnetpublisher"
}
