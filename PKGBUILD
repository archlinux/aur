# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=rfc-pdf
pkgver=20151211
pkgrel=1
pkgdesc="RFCs from rfc-editor.org in pdf format."
arch=('any')
url="http://www.rfc-editor.org/"
license=("custom")
options=('docs')
source=(http://www.rfc-editor.org/rfc/tar/pdfrfc0001-0500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc0501-1000.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc1001-1500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc1501-2000.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc2001-2500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc2501-3000.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc3001-3500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc3501-4000.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc4001-4500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc4501-5000.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc5001-5500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc5501-6000.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc6001-6500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc6501-7000.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc7001-7500.tar.gz
        http://www.rfc-editor.org/rfc/tar/pdfrfc7501-latest.tar.gz)
md5sums=('5cf54c7b9143abb1dee84bfac3e6fb4f'
         'eb7afc621e4eaf5f3989de6be1844e62'
         '96d3b17b93d9940370ba4e09bb303a99'
         'cbf3c664acb7a48baa219126cb1c9b3b'
         '89a88cb660c1ef30cbc4020b04541ff9'
         '5cd622d3ed505c116c78a2cdc9d8522e'
         '61840cda3adc8c7591377604f1f357a0'
         '58536739d4336639fcd0adb3f301faf7'
         '65bd7b54378bdf4f52348fdc5fbc01de'
         'd445159d5e9ee00a0a797782242d5dad'
         '97855d125d32ac0d664a1ca723c8083b'
         '81221fed6e5558eaeae3f73eed3f3b16'
         '60e58054285ace06ab95cd6a651a92d1'
         'e799b5caea05c4b0edcea86a6471e3a0'
         '17881cf7df62df34d6b5226a9084d98b'
         'b2bd682a25d5349e4d5109d1b3e61654')

package() {
    mkdir -p "$pkgdir/usr/share/doc/rfc/pdf"
    cp ${srcdir}/pdfrfc/*.pdf ${pkgdir}/usr/share/doc/rfc/pdf/

    cd "${pkgdir}/usr/share/doc/rfc"
    find . -type f -exec chmod 444 {} \;
    find . -type d -exec chmod 555 {} \;
    chown -R root:root .    
}
