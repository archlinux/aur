# Maintainer: Leap of Azzam <sayyid.azzam.mufhadol@gmail.com>
pkgname=7zip-bin
pkgver=21.01
_pkgver=$(echo ${pkgver//./})
pkgrel=1
pkgdesc="Official Linux port of command line version of 7-Zip (not to be confused with p7zip)"
arch=('x86_64' 'i686' 'armv7l' 'aarch64')
url="https://www.7-zip.org"
license=('LGPL')
source_x86_64=("https://7-zip.org/a/7z${_pkgver}-linux-x64.tar.xz")
source_i686=("https://7-zip.org/a/7z${_pkgver}-linux-x86.tar.xz")
source_armv7l=("https://7-zip.org/a/7z${_pkgver}-linux-arm.tar.xz")
source_aarch64=("https://7-zip.org/a/7z${_pkgver}-linux-arm64.tar.xz")
md5sums_x86_64=("cc30db641a3127173ed0a9b8ef1e916a")
md5sums_i686=("bd8b3d45efc9fdb6400cefa539dc8404")
md5sums_armv7l=("788d67ace25c9a213fcd0cc125ebe5f2")
md5sums_aarch64=("5052cb0160af813d33f11b41f562e758")

package() {
    mkdir -p ${pkgdir}/usr/bin/
	install -m 755 7zz ${pkgdir}/usr/bin/
}
