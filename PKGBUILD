# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-bin-x86_64
pkgver=0.8.0
arch=(x86_64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-bin-x86_64 wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-bin-x86_64-0.8.0.tar.gz')
md5sums=('cc1b8a6fccf66d8acd0337e3acb985b1')
sha1sums=('e18ff19ca5d94a3848c5b94ec1abbfac883a0528')
sha256sums=('2ceb11ed2633d5b2255856d04440b5273fe44e6862ced7b169c239d8cf6e8afa')
sha512sums=('8d423709c5466a8a7dac52fd8b9b9fd0c774a102b3c3b4f857a8e8997584d112d2fa3566a8b23d152b7bad5270e72ee353fd247822dca5ca577f234dfec90cf9')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
