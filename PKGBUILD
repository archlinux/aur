# Maintainer: 4sterisk <146138447+4ster1sk@users.noreply.github.com>
pkgname=miria-bin
pkgver=4.0.0+125
pkgrel=1
pkgdesc="Miria is Misskey Client App for iOS, Android and many targets which made by Flutter."
arch=('x86_64')
url="https://github.com/shiosyakeyakini-info/miria"
license=('AGPL3')
depends=('gtk3' 'libsecret')
source=("https://github.com/shiosyakeyakini-info/miria/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('28cc0157911237598cf8b5d75e94ac68778d5343e2d30fa071a2b0287641a301')

package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}
