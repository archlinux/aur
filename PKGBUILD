# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.11.1+de9b5dae_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.11.1+de9b5dae-1/u20/zivid-studio_2.11.1+de9b5dae-1_amd64.deb)
sha256sums=(63885e42e5a1f5e291172a2eb6e57a5531f6faf1851d4c731657c0e797d2f8f8)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
