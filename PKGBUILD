# Maintainer: pancho horrillo <pancho at pancho dot name>

_name=kapow
_pkgname="${_name}bang"
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=2
pkgdesc='If you can script it, you can HTTP it.'
arch=('x86_64' 'i686' 'aarch64' 'arm6h')
url='https://github.com/BBVA/kapow'
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_source=("$url/releases/download/v$pkgver/${_name}_${pkgver}_linux")
source_x86_64=("${_name}_x86_64::${_source}_amd64")
source_i686=("${_name}_i686::${_source}_386")
source_aarch64=("${_name}_aarch64::${_source}_arm64")
source_arm6h=("${_name}_arm6h::${_source}_armv6")
sha512sums_x86_64=('aada7d60522c8905418e619df6381c02ddcebf4bcbdfb9c9a1d27c3c469621cc1a254c7fe808a6693cc9d87ebdcf881808c0b79f3d576336e42467d6786eeb06')
sha512sums_i686=('c9767b64f093e498c23d862fae45534e2c3148b5ca340fb2d44ac6e08ada0bc67cc0cab83d0a1c8de85b304039fd1e964bc8af24cacb70c1df196efa197112d4')
sha512sums_aarch64=('b409d9e7bd8034ae021d0f5e20e2f405549a5196b3da26ec5418dc050fbc624e9100a72d67d28791b464772005710483e756b09e5550d3f0b1a62ef269e3f674')
sha512sums_arm6h=('0b9f46cbba8f0434ec6346fbf9e89a5375e3425f45e8d528d94a0813b6220a9b18bf86bbfacd0c1919b687926ac775d7138172149ecd2b8c7051095203c08f43')

package() {
	install -Dm755 "${_name}_$CARCH"	"$pkgdir/usr/bin/${_name}"
}
