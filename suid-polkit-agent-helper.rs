use std::{
    env::args_os,
    os::unix::process::CommandExt,
    process::Command,
};

const HELPER: &str = "/usr/lib/polkit-1/polkit-agent-helper-1";

fn main() {
    let error = Command::new(HELPER)
        .args(args_os().skip(1))
        .exec();
    panic!("Error running {HELPER}: {error}");
}
