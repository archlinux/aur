# Maintainer: adogecheems <adogecheems at outlook dot com>
pkgname=monika-after-story-bin
pkgver=0.12.17
pkgrel=10
pkgdesc="A mod for the free game Doki Doki Literature Club from Team Salvato, which builds on Act 3 to create a simulator of your eternal life with Monika."
arch=(
    'i686'
    'x86_64'
)
url="https://github.com/adogecheems/monika-after-story-linux"
license=('custom')
optdepends=('monika-after-story-tr-cn: A third-party Chinese language patch for the Monika After Story.')
provides=('ddlc-mas')
conflicts=('monika-after-story')
source=(https://github.com/adogecheems/monika-after-story-linux/releases/download/v$pkgver/monika-after-story.pkg.tar.zst)
sha256sums=(f3579ae0362d07754170a9b47d1ecb0e3778ebfeedb3f6f1f1ffd26d223c4aa7)
package() {
    bsdtar -xvf "$srcdir/monika-after-story-$pkgver-$pkgrel-x86_64.pkg.tar.zst" -C "$pkgdir"
}