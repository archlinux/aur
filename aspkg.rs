use std::env;
use std::fs;
use std::path::{Path, PathBuf};

const REGISTRY_URL: &str =
    "https://raw.githubusercontent.com/ayaan511/AyaanScript--Packages/main/packages/";

fn package_dir() -> PathBuf {
    let home = env::var("HOME").expect("HOME not set");
    let user = env::var("USER").expect("USER not set");

    Path::new(&home)
        .join(".config")
        .join(user)
        .join("aspkg")
        .join("packages")
}

fn ensure_dirs() {
    let dir = package_dir();
    fs::create_dir_all(&dir).expect("Failed to create aspkg directory");
}

fn install(name: &str) {
    let dir = package_dir();
    let path = dir.join(format!("{}.aspkg", name));

    if path.exists() {
        println!("ASPkg: '{}' already installed.", name);
        return;
    }

    let url = format!("{}{}.aspkg", REGISTRY_URL, name);
    let resp = reqwest::blocking::get(&url);

    if resp.is_err() {
        println!("ASPkg ERROR: network failure");
        return;
    }

    let resp = resp.unwrap();
    if !resp.status().is_success() {
        println!("ASPkg ERROR: package not found");
        return;
    }

    let bytes = resp.bytes().unwrap();
    fs::write(&path, bytes).expect("Failed to write package");

    println!("ASPkg: installed '{}'", name);
}

fn remove(name: &str) {
    let path = package_dir().join(format!("{}.aspkg", name));

    if !path.exists() {
        println!("ASPkg: '{}' not installed.", name);
        return;
    }

    fs::remove_file(path).expect("Failed to remove package");
    println!("ASPkg: removed '{}'", name);
}

fn list() {
    let dir = package_dir();

    let entries = fs::read_dir(&dir).unwrap();
    let mut found = false;

    println!("Installed packages:");

    for entry in entries {
        let entry = entry.unwrap();
        let path = entry.path();

        if path.extension().and_then(|e| e.to_str()) == Some("aspkg") {
            println!(
                " - {}",
                path.file_stem().unwrap().to_string_lossy()
            );
            found = true;
        }
    }

    if !found {
        println!(" (none)");
    }
}

fn main() {
    // 🔒 ALWAYS ensure directories exist on startup
    ensure_dirs();

    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        println!("Usage: aspkg install|remove|list <name>");
        return;
    }

    match args[1].as_str() {
        "install" => {
            if args.len() < 3 {
                println!("Missing package name");
                return;
            }
            install(&args[2]);
        }
        "remove" => {
            if args.len() < 3 {
                println!("Missing package name");
                return;
            }
            remove(&args[2]);
        }
        "list" => list(),
        _ => println!("Unknown command"),
    }
}
