pkgname=otf-rubik
pkgver=2.2.0
pkgrel=2
_commit=bfad6be1331a45f40f92868c9bfafac9b46b5fd8
pkgdesc="a sans serif font family with slightly rounded corners"
arch=("any")
url="https://github.com/googlefonts/rubik"
license=("OFL")
source=(
      "${url}/raw/${_commit}/fonts/otf/Rubik-Black.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-BlackItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Bold.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-BoldItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-ExtraBold.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-ExtraBoldItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Italic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Light.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-LightItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Medium.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-MediumItalic.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-Regular.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-SemiBold.otf"
      "${url}/raw/${_commit}/fonts/otf/Rubik-SemiBoldItalic.otf"
      "${url}/raw/${_commit}/OFL.txt"
      "${url}/raw/${_commit}/AUTHORS.txt"
      "${url}/raw/${_commit}/CONTRIBUTORS.txt"
)

sha256sums=('50b3e7139839ad56e313ab79715b87c8bad0f995ac5cb363a4414b33945c4932'
            'b7d71d32cd51885022b4c3f4bb3b8423b71e3b08d160b5e1fcbaf57a3e524e6a'
            '64ec7189e2eb8bce2e0a180c034197119705a32ab74f6f22f986808e84af865f'
            '69ea61f8ab4430fa51986948c35b0df5c30f2558b349970e4dde616fa1f8fdbd'
            '54100c269694befd8e10d1516d87a7de9b1723f62b9320d15f39c362e2e3ed94'
            '4c7f9325a9580c8dd5af18b5e9de6166535b925ee38041013c3daf565368ff77'
            '24350eff1b4a404adf95db47d776ae06c56db405d68a4d9bbf52a0704905c221'
            '6db6e40a3cd84753e9fd1640196eadb354cc4b16ee8fb9aeaef81324fea28f63'
            '7994899c9f6045fdc993aed0709b12ad306284ba0a6efa004e3aa3d28717840d'
            '3de81892b95022e40caaffa0541bab35f756a8a2a638919cf41c24a5c65d5ae1'
            '1da0fb0bf02bb7bd8548e6369fec98775b4088f5baf526e1044705e67428b85d'
            '02b7164476753cc109c9d90f77ee4b780ed1300a50bda94fa6a9cedabd855bc6'
            'c565835f51a9d267e8dc45489160d1d1673b6dcbad9f0fa3a5df62662cd0cdb5'
            'e457d28fe7f854a3bd1e5d9f27147e5a6a9b12ca30f96d1663646c45ceacb257'
            '472cbe7c25441df63e9c7864b43eb3c0f4b3df950c66a76224e6cfe1eae843fb'
            '7e2cf473951e887dc83a6676ab3ce19eef293cd0e5b4d15504dcc42228934576'
            'd0955625026fcda3c16cbf518486e7e272ef3a4ca86ef11daafc2892cabb59b6')

package() {
      install -d ${pkgdir}/usr/share/fonts/OTF
      install -m644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/OTF/
      cd ${srcdir}
      install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ OFL.txt AUTHORS.txt CONTRIBUTORS.txt
}
