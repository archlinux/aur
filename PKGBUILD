# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_dhall_ver=1.39.0
pkgname='dhall-bash-bin'
pkgver=1.0.37
pkgrel=1
pkgdesc="Dhall to bash compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')
source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-bash-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-bash/LICENSE")
sha256sums=('2ea4b38db73141f5d494b8df61c80521caee12c73de0b667d046a96686475692'
            '91f68ca8606e7ae993148187e397e20431aa6d870ac9fcc70330a0479468eef9')
b2sums=('66ec1ffc97b394bfc40d2a0b1d5336a08e4bb905e8a4c6fd778955af80f12930f3639017505356dceae93147b0ae4106827dd20f962f0fd509048b0b033d265a'
        '1431794398f5ff3af38b738559bef170c77755d6c46b35f2db3a68417aa70e5e2c2be39d1036443121531a91ffd631c901b7185ce30ab401440ce5f2fa31c25a')

package() {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-bash"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
