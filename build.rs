fn main() {
    napi_build::setup();
    println!("cargo:rustc-link-lib=atspi");
    println!("cargo:rustc-link-lib=gobject-2.0");
    println!("cargo:rustc-link-lib=glib-2.0");
}
