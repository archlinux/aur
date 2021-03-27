# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_dhall_ver=1.38.1
pkgname='dhall-bash-bin'
pkgver=1.0.36
pkgrel=2
pkgdesc="Dhall to bash compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')
source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-bash-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-bash/LICENSE")
sha256sums=('22c94ddc94b1d48a6b624da4287156108eb4abc6bc828520fba9cec22488c565'
            '91f68ca8606e7ae993148187e397e20431aa6d870ac9fcc70330a0479468eef9')
b2sums=('11626a9a7ca7a4b40454228f94788508bf2ffd196f6174b64b75466d3bf328dc80a881bdc4dafaa5cb72fc055e4f5e89ae30d78af73f4b0ba0c9750e2fdf91d4'
        '1431794398f5ff3af38b738559bef170c77755d6c46b35f2db3a68417aa70e5e2c2be39d1036443121531a91ffd631c901b7185ce30ab401440ce5f2fa31c25a')

package() {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-bash"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
