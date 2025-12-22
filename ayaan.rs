use std::collections::HashMap;
use std::env;
use std::fs;
use std::io::{self, Write};
use std::net::TcpListener;
use std::path::{Path, PathBuf};
use std::thread;

type Vars = HashMap<String, i64>;

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
    fs::create_dir_all(package_dir()).expect("Failed to create aspkg directory");
}

/* =========================
   SERVER (BLOCKING)
   ========================= */

fn run_server_blocking(port: u16, body: String) {
    let addr = format!("127.0.0.1:{}", port);
    let listener = TcpListener::bind(&addr).expect("Failed to bind server");

    println!("Server running at http://{}", addr);
    println!("Type 'exit' and press Enter to stop the server.");

    // Spawn server thread
    let handle = thread::spawn(move || {
        for stream in listener.incoming() {
            if let Ok(mut stream) = stream {
                let response = format!(
                    "HTTP/1.1 200 OK\r\nContent-Length: {}\r\n\r\n{}",
                    body.len(),
                    body
                );
                let _ = stream.write_all(response.as_bytes());
            }
        }
    });

    // BLOCK here until user types "exit"
    let mut input = String::new();
    loop {
        input.clear();
        io::stdin().read_line(&mut input).unwrap();
        if input.trim() == "exit" {
            break;
        }
    }

    println!("Server stopped.");
    drop(handle);
}

/* =========================
   INTERPRETER
   ========================= */

fn execute(
    line: &str,
    vars: &mut Vars,
    server_cfg: &mut Option<(u16, String)>
) -> bool {
    let line = line.trim();
    if line.is_empty() || line.starts_with(":") {
        return true;
    }

    if line == "exit" {
        return false;
    }

    if let Some(t) = line.strip_prefix("psyska -/ ") {
        println!("{}", t.trim_matches('"'));
        return true;
    }

    if line.starts_with("set ") {
        let parts: Vec<&str> = line[4..].split('=').collect();
        if parts.len() == 2 {
            vars.insert(parts[0].trim().into(), parts[1].trim().parse().unwrap_or(0));
        }
        return true;
    }

    if line.starts_with("add ") {
        let parts: Vec<&str> = line[4..].split(',').collect();
        if parts.len() == 2 {
            let v = vars.entry(parts[0].trim().into()).or_insert(0);
            *v += parts[1].trim().parse::<i64>().unwrap_or(0);
        }
        return true;
    }

    if line.starts_with("asknum ") {
        let var = line[7..].trim();
        print!("{} = ", var);
        io::stdout().flush().unwrap();
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        vars.insert(var.into(), input.trim().parse().unwrap_or(0));
        return true;
    }

    if line == "pause" {
        let mut s = String::new();
        io::stdin().read_line(&mut s).unwrap();
        return true;
    }

    if let Some(t) = line.strip_prefix("reverse ") {
        println!("{}", t.trim_matches('"').chars().rev().collect::<String>());
        return true;
    }

    if let Some(t) = line.strip_prefix("uppercase ") {
        println!("{}", t.trim_matches('"').to_uppercase());
        return true;
    }

    if line.starts_with("serport =") {
        let port = line[9..].trim().parse().unwrap_or(3000);
        *server_cfg = Some((port, String::new()));
        return true;
    }

    if let Some(t) = line.strip_prefix("serve ") {
        if let Some((_, ref mut body)) = server_cfg {
            *body = t.trim_matches('"').to_string();
        }
        return true;
    }

    if let Some(t) = line.strip_prefix("servefile ") {
        if let Some((_, ref mut body)) = server_cfg {
            *body = fs::read_to_string(t.trim_matches('"')).unwrap_or_default();
        }
        return true;
    }

    if line == "end" {
        if let Some((port, body)) = server_cfg.take() {
            run_server_blocking(port, body);
        }
        return true;
    }

    if let Some(pkg) = line.strip_prefix("asport ") {
        let path = package_dir().join(format!("{}.aspkg", pkg.trim()));
        if path.exists() {
            let data = fs::read_to_string(path).unwrap();
            for l in data.lines() {
                if !execute(l, vars, server_cfg) {
                    break;
                }
            }
        } else {
            println!("ASPkg '{}' not installed.", pkg.trim());
        }
        return true;
    }

    println!("Unknown command: {}", line);
    true
}

/* =========================
   MAIN
   ========================= */

fn main() {
    ensure_dirs();

    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("Usage: ayaan <file.ayaan>");
        return;
    }

    let script = fs::read_to_string(&args[1]).expect("Failed to read file");
    let mut vars = Vars::new();
    let mut server_cfg = None;

    for line in script.lines() {
        if !execute(line, &mut vars, &mut server_cfg) {
            break;
        }
    }
}
