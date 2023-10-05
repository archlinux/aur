# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1620.4cc30c0d
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible"
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
license=('LGPL3' 'MIT')
depends=()
makedepends=('binutils' 'tar' 'ninja' 'git' 'cmake' 'libbsd')
provides=(c3c)
conflicts=(c3c)

_repository="https://apt.llvm.org/mantic/"
_llvmrep="17"
_llvmver="17"
_llvmpkgver="_17.0.2~++20231003073140+b2417f51dbbd-1~exp1~20231003073233.15"
source=('git+https://github.com/c3lang/c3c.git'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/clang-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++abi1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libc++abi-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang1-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-common-'${_llvmver}'-dev'${_llvmpkgver}'_all.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-cpp'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-cpp'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libclang-rt-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	'https://launchpad.net/ubuntu/+archive/primary/+files/libedit2_3.1-20221030-2_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/liblld-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/liblld-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libllvm'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libllvm-'${_llvmver}'-ocaml-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libmlir-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libmlir-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libomp-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libomp5-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/libpolly-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/lld-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-dev'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-linker-tools'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-runtime'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/llvm-'${_llvmver}'-tools'${_llvmpkgver}'_amd64.deb'
	${_repository}'pool/main/l/llvm-toolchain-'${_llvmrep}'/mlir-'${_llvmver}'-tools'${_llvmpkgver}'_amd64.deb'
       )
md5sums=('SKIP'
	 '87eaa673c4437980292968e7e08dd3d3'
	 'ac20b64169db25aeb5d1905010320cc4'
	 'e71146cad86c9ba1f9a19df0d88bb5a8'
	 '2943477dab99d478901be269831aef8f'
	 '65c0ebd1fc4e847e80b70751e97f05cc'
	 '19040b2e9fa0eeadfd4aa5d9ed06f81b'
	 'ae788f1820a704fe4095e7033c530c7a'
	 '4281f42d4f2ff6b5d5c3d42db08d0a23'
	 '870f2040b630de04e5e7f5200ae357c0'
	 'e31ead287464bd3dd2c933f9ede0d22c'
	 '1a93bfb7485566f691eb0f35dd2a26a8'
	 'dc66a491cd5514c069d8151a37ae9e7e'
	 'a3025e4a60f980764a7095b8410b7eee'
	 '0ad16be5d580a946e639f5ab556e7ef0'
	 '8bddc106a4ea42b9c620e54e2fe59491'
	 '59aeedf6c62c348006133d445419ef8b'
	 'c4b29f7372db02760d880374048caa2d'
	 '87b62789bc40f3fb59c75c9b931bf454'
	 '7f0325c3e5cd7871da93089147cfa7f0'
	 '75dbdebeef9874db326b42a34184bf04'
	 '8ad38f68b5fbe2a1535649a8ca0d2088'
	 '640a7f4630544911e11521fedfc7737c'
	 'f621c49e76a15ee2adf8b7c520c94c04'
	 'a07814c9c9bf8339bd1cfefb1d38a619'
	 'c4d85262801c7ee899217d4ad3e8c6cc'
	 '965ede053b02aac8d30604ac4f77a4a9'
	 '0d1b14bb096bb8a1407962c6ec8da7a2'
	 '002ac420aa53b074f27d66d7b282a4de'
	)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/"
	for i in $(/bin/ls *.deb); do
	    ar p $i data.tar.zst | tar --use-compress-program=unzstd -x ;
	done
}

build() {
	cd "${srcdir}/${_pkgname}"
	export LD_LIBRARY_PATH=`readlink -e ${srcdir}/usr/lib/x86_64-linux-gnu`:${LD_LIBRARY_PATH}
	export PATH=`readlink -e ${srcdir}/usr/bin`:${PATH}
	cmake -B build \
              -G Ninja \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_C_COMPILER=clang-${_llvmver} \
              -DCMAKE_CXX_COMPILER=clang++-${_llvmver} \
              -DCMAKE_LINKER=lld-link-${_llvmver} \
              -DCMAKE_OBJCOPY=llvm-objcopy-${_llvmver} \
              -DCMAKE_STRIP=llvm-strip-${_llvmver} \
              -DCMAKE_DLLTOOL=llvm-dlltool-${_llvmver} \
              -DC3_LLVM_VERSION=${_llvmver}

	cmake --build build
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/lib/${_pkgname}"

	cp "${srcdir}/${_pkgname}/build/c3c" "${pkgdir}/usr/lib/${_pkgname}/c3c"
	cp -r "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/lib/${_pkgname}/lib"
	ln -s "/usr/lib/${_pkgname}/c3c" "${pkgdir}/usr/bin/c3c"

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE_STDLIB" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_STDLIB"
}
