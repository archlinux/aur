# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Free monospaced font for coding and tabular layout'
pkgname=ttf-sometype-mono
pkgver=1.000
pkgrel=2
_gitcommit=e1741b500ec74b441852451d1172f99b81100249
arch=(any)
license=(custom:OFL)
url=https://monospacedfont.com
_baseurl="https://github.com/dharmatype/Sometype-Mono/raw/${_gitcommit}"
source=("${_baseurl}/fonts/ttf/SometypeMono-Regular.ttf"
        "${_baseurl}/fonts/ttf/SometypeMono-Italic.ttf"
        "${_baseurl}/fonts/ttf/SometypeMono-Medium.ttf"
        "${_baseurl}/fonts/ttf/SometypeMono-MediumItalic.ttf"
        "${_baseurl}/fonts/ttf/SometypeMono-Bold.ttf"
        "${_baseurl}/fonts/ttf/SometypeMono-BoldItalic.ttf"
		"${_baseurl}/OFL.txt")

sha512sums=('3f32010ba08213bd7b80b99b5358ba1f4858771e7f38e0fc15d9a278944494c2fa36101f28dc9583b1387f2ae6ed929e3651f9894763cc16d227251aa4ab647d'
            'fafbf734abbaf3ddd165b52b058d03a73455a2aa3ebdce87e50f2c28f87727623180c8688c392ba1cf1b14d418e39806b3de137a8a848ada37fdb20e5de43f65'
            'b0b939b7d61ad4227ef12831ca4e700fe590a5df46d8dcf02e8c5a7810ad150547bcaf6282cd6726bf44d8eb2d16724a15a0aebff117b76a6aa2d3766d96daf2'
            '3499abd545d466a4872336b7542ddac1406235cad935e15d386ce8dc9c904bf5effea5e202843aa93a8811d23ee4e72c260c586768f0764f2d3ed3c4d0de8847'
            '9632dac0cd0de5fc0a9546d3d3d944a1b9ee8eb35a38edc7bdd8be9dbeb634d9483cd7db2c46182119df0b777ef384031b040653759e28ba3f129cf480328a60'
            'e5bcbeedef136115b7253bab3712c10ea8c47db8409cf4d0b769c82a4ee50bdb5927335dd7c439003f086c79b8ff7bf168292d908830adc7793c552838ae21eb'
            '1712cfe6775bb8cd4e75c5ba48c1861ff19b17f8bd930b07c258cd8f7883a1112e58a5a392ea275e01476ce7cf3d8e81f08d07258242e179d54d68ea7221652d')

package ()
{
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" OFL.txt
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
}
