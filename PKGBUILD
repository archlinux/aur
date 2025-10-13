# Maintainer: Arti Zirk <arti@zirk.me>

pkgname=kov2025-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Local government council elections 2025 Internet Voting application"
arch=('x86_64')
url="https://www.valimised.ee/en"
license=('custom')
depends=('libxft' 'libxfixes' 'hicolor-icon-theme')
source=('https://www.valimised.ee/valijarakendus/KOV_2025.bin'
	'kov2025.png'
	'kov2025.desktop')
sha256sums=('faf5d7849dbe876fc984e2500dfee8ec33ff1cdb8f554dc157ee20bcf688cf42'
            '034c7c8c15a9dbdbef70a26c78b0daac06dc59feee25b17aff47a00cd5e36fd3'
            'c3149188ccca0558cbcb00e189e0b7364f8ade00e7c4d5c2c8e20ce2cdd6eaa7')

package() {
  install -D -T -m 644 "$srcdir/kov2025.desktop" "$pkgdir/usr/share/applications/kov2025.desktop"
  install -D -T -m 644 "$srcdir/kov2025.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/kov2025.png"
  install -D -T -m 755 "$srcdir/KOV_2025.bin" "$pkgdir/usr/bin/kov2025"
}
# vim:syntax=sh

