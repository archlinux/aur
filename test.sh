#!/bin/bash

java_=$(source PKGBUILD && echo $java_)

if ! tmpdir=$(mktemp --directory --tmpdir graalvm-test.XXXX); then
    exit
fi
cd -- "$tmpdir" || exit
function cleanup {
    cd / || exit
    rm -rf -- "$tmpdir"
}
trap cleanup EXIT
PATH=/usr/lib/jvm/java-${java_}-graalvm/bin/:$(systemd-path search-binaries-default)

printf '%s\n' 'Testing polyglot R, JavaScript, and Java...'

cat > test.R << 'EOF'
jsPlus = eval.polyglot('js', '(function(s1, s2) { return s1 + s2; })')
rOne = 1
jvmPrint = java.type("java.lang.System")$out$println
jvmPrint(jsPlus(rOne, rOne))
EOF

rTwo=$(Rscript --polyglot --jvm test.R) || exit
if [[ $rTwo != 2 ]]; then
    printf 'expected 2, got %q\n' "$rTwo"
    exit 1
fi

printf '%s\n' 'Testing native image...'

cat > Test.java << 'EOF'
public class Test {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}
EOF
javac Test.java || exit
native-image Test > /dev/null || exit

helloWorld=$(./test) || exit
if [[ $helloWorld != 'Hello, world!' ]]; then
    printf 'expected "Hello, world!", got %q\n' "$helloWorld"
    exit 1
fi

printf '%s\n' 'Testing GraalWASM...'

PATH=$PATH:/usr/lib/emscripten

cat > hello.c << 'EOF'
#include <stdio.h>

int main() {
  printf("Hello, WASM!\n");
  return 0;
}
EOF
emcc -o hello.wasm hello.c 2>/dev/null || exit

helloWorld=$(wasm --Builtins=wasi_snapshot_preview1 hello.wasm) || exit
if [[ $helloWorld != 'Hello, WASM!' ]]; then
    printf 'expected "Hello, WASM!", got %q\n' "$helloWorld"
    exit 1
fi

printf '%s\n' 'Done.'
