# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1642.db3e9c7e
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
_llvmpkgver="_17.0.3~++20231010073210+37b79e779f44-1~exp1~20231010073307.16"
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
	 '441922ea5b59119385c2d6a322921194'
	 'bd9ccf8405e1d10d1b45231eaead3961'
	 'c7ad18015c592ad9cd798cd480266b7e'
	 '0aca8e5290b353783c49c36d8c57a04b'
	 'b56185971baae8cab83b39acba3a4289'
	 '493bca0f7e56d4e84f29c2058ecbd0d4'
	 '1d1fc9a43fb7b1de90b9e636253cd38e'
	 'a11fbd529faa4dd23712d9aa69dc8902'
	 'd5fdf34bb68e3b24306ab3ebc094472b'
	 'c7f605bf8e623c5e43b0a2dd6ab6d54f'
	 '0a6e89492ed2f48816a01234874fece9'
	 'dc66a491cd5514c069d8151a37ae9e7e'
	 'ed0bd48985d33168951dca7d11d3bf72'
	 '70d7e2180ab6b8c68c33198987d3bb20'
	 'ca97a5ca906191643702de33c942d4a9'
	 'cdd825f1ea159d688d951be26df1dddd'
	 'a7a5df83dfd206f48fce4a8f07cde22b'
	 'c2942d658d0674432e73e04b7b3e3de8'
	 '04b39444d188e5576fcdad1d0110529e'
	 '399fe60a07c0ad367579a50ccf8b156b'
	 '407ca87ee865b000e5906df7a93999aa'
	 'b542dc4d0dce978ded86c1e2aca9e5b6'
	 'e23bd52cfe2a4ab283fecd2aca64bd48'
	 'e52e267ae89af0f863d970383fce3949'
	 '17d6d4a717c444a08d5622deb069be0e'
	 '4a2ff0c123d7b0d0bd153131f9176f34'
	 '19a7b50c7c3a27b8a6e1bd3b916284be'
	 '452bc265f8029f833453f63056c30ac8'
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
