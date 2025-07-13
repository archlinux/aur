# Maintainer: 4sterisk <146138447+4ster1sk@users.noreply.github.com>
pkgname=miria-bin
pkgver=2.0.2+117
pkgrel=1
pkgdesc="Miria is Misskey Client App for iOS, Android and many targets which made by Flutter."
arch=('x86_64')
url="https://github.com/shiosyakeyakini-info/miria"
license=('AGPL3')
depends=('gtk3' 'mpv' 'libsecret')
source=("https://github.com/shiosyakeyakini-info/miria/releases/download/v2.0.2+117/miria_2.0.2+117_amd64.deb")
sha256sums=("8a8185a568a48146ff16f849c22205f6eb5efafe8f70463ea5279cb225722474")

package() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
