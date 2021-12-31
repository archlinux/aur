# Maintainer: Kondrachuk Andrii andriy.kondrachuk@gmail.com
pkgname="aurhelper-bin"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Program that helps you with AUR uploading"
url="https://github.com/GOseUser"
arch=("x86_64")
source=("aurhelper.sh")
sha512sums=("SKIP")

prepear() {
rm -rf ${pkgdir}/aurhelper.sh
rm -rf /usr/bin/aurhelper
}

package() {
mkdir -p "${pkgdir}/usr/bin"
cp "${srcdir}/aurhelper.sh" "${pkgdir}/usr/bin/aurhelper"
chmod +x "${pkgdir}/usr/bin/aurhelper"
}
