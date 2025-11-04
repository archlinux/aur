fn main() {
    // Ensure libmujs is linked when present so libmpv symbols resolve correctly.
    if std::env::var("CARGO_CFG_TARGET_OS").as_deref() != Ok("linux") {
        return;
    }

    // Prevent the linker from dropping libmujs before libmpv references it.
    println!("cargo:rustc-link-arg=-Wl,--push-state,--no-as-needed");

    match pkg_config::Config::new().probe("mujs") {
        Ok(lib) => {
            for path in lib.link_paths {
                println!("cargo:rustc-link-search={}", path.display());
            }
            for name in lib.libs {
                println!("cargo:rustc-link-arg=-l{name}");
            }
        }
        Err(err) => {
            println!("cargo:warning=Failed to find mujs via pkg-config: {err}");
            println!("cargo:rustc-link-arg=-lmujs");
        }
    }

    println!("cargo:rustc-link-arg=-Wl,--pop-state");
}
