# Maintainer: Antti <antti@antti.codes>

pkgname=modrinth-app-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='An unique, open source launcher that allows you to play your favorite mods, and keep them up to date, all in one neat little package.'
url='https://modrinth.com/app'
arch=('x86_64')
license=('GPL3')
depends=('webkit2gtk' 'openssl-1.1')
provides=('modrinth-app')
conflicts=('modrinth-app' 'modrinth-app-git')
source=("https://launcher-files.modrinth.com/versions/${pkgver}/linux/modrinth-app_${pkgver}_amd64.deb")
sha256sums=('06c3f80362eaf17695dbb515eb9d40436d46e635c6eb0176076f9bab40bc9782')

build() {
    cd "$srcdir/"
    tar xf data.tar.gz
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}"
}
