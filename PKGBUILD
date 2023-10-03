# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-git
_pkgname=c3c
pkgver=r1619.757a5b58
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
_llvmpkgver="_17.0.2~++20230929073219+098e653a5bed-1~exp1~20230929073233.12"
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
	 '742226469d162aa792fb8e53594c3a5b'
	 '578a29cd8f02099cbefbe0088d12162a'
	 '8d754ed24ef8da73edb94b2b76db9c72'
	 'ba5cc7412d9b4b0c478dcbb35ea5129a'
	 '51b3f26d787e17cfe21f997024eb1017'
	 '4cd83e177dc6ad49fd53d449076f2d93'
	 '6cdcb724f5580a2d44cbf13ca0e2826b'
	 '4cc6fdcb27c7c09f5c266e41260aee2b'
	 '5b40d4b05750611974199676a833ff96'
	 'e29b798bb37bd44e785d6cdef93584cd'
	 'a20f4380f990249b9677d7fb5d2ddd5c'
	 'dc66a491cd5514c069d8151a37ae9e7e'
	 '5625b735e1a969f1846227d1920b652e'
	 'f493a2a0b715158300690c560e8a0bc1'
	 '8de57ea70b4b3126dfe81b7780c749a3'
	 'e76c4752697ab442f20d466f6f7ed719'
	 'db636d03f0daf4130f4659c2a21db5e5'
	 '0b98fde20fc5dd19acd8496ce12ebf6f'
	 '6c21b242d3b549aaaa4f2dcd2d1db921'
	 'a4e3bd45818a928ccb86db011e507d9a'
	 'ae28cfa17617837fc39df59b74d78d81'
	 'd443c3da620f422d903927ee89cc65c3'
	 'd942317c9485a27ce5ad5a282644070a'
	 '6d7c3b6f411953d5254bcc0ea6a19193'
	 '80b66662f9ebed3e8166c2671bd04277'
	 'f47356cf7ab7b895c976b90fe8b80461'
	 'a5ef91d61812d60a3a802a6ad0e09c35'
	 '9d9fe502b0c99d57e7cd5962bd9c229b'
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
