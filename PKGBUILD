# Maintainer: 4sterisk <146138447+4ster1sk@users.noreply.github.com>
pkgname=miria-bin
pkgver=3.0.1+123
pkgrel=1
pkgdesc="Miria is Misskey Client App for iOS, Android and many targets which made by Flutter."
arch=('x86_64')
url="https://github.com/shiosyakeyakini-info/miria"
license=('AGPL3')
depends=('gtk3' 'mpv' 'libsecret')
source=("https://github.com/shiosyakeyakini-info/miria/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('bba254909088bdcabdf1787c5984fe1a763e5eca5aa7f25a48d9a9df0697f882')

package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
