# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

_dhall_ver=1.40.1
pkgname='dhall-bash-bin'
pkgver=1.0.38
pkgrel=2
pkgdesc="Dhall to bash compiler"
arch=('x86_64')
url='https://github.com/dhall-lang/dhall-haskell'
license=('BSD')
source=("dhall-bash-$pkgver-$_dhall_ver.tar.bz2::https://github.com/dhall-lang/dhall-haskell/releases/download/$_dhall_ver/dhall-bash-$pkgver-x86_64-linux.tar.bz2"
        "https://raw.githubusercontent.com/dhall-lang/dhall-haskell/$_dhall_ver/dhall-bash/LICENSE")
cksums=('504739879'
        '3960705869')
sha256sums=('cda0198b339c42c551f92d3df7c377749d990793c73165f2a007c4adfe68f384'
            '91f68ca8606e7ae993148187e397e20431aa6d870ac9fcc70330a0479468eef9')
b2sums=('70ed82ae4a17ff22490b57ec17cb0bdd4d12401a3bc8142e5a856c4400bef566ee93edcf3cb97a66ea136fd2ac28ce201329b5d0a224a8c6b06916641877dd43'
        '1431794398f5ff3af38b738559bef170c77755d6c46b35f2db3a68417aa70e5e2c2be39d1036443121531a91ffd631c901b7185ce30ab401440ce5f2fa31c25a')

package() {
	install -Dt "$pkgdir/usr/bin/" "$srcdir/bin/dhall-to-bash"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
