use rustup::{TOOLS, DUP_TOOLS};

fn main() {
    TOOLS.iter().chain(DUP_TOOLS).for_each(|s|print!("{s} "));
}
