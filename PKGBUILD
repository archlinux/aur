# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-minecraft
pkgver=1.0
pkgrel=2
pkgdesc='Font based off Minecraft’s original ASCII charts'
arch=(any)
url="https://www.fontspace.com/jdgraphics/minecraft"
license=('custom:free for personal use')
source=("$pkgname-$pkgver.zip::https://www.fontspace.com/get/family/m3zm2")
sha256sums=('36acb15ae59e9eed51e581b0a3ad4d56761bd0db7c0902d3e3c517d29fa9246e')

package() {
	install -Dm644 MinecraftBoldItalic-*.otf "$pkgdir/usr/share/fonts/OTF/MinecraftBoldItalic.otf"
	install -Dm644 MinecraftBold-*.otf       "$pkgdir/usr/share/fonts/OTF/MinecraftBold.otf"
	install -Dm644 MinecraftItalic-*.otf     "$pkgdir/usr/share/fonts/OTF/MinecraftItalic.otf"
	install -Dm644 MinecraftRegular-*.otf    "$pkgdir/usr/share/fonts/OTF/MinecraftRegular.otf"
}
