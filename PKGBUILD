# Maintainer: Matt Gray <Buddy.Matt1984@Gmail.com>
pkgname=monodevelop-versioncontrol-bin
pkgver=7.8.4
pkgrel=1
pkgdesc="VersionControl addins compatible with the monodevelop-bin package"
arch=('x86_64')
license=('MIT')
depends=('monodevelop-bin')
provides=('monodevelop-versioncontrol')
url="https://github.com/mono/monodevelop"

source=("monodevelop-versioncontrol-bin.tar.gz::https://github.com/Buddy-Matt/monodevelop-versioncontrol-bin/releases/download/0.1/monodevelop-versioncontrol-bin.tar.gz")
sha256sums=('3bd030cafedb7a601bffcfc179df68c41580a095c2b87a65a7b586cc6c7acf00')

package() {
    cd "${srcdir}"

    mkdir -p usr/lib/monodevelop/AddIns/
    bsdtar -xf monodevelop-versioncontrol-bin.tar.gz -C usr/lib/monodevelop/AddIns/
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
