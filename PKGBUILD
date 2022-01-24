# Maintainer : Jingbei Li <i@jingbei.li>
# Contributor: Intel Corporation <http://www.intel.com/software/products/support>

pkgname=intel-oneapi-compiler
pkgver=2022.0.2
_debpkgrel=3658
pkgrel=1
pkgdesc="Intel® oneAPI Compiler"
arch=('x86_64')
url='https://software.intel.com/content/www/us/en/develop/tools/oneapi.html'
license=("custom")
source=(
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-common-2022.0.2-2022.0.2-3658_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-cpp-eclipse-cfg-2022.0.2-3658_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-common-2022.0.2-2022.0.2-3658_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-classic-fortran-shared-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-common-2022.0.2-2022.0.2-3658_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-common-2022.0.2-2022.0.2-3658_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-shared-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-dpcpp-cpp-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-openmp-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-openmp-common-2022.0.2-2022.0.2-3658_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-eclipse-cfg-2022.0.2-3658_all.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-dpcpp-cpp-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-2022.0.2-2022.0.2-3658_amd64.deb"
	"https://apt.repos.intel.com/oneapi/pool/main/intel-oneapi-compiler-fortran-runtime-2022.0.2-3658_amd64.deb"
	"${pkgname}.conf"
)
noextract=(
	"intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-fortran-common-2022.0.2-2022.0.2-3658_all.deb"
	"intel-oneapi-compiler-shared-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-cpp-eclipse-cfg-2022.0.2-3658_all.deb"
	"intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-common-2022.0.2-2022.0.2-3658_all.deb"
	"intel-oneapi-compiler-dpcpp-cpp-classic-fortran-shared-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-dpcpp-cpp-common-2022.0.2-2022.0.2-3658_all.deb"
	"intel-oneapi-compiler-fortran-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-shared-common-2022.0.2-2022.0.2-3658_all.deb"
	"intel-oneapi-compiler-shared-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-dpcpp-cpp-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-openmp-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-openmp-common-2022.0.2-2022.0.2-3658_all.deb"
	"intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-dpcpp-cpp-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-dpcpp-eclipse-cfg-2022.0.2-3658_all.deb"
	"intel-oneapi-compiler-dpcpp-cpp-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-fortran-2022.0.2-2022.0.2-3658_amd64.deb"
	"intel-oneapi-compiler-fortran-runtime-2022.0.2-3658_amd64.deb"
)
sha256sums=('c6c5ed504714d5af9b1569f1783c0eb5f69724077bb0c5221d616774772f0c09'
            'd8acfd475dacdaabbe76551d2b04c72fd5149e04043a3e12038b5cabf0891a2f'
            '8d79e2753b62c2332f401571291b64bfcf79b1425fbedd98cf7ad7150cb788cc'
            'd5d69b04121ca0ffbde1b631dcd48d2b738b8c8ccaea3b069128d643a2dbc2cd'
            '89e218c90f5b3c7579e07f0ebfafbc39d5ef21cd33acf3d8abc5e571d665a307'
            'c04452c454a642777a4305d490049f6cfeeae34f360f20e5e5e9c85862490a08'
            '4386c6575c61507e574943cfb29e5b48d9dde1928d5f28c3e168eac0dcab0a57'
            'd93e385c6377226d87e1a11e0b4c282dea7976912951680b7c217fa1d14dea4c'
            '868a829dad84f1b21262a4004086c58a680c5c09317dea15fbff14ff3dfbd3cf'
            '75a7dc5e64c8ee2c5c51a35ed833845f73c5659f509e60d3c4b4c197797abba5'
            '843ab2b12a16ab5ac2af0498474f5f97c0016f36af278d9f908ed615e3ba693d'
            'c9274339477eb7de0379c360245f9b9174edd0c1c3b25a72e7ee6d970debba57'
            'd4a7a943a2ba166e07a6a83913622af78183764acf8f4b637da572fa68a28bac'
            'd302e5ca9a67eb6fa6e97320f48e4f66bd795e7625d3e33bb986d4505a13341c'
            'a43d28e0a00c8e345970478df87d4fbe304bfe5736e87707a093642c325c10f1'
            '57bc3752fb2c9bffe0500f265547962a25e4fc29efb88e1736f1edebdedcd1b6'
            'e9a87eec4831ab0709422012e5a2530fe0b06ec7e8502502599200d618876838'
            'dd3cf666210dd3e5d6e4f691c8e8741fcfda532a51e396ca9860e53a14ce9a11'
            'df843994e4414dc035a81eac7bde27a111d0d7fb27e9b3dd644426ccc83ef250'
            'b22cbc3beeec2bb4fc72448ad4f6ffb5aa42916a65bff7484c73a1148dee59a5'
            '272e9a6015f25f777e092d5c8c4c435e08d4fe640ba7f15d09cd36e07654b83f')

build() {
	ar x "intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-fortran-common-2022.0.2-2022.0.2-3658_all.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-shared-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-cpp-eclipse-cfg-2022.0.2-3658_all.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-common-2022.0.2-2022.0.2-3658_all.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-cpp-classic-fortran-shared-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-cpp-common-2022.0.2-2022.0.2-3658_all.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-fortran-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-shared-common-2022.0.2-2022.0.2-3658_all.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-shared-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-dpcpp-cpp-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-openmp-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-openmp-common-2022.0.2-2022.0.2-3658_all.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-cpp-runtime-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-eclipse-cfg-2022.0.2-3658_all.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-dpcpp-cpp-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-fortran-2022.0.2-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz
	ar x "intel-oneapi-compiler-fortran-runtime-2022.0.2-3658_amd64.deb"
	tar xvf data.tar.xz

	rm -r opt/intel/oneapi/conda_channel
}

package() {
	depends=(
		'intel-oneapi-dpcpp-debugger=2021.5.0'
		'intel-oneapi-mpi=2021.5.1'
		'intel-oneapi-dpl=2021.6.0'
		'intel-oneapi-tbb=2021.5.1'
		'intel-oneapi-dev-utilities=2021.5.2'

		'intel-oneapi-common-vars>=2022.0.0'
		'intel-oneapi-common-licensing=2022.0.0'
	)
	mv ${srcdir}/opt ${pkgdir}
	ln -sfT "$pkgver" ${pkgdir}/opt/intel/oneapi/compiler/latest

	cd ${pkgdir}/opt/intel/oneapi/compiler/$pkgver/linux/lib
	ln -sf ./libffi.so.6.0.1 libffi.so.6.0
	ln -sf ./libffi.so.6.0 libffi.so.6

	install -Dm644 ${srcdir}/${pkgname}.conf ${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf
}
