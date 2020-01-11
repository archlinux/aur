# Maintainer: "devzero" (Tim Rice) <t dot rice at ms dot unimelb dot edu dot au>
pkgname=ttf-humor-sans
_realname=Humor-Sans
pkgver=1.0
_licence_name=${_realname}OFL-$pkgver.txt
pkgrel=3
pkgdesc="A sanserif typeface in the style of xkcd."
arch=(any)
url="http://xkcdsucks.blogspot.com.au/2009/03/xkcdsucks-is-proud-to-present-humor.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://antiyawn.com/uploads/$_realname-$pkgver.ttf"
	"http://antiyawn.com/uploads/$_licence_name"
	"ttf.install")
sha512sums=('f0ed2f61f5cedb93ff955d9d5562fd110db750b6d4d91a74346ff94c16c87cac294c061e6ded97ffea372970912f51ee0792a611a6224cd3a38585812971b3dd'
            'e0e4cd5ba46e59dfac962a3943ccc8b694b8226e43aca8f0140d6c5bd5ddf92f51f89b4876b8d7cc25b1c71d8476c23ade3c6f711d1b676fb1623d73223d5f8e'
            'f9db8af3a86d9b95c7e22b130225f45d6a60f2fe99634d55a7b2b7b0948c8871700e46a16a883a77efddeff177b008c3ac4f63887a3fedeb23df66367dabc9e9')

build() { :
}
package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -D -m644 "$_licence_name" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
