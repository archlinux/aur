# Maintainer: aksr <aksr at t-com dot me>
pkgname=otf-churchslavonic
pkgver=2.0
pkgrel=1
pkgdesc="Unicode-encoded OpenType fonts for Church Slavonic"
arch=('any')
license=('SIL' 'GPL3')
url="https://github.com/typiconman/fonts-cu/"
install=otf.install
source=("https://github.com/typiconman/fonts-cu/releases/download/v${pkgver}/fonts-churchslavonic.zip"
        "https://github.com/typiconman/fonts-cu/releases/download/v${pkgver}/fonts-churchslavonic.pdf")
md5sums=('51c16e225cf7b07ca0501a5cccfe4b02'
         '6084b3fc544efc173a552ac1e3370538')
sha1sums=('aea4f4b79527dd7d3d809f9ddba49b89728e69d9'
          '4b02c9373f353a2463a1a1a1605a82e5d118104b')
sha256sums=('0ede90e7344a8859a05fa2ec801d8819cd746f11612ccf0b2c9e5d4714e9892e'
            'e87a30bc78c8c2610a99bc452a2c8f37f34ff9652cf3a0730b97362a2a33679d')

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/{fonts/OTF,licenses/$pkgname}/
  install -Dm644 *.otf $pkgdir/usr/share/fonts/OTF/
  install -Dm644 fonts-churchslavonic.pdf $pkgdir/usr/share/doc/$pkgname/fonts-churchslavonic.pdf
  install -Dm644 *.txt LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

