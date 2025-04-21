# Maintainer: Maki <maki@hotmilk.space>

pkgname=ttf-zen-maru-gothic
pkgver=1.002 # derived from -Regular.ttf
pkgrel=1
pkgdesc="Zen Maru Gothis is a rounded san serif family that gives a soft and natural impression due to the deep rounds in the corners."
arch=("any")
url="https://fonts.google.com/specimen/Zen+Maru+Gothic"
license=("OFL")
# source=("zen-marugothic::git+https://github.com/googlefonts/zen-marugothic.git")
# git repo is bigger than expected
_commit=553c872b216d1290e2902a466edcdc9682f0df6a
_prefix=https://github.com/googlefonts/zen-marugothic/raw/$_commit
source=(
	"$_prefix/fonts/ttf/ZenMaruGothic-Light.ttf"
	"$_prefix/fonts/ttf/ZenMaruGothic-Regular.ttf"
	"$_prefix/fonts/ttf/ZenMaruGothic-Medium.ttf"
	"$_prefix/fonts/ttf/ZenMaruGothic-Bold.ttf"
	"$_prefix/fonts/ttf/ZenMaruGothic-Black.ttf"
	"$_prefix/OFL.txt"
)
sha256sums=(
	"c4e6fa10ff517df37cb0c13038fe2813f3c47afe6577fa4a5573200e4508b2c1"
	"a0c0b53543e0993ae2225e629c833f3d51495ad31720694ff112ce4ce11111ef"
	"3cfdb98a13571ede17fcc769f5093a97c38b80a7b9b2ab754a26b4d822092b3b"
	"fe24426b9c8b5523a0146a8235c8674eccf0493af354a53ec895c3596d9eb745"
	"6bd74fe76cd39ee0ec18775c3661d845343fb3f6f8fa09a3076638417baf741f"
	"2a20cf7ce1909d8ee1e949095d340f7d7656705f7c810a2d6faf56800ad0cb3d"
)

package() {
	install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
