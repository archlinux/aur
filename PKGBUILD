# Maintainer: Jat <chat@jat.email>

pkgname=obs-ndi-bin
pkgver=4.11.1
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/obs-ndi"
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'avahi' 'libndi')
source=("${url}/releases/download/${pkgver}/obs-ndi-${pkgver}-linux-x86_64.deb")
sha256sums=('cca87f5409239a2be8229ed550c42b81b972d1b2c805773bec2ed8d8cdbe852e')

package() {
    cd "${srcdir}"

    tar -xf data.tar.gz -C "${pkgdir}"
}
