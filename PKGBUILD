# Maintainer: guglovich <jinseoyeon@archlinux>
# Created with assistance from Claude (Anthropic)

pkgname=java8-openjfx-bin
pkgver=8.u202_11
pkgrel=1
pkgdesc="Java 8 OpenJFX - JavaFX runtime for Java 8 (prebuilt binary)"
arch=('x86_64')
url="https://github.com/guglovich/java8-openjfx-bin"
license=('GPL2')
depends=('jdk8-openjdk')
provides=('java8-openjfx')
conflicts=('java8-openjfx')
options=('!strip')

source=(
    "java8-openjfx-8.u202-11-x86_64.pkg.tar.zst::https://github.com/guglovich/java8-openjfx-bin/releases/download/v8.u202-11/java8-openjfx-8.u202-11-x86_64.pkg.tar.zst"
)
b2sums=(
    'b8d85754b62cb573c09b5154c312dcc3f0ab007f6645ffbceb4d7c684448fa6ffa6e3ea68bf612df7932f86143b5a84dea1948052e8c535e8ea0a271637c83bc'
)

package() {
    bsdtar -xf "${srcdir}/java8-openjfx-8.u202-11-x86_64.pkg.tar.zst" -C "${pkgdir}" \
        --exclude='.BUILDINFO' \
        --exclude='.MTREE' \
        --exclude='.PKGINFO'
}
