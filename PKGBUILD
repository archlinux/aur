# Maintainer: 4sterisk <146138447+4ster1sk@users.noreply.github.com>
pkgname=miria-bin
pkgver=4.0.1+127
pkgrel=1
pkgdesc="Miria is Misskey Client App for iOS, Android and many targets which made by Flutter."
arch=('x86_64')
url="https://github.com/shiosyakeyakini-info/miria"
license=('AGPL3')
depends=('gtk3' 'libsecret')
source=("https://github.com/shiosyakeyakini-info/miria/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('8234a92ea8805e971130fca78ffa3e58508cde5bfa5e7b1c9c93a3ceb97af374')

package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
