# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: Nathan Lowe <techwiz96@gmail.com>
pkgname=msbuild-sdkresolver-16-bin
_pkgver=16.3+xamarinxplat.2019.08.08.00.55-0xamarin2+ubuntu1804b1
_pkgname=msbuild-sdkresolver
pkgver=${_pkgver//[+-]/_}
pkgrel=1
pkgdesc="Xamarin implementation of the Microsoft build system"
arch=('x86_64')
depends=('mono>=5.0.0')
provides=('msbuild-sdkresolver')
conflicts=('msbuild-sdkresolver')
url="https://github.com/mono/msbuild"
license=('MIT')
source=("msbuild-sdkresolver-amd64-v${_pkgver}.deb::http://download.mono-project.com/repo/ubuntu/pool/main/m/msbuild/${_pkgname}_${_pkgver}_all.deb")
sha256sums=('1ad43912ba5e8190f5dde65d4b7ccba7f765e4097adb0bc482d811f913a7fc00')

package() {
    cd "${srcdir}"

    bsdtar xf data.tar.xz
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
