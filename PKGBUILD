# Maintainer: aksr <aksr at t-com dot me>
pkgname=otf-churchslavonic
pkgver=2.2.1
pkgrel=1
pkgdesc='Unicode-encoded OpenType fonts for Church Slavonic'
arch=('any')
license=('OFL-1.1' 'GPL-3.0')
url='https://github.com/typiconman/fonts-cu'
source=("$url/releases/download/v${pkgver}/fonts-churchslavonic.zip")
md5sums=('a28aeb256044cbbdc820c94847e15ff3')
sha1sums=('9bb25c0351b917b3c435dda0839a870e94df3cee')
sha256sums=('6fd44c6fb4fecc01ecea8dda6efc18bf46646f2e5d997c7d60e0cbae3aa8ff2e')
b2sums=('bdef8d5c13dc182f333248b1e2331bdd198a33461a2f07b6eeea29742026622b8ec4ffcbd797c58e0ff0ad2441ca3691a38b380f70867ff784a839ad37b26f28')

package() {
	cd "$srcdir/fonts-${pkgname#otf-}"
	mkdir -p $pkgdir/usr/share/fonts/OTF
	install -D -m644 *.otf $pkgdir/usr/share/fonts/OTF/
	cd docs/
	install -D -m644 fonts-churchslavonic.pdf $pkgdir/usr/share/doc/$pkgname/fonts-churchslavonic.pdf
}
