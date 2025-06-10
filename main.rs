use std::{fs::{OpenOptions}, io::Write};
use clap::{self, Arg};
use libc;
use colored::Colorize;
// Here is for executing other functions
fn main() {
    match check_root() {
        true => {
            1;
        }
        false => {
            let error = format!("You are not root, please run program with sudo").red();
            println!("{}", error);
            std::process::exit(1);
        }
    }
    let matchy = clap::Command::new("thinkfan-cli")
        .version("0.2")
        .about("controlling thinkpad fan using command line tool")
        .author("rahmedi rahmedyev@gmail.com")
        .arg(
            Arg::new("set")
            .short('s')
            .long("set")
            .required(true)
            .help("set fans\nAvailable commands:\n1~7: is fan levels\nauto: automatic mode\nfull-speed: sets fan to full-speed\ndisengaged: sets fan to its maximum speed\nenable: enables fan control\ndisable: disables fan control\n\nExamples:\nthinkfan-cli -s 7\nthinkfan-cli -s disengaged")
        ).get_matches();
    let userinput = match matchy.get_one::<String>("set"){
        Some(set) => set.clone(),
        None => {
            let error = format!("Input is not valid!").red();
            eprintln!("{}", error);
            return;
        }
    };

    let commandlist= vec!["1", "2", "3", "4", "5", "6", "7", "auto", "disengaged", "full-speed", "enable", "disable"]; 

    let modified_input = match commandlist.iter().any(|cmd| userinput.starts_with(cmd)){
        true => format!("level {}", userinput),
        false => {
            let error = format!("Check your Input").red();
            eprintln!("{}", error);
            return;
        }

    };
    let inputbool = match modified_input.contains("enable") || modified_input.contains("disable"){
        true => modified_input.replace("level ", ""),
        false => modified_input.clone()
    };
    fan_level(inputbool); 
}

// We gonna check fan control file for reducing errors
fn _check_file() -> bool{
    let fan_path = "/proc/acpi/ibm/fan";
    std::path::Path::new(fan_path).exists()

}

// We interacting with control file for setting fan levels
fn fan_level(level: String){
    let fan_path_true = match _check_file() {
        true => "/proc/acpi/ibm/fan",
        false => {
            let error = format!("Error, Control file is not available").red();
            eprintln!("{}", error);
            return;
        }
    };

    let mut fan = OpenOptions::new().write(true).open(fan_path_true).expect("File is not available");

    fan.write_all(level.as_bytes()).expect("Writing error!");
}

fn check_root() -> bool{
    unsafe { libc::getuid() == 0 }
}
