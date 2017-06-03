# Maintainer: Colin Wallace <wallacoloo@gmail.com>
# Download links to other u-he VSTs can be found here: http://www.kvraudio.com/forum/viewtopic.php?f=31&t=424953
# Note: These VSTs require purchase/activation.

pkgname=instalooper-vst
pkgver=1.2
pkgrel=1
pkgdesc='Insta Looper is a simple looper with four integrated FX'
arch=('x86_64' 'i686')
url='http://audioblast.me/instalooper.html'
license=('custom')
source_i686=('http://audioblast.me/wa_files/InstaLooperVST-x86-v1_2.zip')
source_x86_64=('http://audioblast.me/wa_files/InstaLooperVST-x64-v1_2.zip')
sha256sums_x86_64=('3adba32650803ef94ac528ea14f0dceb32c2f79116b9e59e202271364be70508')
sha256sums_i686=('d6a1114d077be9f14bbb59ca4f3cf25ee5406b4b0c6344b479202c45f0f2696e')

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/lib/vst"
    install -Dm755 *.so "$pkgdir/usr/lib/vst"
    install -Dm644 "INSTA LOOPER Manual Linux V1.2 .pdf" "$pkgdir/usr/share/doc/${pkgname%-*}/manual.pdf"
}

