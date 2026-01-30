#Maintainer: Samuel Kendall toxichemicals@proton.me
pkgname=szip
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, unified CLI wrapper for many compression/packaging tools."
arch=('any')
url="https://github.com/toxichemicals/szip"
license=('Apache 2.0')
depends=('bash' 'file' 'tar' 'p7zip' 'zip' 'unzip' 'xz' 'bzip2' 'lz4' 'lzip' 'pv')
source=("szip")
md5sums=('SKIP') # Use 'makepkg -g' to generate real sums later

package() {
    # Create the /usr/bin directory in the package environment
    install -Dm755 "${srcdir}/szip" "${pkgdir}/usr/bin/szip"
}
