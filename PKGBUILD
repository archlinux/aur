# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1658.d01d8d36
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible. Git version for x86_64"
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
_llvmpkgver="_17.0.3~++20231017073422+888437e1b600-1~exp1~20231017073439.19"
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
	 '3569bbbd88bad250ad2eef4df64cb033'
	 '96f7ad8bb8ff6adcf6c44accaba7304e'
	 '86cd0da76bb495a74754e4253f372ec8'
	 '4814a0cc456917d351429b437e0706c7'
	 'faa431b65ddf90079efb1d534318ff38'
	 '88aea132b7f61f8539c9894fc7b44631'
	 '42cf311cfbd4373587782d36f10152d8'
	 '846e8ff9efd9ada3fcedfaf028773a69'
	 '9deff9f7c6cd458835d04af8342ba6d9'
	 '238aa17a8d80a94f3d158a773ee84bb6'
	 'bc7cf70c35b681ce9dc239657b659a5d'
	 'dc66a491cd5514c069d8151a37ae9e7e'
	 '7aec53ed27267b676bbff2780f914a06'
	 'c08da7958e9c055c0b7a0fd46b57cdbf'
	 'e26fe506b71021ae7a2fe9feb50c758c'
	 '99566a80ab5599db285e51c702c5bd4e'
	 'f16ef5f4ada3044f010c506783848087'
	 'a9ed91dd96a906cfafd64014f844668e'
	 '03bce229207689cefd92072d91f57f52'
	 'b4573f269d1ab0e5a2a10de55c34fa0e'
	 '7b771dcd1f56a59acbe4250c8862cecd'
	 '2949f41381d2dc006a51a09115019110'
	 '47344206a5ec215139eb262cc6e0e798'
	 '04d743bc7dacd607478d79e35ddf119a'
	 'ed804994829f1176dbe0dcb41fff8abb'
	 '271c85e30202905979d386f53ce22ce6'
	 'f661bff7d11c0a372795ad6d4ad88314'
	 '0cd44a5aae11697d996a525f1abdaace'
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
