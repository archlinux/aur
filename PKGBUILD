# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_dhall_ver=1.37.0
pkgname='dhall-bash-bin'
pkgver=1.0.35
pkgrel=1
pkgdesc="Dhall to bash compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')
source=("https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-bash-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-bash/LICENSE")
sha256sums=('16425fcc3fc144a591ca49a99e00603f329ad1b625938fad436e15270acc4a24'
            '91f68ca8606e7ae993148187e397e20431aa6d870ac9fcc70330a0479468eef9')
b2sums=('bc73472a707237bfeff33f61fe2fff748baa36024a01f18808f2f478016ecd204a2ec776112580aed60ee19a9f2f72520993581b49b48ddfced92e334f42968a'
        '1431794398f5ff3af38b738559bef170c77755d6c46b35f2db3a68417aa70e5e2c2be39d1036443121531a91ffd631c901b7185ce30ab401440ce5f2fa31c25a')

package() {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-bash"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
