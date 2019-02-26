# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname='connectd'
pkgver=2.2.5
pkgrel=1
pkgdesc='Core remote.it connectivity tool for remotely connecting to any device without exposing open ports to hackers.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://www.remote.it'
license=('BSD-3-Clause')
depends=()
source_i686=("https://github.com/remoteit/installer/releases/download/v${pkgver}/connectd_${pkgver}_x86-etch.tar")
source_x86_64=("https://github.com/remoteit/installer/releases/download/v${pkgver}/connectd_${pkgver}_x86_64-etch.tar")
source_armv7h=("https://github.com/remoteit/installer/releases/download/v${pkgver}/connectd_${pkgver}_arm-linaro-pi.tar")
source_aarch64=("https://github.com/remoteit/installer/releases/download/v${pkgver}/connectd_${pkgver}_aarm64-ubuntu16.04_static.tar")
md5sums_i686=('155ff94fc5d349b4be29a843a38c53fb')
md5sums_x86_64=('416fca581f711a3ca238c1e768841f8b')
md5sums_armv7h=('b5f951ba7fe0baf64281e0e22e15663b')
md5sums_aarch64=('1e9748bfef481ca051bf5efc89459a4b')

package() {
    cd "${srcdir}"
    cp -dpr --no-preserve=ownership {etc,usr} "${pkgdir}"
    cp -dpr --no-preserve=ownership lib "${pkgdir}/usr"
}
