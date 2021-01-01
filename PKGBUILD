# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=kitematic-bin
provides=(kitematic)
conflicts=(kitematic)
pkgver=0.17.13
pkgrel=1
pkgdesc='Visual Docker Container Management'
arch=('x86_64')
url='https://github.com/docker/kitematic'
license=('Apache')
depends=('docker' 'nodejs' 'glib2' 'hicolor-icon-theme'
         'nss' 'libxss' 'libxtst' 'gtk2' 'gconf' 'alsa-lib')
source=("$url/releases/download/v$pkgver/Kitematic-$pkgver-Ubuntu.zip")
sha256sums=('d5c9cd64b272ac34ae4d6cc15a68476a09f6edfda650a6f5f9bc1e915901f6c7')
options=('!strip')

package() {
    bsdtar xf Kitematic-${pkgver}_amd64.deb data.tar.xz
    bsdtar xf data.tar.xz -C "$pkgdir"
}
