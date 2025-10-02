# Maintainer: TNE <tne@garudalinux.org>
# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=garuda-libs
pkgdesc="Libraries commonly used by Garuda Linux software"
pkgver=1.7.1
pkgrel=1
arch=('any')
license=('GPL')
depends=('libnotify' 'expect')
optdepends=('alacritty' 'lxterminal' 'konsole' 'gnome-terminal' 'xfce4-terminal' 'xterm' 'qrencode')
source=("launch-terminal" "garuda.shlib" "is-snapshot-boot" "install-software" "org.garuda.libs.pkexec.policy" "pkexec-gui" "pacdiff-merge" "qrcode")
sha512sums=('351941ad20ab2e1bc7d1a1f7b690fcda86badddd8f17e40ed62af28eac9be1eeb6d7e7c079dcc08cb61c618d08bd108e1c3c8a8a8cd7ba674036fe7cbea80361'
            'c93d39c8616d58ba38fc792900c8a05ee573a3571d79d208957eae2ee40147bbee200b7c78e0b24ad52125121deb3d8dbb6fe856c1b291f5b852148a7eaa5925'
            '2ba2701c933b37fd708efe9cd8a2dc9e17d33f6c7ecafcdd3ffd4292b5d88cde10595e15af1560b8c03bd3e1b94e13a69d23d72899ec75b500856c71bd23c446'
            'aa5ade90651d4b2ee9199277c7b8737ca717d69d4e7a0afc37e06542ba5dc34f33d8c8b50c0a79920c8fb7c71cc60e8b59fcca39055cfda589725401afe1ca30'
            '80987b22253b99ba62ebc63d35455949747a5d530afc72782891319a803c2fa2d78ee831a8eb95069d6209bf0f46da6c5be84fc484e84b77054fcb9b6d89b5cd'
            '1503bedbcfdae0e3d90821a35c233af113c91a02b3f154911eba0f3f4d4e8f0dc78e21e1742c5b035d49dab3f6f5b979eb38109f97275273e1b81d7af4e442f9'
            '7d67f776d526ce41f06e609ca9e3d00b3e261b7824eb7856afba2260a307be19c03375dc56ec9e00daa5aabd59176fbb7e2657a450600f7c381ecc43809e1ae6'
            'a02aea578c17f6f85198fb8bf56eac4074f6e0f6106099fd198fc9fad355d844f86b0b5c48b3ce6b884f89a7c9b4685f809dd3cef0f8c922a007cf633ccb6bdc')

package() {
  install -Dm755 launch-terminal "$pkgdir"/usr/lib/garuda/launch-terminal
  install -Dm755 install-software "$pkgdir"/usr/lib/garuda/install-software
  install -Dm755 is-snapshot-boot "$pkgdir"/usr/lib/garuda/is-snapshot-boot
  install -Dm755 pkexec-gui "$pkgdir"/usr/lib/garuda/pkexec-gui
  install -Dm755 pacdiff-merge "$pkgdir"/usr/lib/garuda/pacdiff-merge
  install -Dm755 qrcode "$pkgdir"/usr/lib/garuda/qrcode
  install -Dm644 garuda.shlib "$pkgdir"/usr/lib/garuda/garuda.shlib
  install -d "$pkgdir"/var/lib/garuda/tmp

  install -Dm0644 org.garuda.libs.pkexec.policy "$pkgdir/usr/share/polkit-1/actions/org.garuda.libs.pkexec.policy"
}
