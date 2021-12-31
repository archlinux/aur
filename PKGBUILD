# Maintainer: Kondrachuk Andrii andriy.kondrachuk@gmail.com
# Maintainer: Demir Yerli demiryerli@gmail.com
pkgname="asudo-bin"
pkgver="2.1.1"
pkgrel="2"
pkgdesc="Another version of sudo"
url="https://github.com/GOseUser/ASudo"
depends=("util-linux>=2.0.0")
arch=("x86_64")
source=("asudo.sh")
sha512sums=("SKIP")

prepear() {
rm -rf ${pkgdir}/asudo.sh
rm -rf /usr/bin/asudo
}

package() {
mkdir -p "${pkgdir}/usr/bin"
cp "${srcdir}/asudo.sh" "${pkgdir}/usr/bin/asudo"
chmod +x "${pkgdir}/usr/bin/asudo"
}
