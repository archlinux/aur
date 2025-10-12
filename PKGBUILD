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
source=("monika-after-story.pkg.tar.zst::https://github.com/adogecheems/monika-after-story-linux/releases/latest/download/monika-after-story-0.12.17-10-x86_64.pkg.tar.zst")
noextract=('monika-after-story.pkg.tar.zst')
sha256sums=('SKIP')
package() {
    bsdtar -xvf "$srcdir/monika-after-story.pkg.tar.zst" -C "$pkgdir" opt usr
}