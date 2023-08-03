# Maintainer: Dani Rodríguez <dani@danirod.es>
pkgname=ttf-chakra-petch
pkgver=20180824
pkgrel=1
pkgdesc="Chakra Petch is a Thai loop typeface designed using ninety straight line and forty five degree method to avoid the curves"
arch=(any)
url="https://github.com/cadsondemak/Chakra-Petch"
_commit="3fc2b8f9443f871cc431ec4feb7c1a538c30e634"
_rawurl="${url}/raw/${_commit}"
license=('OFL')
source=("$_rawurl/fonts/ChakraPetch-BoldItalic.ttf"
        "$_rawurl/fonts/ChakraPetch-Bold.ttf"
        "$_rawurl/fonts/ChakraPetch-ExtralightItalic.ttf"
        "$_rawurl/fonts/ChakraPetch-Extralight.ttf"
        "$_rawurl/fonts/ChakraPetch-Italic.ttf"
        "$_rawurl/fonts/ChakraPetch-LightItalic.ttf"
        "$_rawurl/fonts/ChakraPetch-Light.ttf"
        "$_rawurl/fonts/ChakraPetch-MediumItalic.ttf"
        "$_rawurl/fonts/ChakraPetch-Medium.ttf"
        "$_rawurl/fonts/ChakraPetch-Regular.ttf"
        "$_rawurl/fonts/ChakraPetch-SemiBoldItalic.ttf"
        "$_rawurl/fonts/ChakraPetch-SemiBold.ttf"
        "$_rawurl/OFL.txt")
sha256sums=('773c38481876143017e4fcbd7f83e14b70916d41ae1612ed38da6a7260fd847e'
            'c44620722a5fa412f54abe14f0323263f9ecc948d076f991a707476fcd48eba7'
            '984d8c235a9446f8b603512fb6f83aa86ed24b9f0dc4bd530c413e5a1f8761a4'
            '30bd60f77eab008e3e137234d1d7f71dd3f9c7f8a95684d04388be4525a99edf'
            'a3d1ee3e23d3e5dace725dae5ccb4e72f272eae8d7e7c6cf14885c4a9eb2ec5d'
            'c5589d4507800bb8d44e0943893840d1f7d9c6f98560e4aca71dfe5021bf6047'
            '007a71793288c1dbf5913e5acd90dae22b76363f07d4a029779c9ade8b9da035'
            '7e239be3b05ffed8b37d9a57b2402c6f3045e0ff37ba056f83798775afe491e5'
            '0c08fcaedf812a509037ee4246703b55ee1a834150d6b1333e680497cb76fd6f'
            'bfaff92c373d2365e33701c0fa1fa0fa2475486af77c83dbc4f8dadab5207db3'
            '6b24882d567674014aa66643c577f4fe1176c3812ecce7e17a0fb7a4bd7fae8c'
            '155c3449755f44172a1b6b565376fc2bf4ccd2ead5437079b2fef97b89f665d1'
            '13831d02389d917d22fcfa6c79f98f8acbf61d230add0e73a4d4dc5f3bfb9e56')

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF
	install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF
	install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
