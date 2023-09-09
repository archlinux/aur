# Maintainer: Archean <1091876908@qq.com>
pkgname=foru
pkgver=1.1.0
pkgrel=1
pkgdesc="A unofficial client of spotify based on electron & react"
url="https://github.com/Archean-wang/ForU"
arch=("x86_64")
license=('MIT')
source=("https://github.com/Archean-wang/ForU/releases/download/v${pkgver}/foru_${pkgver}_amd64.deb")
sha512sums=('2f6a4845a9c624a8086b8e8d210fa0cfe96d56ace29e13741a4f85193c3106f1fa6bc9840dc13fe9179776f041e5ba71ead26e9377e3406ce77a3cf664a6dd4f')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "$pkgdir"/opt/$pkgname/resources/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
