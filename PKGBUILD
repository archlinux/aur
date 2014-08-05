# Maintainer: Max Bruckner
pkgname=lfs-me
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple fakeroot based package manager for LFS inspired by Archlinux."
arch=( 'any' )
url="https://github.com/FSMaxB/lfs-me"
license=('GPL3')
depends=( 'rsync' )
source=( "git+https://github.com/FSMaxB/${pkgname}.git#tag=$pkgver" )
md5sums=( SKIP )

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm 755 lfs-me         "${pkgdir}/usr/bin/lfs-me"
    install -Dm 644 PKGBUILD.proto "${pkgdir}/usr/share/lfs-me/PKGBUILD.proto"
    install -Dm 644 Changelog.md   "${pkgdir}/usr/share/lfs-me/Changelog.md"
    install -Dm 644 README.md      "${pkgdir}/usr/share/doc/lfs-me/README.md"
}
