fn main() {
  println!("cargo:rustc-link-search=native=/usr/lib");
  println!("cargo:rustc-link-lib=dylib=mimalloc");
}
