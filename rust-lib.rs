mod atspi_support;
mod audio;
mod desktop;
mod keyboard;
mod support;

// Rust has no static destructors for cdylibs. Register a small ELF finalizer so
// an Electron/Koffi unload cannot leave the keyboard capture thread running.
#[cfg(target_os = "linux")]
#[used]
#[unsafe(link_section = ".fini_array")]
static SHUTDOWN_HELPER: extern "C" fn() = {
    extern "C" fn shutdown() {
        keyboard::stop_monitor();
    }
    shutdown
};
