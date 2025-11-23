<h1 align="center"> WeatherFetch 📺️ </h1>
<div align = "center">
<a href="https://t.me/ArcaneDevStudio" target="_blank" rel="noopener noreferrer">
    <img src="https://img.shields.io/badge/Telegram-@ArcaneDevStudio-blue?style=flat-square&logo=telegram" alt="Telegram">
</a>
<a href="https://github.com/Nam4ik/WeatherFetch/actions", target="_blank", rel="noopener noreferrer">
    <img src="https://github.com/Nam4ik/WeatherFetch/actions/workflows/rust.yml/badge.svg?event=push", alt="rust.yml">
</a> 
<img src="https://img.shields.io/badge/Version-v0.1-blue.svg">

<br>
<br>
  
**Written on rust fetch tool like Neofetch or FastFetch but with Weather.**
This is my pet project.I am the sole developer, so if you encounter any issues or bugs, please inform me or create a pull request. 

</div>

<h2 align="center"> Tech details 🏗️</h2>

> [!WARNING] 
> Not all of this fns can be implemented with openmeteo API 

- Uses the free open-meteo API, which requires coordinates or configuration to function properly.
- Displays images in the terminal. (WIP)
- Provides various time intervals, including daily, hourly, and minute-by-minute updates, as well as current information.
- Can send alerts. (WIP)
- In case of internet connectivity issues, it can download information from a cache.

WIP - work in progress. Its much more harder with free open-meteo API.

<h2 align="center"> Using ⛽️</h2>

>[!WARNING]
>Coordinates and an internet connection are required if cache not builded properly.
>To cache weather data you cah run `wfetch rebuild-cache`

`wfetch -h`

<h2 align = "center"> Installation 🔝</h2>

**Build from source:**
```shell 
git clone https://github.com/Nam4ik/WeatherFetch
cd WeatherFetch
cargo build -rv 
sudo mv ./target/release/wfetch /usr/local/bin
cargo clean
wfetch config && cp src/arts.yaml ~/.config/WeatherFetch/
```
And dont forget switch coords in config to your!
<br>

**Or just download release and move it to one of** `$PATH` **dirs**
