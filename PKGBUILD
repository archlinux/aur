# Maintainer : Martino Ferrari <manda.mgf@gmail.com>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-lib"
pkgver="2.0.FE26B"
pkgrel=1
pkgdesc="Bitscope librar"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='aaf3bdbc79787670efc9db41805120fc3b87707e'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='0c19d80156c23b7c074e4a535adc041192139c6f'
fi

_METERPKG="bitscope-library_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_METERPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
