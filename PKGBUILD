# Maintainer: mhammond9 <mhammond9@radford.edu>
pkgname=dolphin-emu-triforce
pkgbase=dolphin-emu-triforce
pkgver=4.0.315
pkgrel=1
pkgdesc='A Triforce emulator'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
options=('!strip')
source=("https://github.com/monokuma9/dolphin-triforce-linux/releases/download/4.0-315.1/dolphin-emu-triforce-4.0-315.glibc2.15-x86_64.AppImage" "dolphin-emu-triforce.desktop" "dolphin-emu-triforce.png")
sha256sums=('0aaedf5063336f9bac540654a565891ce0eb3ebb1f2195f17d86c87e94448cfd'
            '046306a46845a14952b13b8f8f4cc50a1bd37c1d5d8abf46a87c44d93286e9c8'
            'd917e9ecaa75b1e9e268b869050d76d8e491ba0b862c3ac923a7aa629a91f21b')

package()
{
    cd "$srcdir"
    mkdir $pkgdir/triforce
    install -Dm755 'dolphin-emu-triforce-4.0-315.glibc2.15-x86_64.AppImage' "$pkgdir/usr/bin/dolphin-emu-triforce"
    install -Dm644 "${srcdir}/dolphin-emu-triforce.desktop" \
         "${pkgdir}/usr/share/applications/dolphin-emu-triforce.desktop"
    install -Dm644 'dolphin-emu-triforce.png' "${pkgdir}/usr/share/pixmaps/dolphin-emu-triforce.png"  
}
