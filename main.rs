use std::env;
use std::fs;
use std::path::PathBuf;
use std::os::unix::process::CommandExt;
use std::process::Command;

fn main() {
    let args: Vec<String> = env::args().skip(1).collect();

    if args.is_empty() {
        print_help();
        return;
    }

    let (flags, command) = parse_args(&args);

    if command.is_empty() {
        eprintln!("Ошибка: Не указана команда запуска (%command%)");
        return;
    }

    let layer_path = "/usr/share/lsfg-manager/vulkan";
    
    let mut cmd = Command::new(&command[0]);
    if command.len() > 1 {
        cmd.args(&command[1..]);
    }

    // --- 1. Настройка окружения Vulkan ---
    setup_env_var(&mut cmd, "VK_LAYER_PATH", layer_path);
    setup_env_var(&mut cmd, "VK_INSTANCE_LAYERS", "VK_LAYER_LSFGVK_frame_generation");
    setup_env_var(&mut cmd, "STEAM_COMPAT_MOUNTS", layer_path);

    // --- 2. Настройка LSFG ---
    cmd.env("LSFGVK_ENV", "1");

    let dll_path = find_dll();
    if let Some(path) = dll_path {
        cmd.env("LSFGVK_DLL_PATH", path);
    } else {
        println!(">>> ПРЕДУПРЕЖДЕНИЕ: Lossless.dll не найден автоматически.");
    }

    if let Some(mult) = flags.multiplier {
        cmd.env("LSFGVK_MULTIPLIER", &mult);
        println!(">>> LSFG: Multiplier -> x{}", mult);
    }
    if let Some(scale) = flags.flow_scale {
        cmd.env("LSFGVK_FLOW_SCALE", &scale);
    }
    if flags.performance_mode {
        cmd.env("LSFGVK_PERFORMANCE_MODE", "1");
    }

    // --- 3. Запуск ---
    let err = cmd.exec();
    eprintln!("Критическая ошибка запуска: {}", err);
}

// --- Вспомогательные функции ---

fn setup_env_var(cmd: &mut Command, key: &str, value: &str) {
    if let Ok(old_val) = env::var(key) {
        if !old_val.is_empty() {
            cmd.env(key, format!("{}:{}", value, old_val));
            return;
        }
    }
    cmd.env(key, value);
}

fn find_dll() -> Option<String> {
    let home = env::var("HOME").ok()?;
    
    let config_path = PathBuf::from(&home).join(".config/lsfg-vk/config.toml");
    if let Ok(content) = fs::read_to_string(config_path) {
        for line in content.lines() {
            if line.trim().starts_with("dll =") {
                let parts: Vec<&str> = line.split('"').collect();
                if parts.len() > 1 {
                    return Some(parts[1].to_string());
                }
            }
        }
    }

    let steam_path = PathBuf::from(&home)
        .join(".local/share/Steam/steamapps/common/Lossless Scaling/Lossless.dll");
    if steam_path.exists() {
        return Some(steam_path.to_string_lossy().to_string());
    }

    None
}

struct LsfgFlags {
    multiplier: Option<String>,
    flow_scale: Option<String>,
    performance_mode: bool,
}

fn parse_args(args: &[String]) -> (LsfgFlags, Vec<String>) {
    let mut flags = LsfgFlags { multiplier: None, flow_scale: None, performance_mode: false };
    let mut command = Vec::new();
    let mut parsing_flags = true;

    for arg in args {
        if parsing_flags && arg.starts_with("--") {
            match arg.as_str() {
                "--x2" => flags.multiplier = Some("2".to_string()),
                "--x3" => flags.multiplier = Some("3".to_string()),
                "--x4" => flags.multiplier = Some("4".to_string()),
                "--perf" => flags.performance_mode = true,
                s if s.starts_with("--q") => {
                    if let Ok(val) = s[3..].parse::<f32>() {
                        flags.flow_scale = Some(format!("{:.2}", val / 100.0));
                    }
                }
                _ => { parsing_flags = false; command.push(arg.clone()); }
            }
        } else {
            parsing_flags = false;
            command.push(arg.clone());
        }
    }
    (flags, command)
}

fn print_help() {
    println!("LSFG Manager v2.0");
    println!("Использование: lsfg [--x2|--x3|--x4] [--qN] [--perf] %command%");
}