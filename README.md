<div align="center">

<img src="netsplitter/ui/assets/icons/app_logo.svg" width="200" alt="NetSplitter Logo">

# NetSplitter

### Linux Network Namespace Isolation & QoS Framework

[![License](https://img.shields.io/badge/License-Proprietary-red.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux-blue.svg)](https://kernel.org/)
[![Python](https://img.shields.io/badge/Python-3.10+-green.svg)](https://python.org/)
[![Qt](https://img.shields.io/badge/GUI-PyQt6-41CD52.svg)](https://riverbankcomputing.com/software/pyqt/)
[![Arch](https://img.shields.io/badge/AUR-netsplitter--git-1793D1.svg)](https://aur.archlinux.org/packages/netsplitter-git)

**Physically isolate applications into dedicated Network Namespaces with hardware-level QoS tuning.**  
**Zero virtualization overhead. Zero bufferbloat. Zero FPS drops.**

*Developed by [Senqaii](https://github.com/batuh007) — Built on [CachyOS](https://cachyos.org/)*

<br>

**Languages:** [English](#english-en) | [Türkçe](#türkçe-tr) | [Español](#español-es) | [Deutsch](#deutsch-de) | [Русский](#русский-ru)

</div>

<br><a id="english-en"></a>
---


## English (EN)

*(Note: NetSplitter was specifically designed and developed on CachyOS. Behavior, dependencies, and Kernel API compatibility on other distributions such as Ubuntu, Debian, or Fedora are currently untested and unverified.)*

NetSplitter is a cutting-edge Linux Kernel networking tool that physically isolates applications into distinct Network Namespaces and applies extremely aggressive hardware-level Quality of Service (QoS). Purpose-built for competitive esports and low-latency environments, it ensures 0% Bufferbloat and absolute zero virtualization overhead.

### How It Works (The Architecture)

Unlike traditional Proxies or VPNs that induce software-level bottlenecks, NetSplitter leverages native Linux **Network Namespaces** (`ip netns`) to physically detach a NIC from the host OS and assign it exclusively to your application.

<p align="center">
  <img src="netsplitter_logo.svg" alt="NetSplitter Architecture Diagram">
</p>

1. **Network Spaces:** You can force your background downloads to route strictly via Wi-Fi, leaving your Ethernet cable 100% exclusive to *Dota 2* or *CS2*.
2. **Zero Overhead:** Because routing occurs organically at the Kernel level, there is no CPU processing cost and zero FPS drops in your game.

### Features & Usage Guide

| Feature | Description |
|---------|-------------|
| **Preset Profiles** | FPS Competitive (UDP), TCP MMO, Bufferbloat Extreme (CAKE), Download-Only |
| **Live Telemetry** | Real-time bandwidth, ping, jitter, packet loss graphs at 1000ms intervals |
| **Bufferbloat Test** | Automated A+ to F grading with idle vs loaded ping comparison |
| **Kernel Tuning** | BBR congestion control, TCP fast open, NIC offload control, IRQ pinning |
| **Multi-Language** | English, Türkçe, Deutsch, Русский, Español |
| **Persistent History** | JSON-backed test history with date-sorted analysis |
| **System Tray** | Minimize to tray with state-aware icon (idle/active/error) |

### Quick Start / How To Use

**1. Isolate an Application (Game / Download)**
- Open NetSplitter.
- In the left panel, select the application executable (e.g. `cs2.sh` or `steam`).
- In the middle panel, choose your internet adapter (e.g. `enp3s0` for Ethernet).
- Select a preset (e.g. **FPS Competitive**).
- Click **Start Isolation**. Your game is now physically separated from the rest of the system's traffic!

**2. Measure Bufferbloat (Finding the best QoS settings)**
- Navigate to the **Network Test / Bufferbloat** tab via the bottom right button.
- Select your target interface (e.g. Wi-Fi).
- Choose predefined bandwidth limits if your connection is unstable, or test at full capacity.
- Click **Start Test**. NetSplitter will download a 100MB chunk while tracking your latency. If you score an 'F', lower your bandwidth restrictors and re-test until you score an 'A+'.

#### 1. Optimization Profiles
NetSplitter ships with preset models designed to tune the Linux networking stack parameters (`sysctl`) based on the task:
- **FPS Competitive (UDP):** Modifies DSCP packets to *Expedited Forwarding (EF)*, enforces Google BBR over `fq_codel`, disables IRQ balancing, and revokes `tcp_timestamps`. Perfect for raw latency reduction.
- **TCP MMO (Safe):** Tuned for MMORPGs (like *World of Warcraft*). Implements packet loss recovery schemas to salvage dropped states spanning long sessions.
- **Bufferbloat Extreme (CAKE):** Activates the CAKE queuing algorithm on unstable networks to drastically curb ping jitter.

#### 2. Fully Automated Bufferbloat Network Test
Under the "Network Test" module, NetSplitter initiates an aggressive internal CDN saturation (simulating massive background downloads) while ICMP pinging a designated target (1.1.1.1).
- It generates a comparative grid detailing your **IDLE Ping** versus **LOADED Ping**.
- It provides a visual evaluation grade (A+ through F) allowing you to fine-tune bandwidth restriction variables to physically eliminate bufferbloat bottlenecks.

#### 3. Real-Time Telemetry & Graphics
NetSplitter includes an isolated tracking daemon executing 1000ms cycles against the raw `/sys/class/net` OS framework. 
- You get real-time graphs displaying Delta Session Bandwidth (Incoming/Outgoing Bytes).
- Real-time Jitter calculation (ms-to-ms variation) and live Packet Loss percentages dynamically scaling against standard thresholds.

#### 4. Persistent Analytics History (Logging)
Every Benchmark iteration or Bufferbloat stress test you conduct is silently appended to a lightweight local `JSON` tree inside `~/.config/netsplitter`. The "History" module renders these datasets into dual-tabbed, date-sorted tables so you can audit the impact of changing ISPs, Routers, or NICs over time.

---

## Dependencies

| Package | Purpose | Required |
|---------|---------|----------|
| `python` (≥3.10) | Runtime | ✅ Yes |
| `python-pyqt6` | GUI framework | ✅ Yes |
| `iproute2` | Network namespace management | ✅ Yes |
| `iptables` | DSCP packet marking | ✅ Yes |
| `dhcpcd` | DHCP inside namespaces | ✅ Yes |
| `ethtool` | NIC offload control | ✅ Yes |
| `polkit` | Privilege elevation | ✅ Yes |
| `mtr` | Advanced traceroute | ⚠️ Optional |

---

## Compatibility

| Distribution | Status |
|-------------|--------|
| CachyOS | ✅ Fully tested |
| Arch Linux | ✅ Supported |
| Manjaro | ⚠️ Should work (untested) |
| Fedora | ⚠️ Should work (untested) |
| Ubuntu/Debian | ⚠️ May require `dhcpcd` installation |

> **Requirements:** Linux kernel ≥ 5.15, systemd, NetworkManager or systemd-networkd

---

## Installation (All Linux Distributions)

If you are not using Arch Linux, you can directly install NetSplitter using the universal installer script:

```bash
git clone https://github.com/batuh007/-NetSplitter-.git
cd -NetSplitter-
sudo ./install.sh
```

### Arch Linux (AUR)
```bash
# Using yay
yay -S netsplitter-git

# Using paru
paru -S netsplitter-git
```

### Uninstall
```bash
sudo ./uninstall.sh
```

<div align="center">
<small>

**⚠️ DISCLAIMER OF WARRANTY AND LIABILITY ⚠️**<br>
*By downloading, compiling, or executing this software, you expressly acknowledge and agree to assume 100% of all associated risks: (1) Zero Liability: NetSplitter modifies core Linux Kernel networking stacks... The author(s) are NOT responsible for any system instability or hardware damage. (2) Game & Anti-Cheat Bans: Because this tool actively manipulates MAC tables and namespace routing, third-party Anti-Cheat systems may severely penalize this anomaly. You assume 100% of the risk for any resulting account bans. (3) No Warranties: This software is provided "AS IS", without warranty of any kind.*

</small>
</div>

---

<br><a id="türkçe-tr"></a>
## Türkçe (TR)


*(Not: NetSplitter, CachyOS üzerinde geliştirilmiş ve tasarlanmıştır. Ubuntu, Debian gibi diğer Linux dağıtımlarındaki paket ve çekirdek (kernel) uyumluluğu şu an için test edilmemiştir.)*

NetSplitter, Linux işletim sistemleri için geliştirilmiş eşi benzeri olmayan bir Uygulama İzolasyonu ve Hat Trafik Kontrol (QoS) aracıdır. Geleneksel proxy ya da VPN araçlarının aksine, doğrudan donanımla konuştuğu için uygulamalarınızı sanallaştırma olmadan fiziksel kartlara parçalar ve bufferbloat'ı sıfırlar.

### Nasıl Çalışır? (Mimari ve Alanlar)

1. **Network Namespaces (Ağ Alanları):** İşletim sistemindeki fiziksel bir ağ kartını (örneğin Ethernet) geçici olarak kendi özel alanına çeker. Oyununuz sadece bu alana kilitlenir. Arka planda tarayıcınız 10 GB dosya indirse, indirme Wi-Fi üzerinden devam ederken oyun Ethernet üzerinden %0 gecikmeyle (lag) akmaya devam eder.
2. **Kusursuz FPS:** Mantıksal paket çevirileri tamamen Çekirdek (Kernel) donanım katmanında gerçekleşir. İşlemci asgari yorulur, böylelikle oyunlarınızda tek bir kare (FPS) bile kaybetmezsiniz.

### Özellikler ve Kullanım Kılavuzu

### Hızlı Başlangıç / Nasıl Kullanılır?

**1. Bir Oyunu veya Uygulamayı İzole Etmek**
- NetSplitter'ı çalıştırın.
- Sol paneldeki listeden ayırmak istediğiniz uygulamayı bulun (Örn: `cs2.sh`, `discord` veya `steam`).
- Orta kısımdan bu uygulamanın HANGİ internet portunu kullanacağını seçin (Örn: Sadece Ethernet'ten bağlansın `enp3s0`).
- Bir profil seçin (Örn: **FPS Competitive - UDP**).
- **İzolasyonu Başlat** butonuna basın. Seçtiğiniz oyun artık Linux çekirdeğinde tamamen özel bir odaya alındı. Arka planda tarayıcıdan indirme yapsanız bile oyununuz etkilenmeyecek!

**2. Bufferbloat Testi ve Gecikme Önleme**
- Sağ alttaki "Ağ Testi (Bufferbloat)" menüsüne girin.
- Hız testini yapacağınız internet adaptörünü seçin.
- **Testi Başlat** butonuna basın. Sistem hem yüksek boyutta veri indirecek hem de pingleme yapacaktır.
- Eğer **F** notu alırsanız, bu demektir ki evde biri video izlerken pinginiz fırlayacaktır. **Bufferbloat / CAKE** profilini seçerek veya testteki Hız Sınırını 10-20 Mbps aşağı çekerek testi tekrar edin. Notunuz **A+** olana kadar (Yani boş hat ile yük altındaki hat pingi aynı olana kadar) hattınızı optimize edebilirsiniz.

#### 1. Optimizasyon Profilleri
Oynadığınız oyunun niteliğine göre Linux ağ altyapısını (`sysctl`) kökten manipüle eder:
- **FPS (UDP):** Orijinal DSCP paketlerini *Expedited Forwarding (EF)* olarak damgalar, BBR kontrolcüsünü araya sokar ve anlamsız paket zaman damgalarını (`tcp_timestamps`) fırlatıp atıp, IRQ dengelemesini kapatır. Saf ping stabilitesi arayanlar için.
- **MMO TCP (Güvenli):** WoW, FFXIV gibi uzun oturumlu oyunlardaki paket (packet loss) kayıplarını örtbas etmek ve oyuncunun sunucudan düşmesini engellemek için tasarlandı.
- **Bufferbloat / CAKE:** Dengesi bozulmuş sarsıntılı hatlar için CAKE şemalarını aktif eder.

#### 2. Tam Otomatik Bufferbloat ve Kıyaslama Testi
Ana menüdeki "**Ağ Testi**" modülü üzerinden hattınızı uçtan uca sömüren özel senaryolar başlatabilirsiniz.
- Cloudflare altyapısını kullanarak arka planda maksimum limitlerle veri indirirken aynı zamanda ICMP pinglemesi gerçekleştirir.
- Boş hattaki (IDLE) pinginiz ile Boğulmuş Hattaki (LOADED) pinginizi yan yana koyar.
- A+ ile F arasında notlandırıp hat denge kalitenizi ölçer.

#### 3. Canlı Telemetri ve Grafikler
Uygulama izole edildiği anda, saniyede bir defa (1000ms) arkaplanda telemetri okuması başlatır. 
- İndirilen ve Yüklenen anlık bant genişliklerini grafik formatında ekranınıza çizer.
- Ana sunucuya olan saf gecikmenizi, dalgalanmayı (Jitter) ve anlık Paket Kaybını dinamik standartlarla renklendirir.

#### 4. Geçmiş Log Sistemi (History)
Yapılan hiçbir ağ testi kaybolmaz. Kapalı bir veritabanı yormayacak şekilde, Linux ortamında `~/.config/netsplitter` dizinine `JSON` dökümanı olarak depolanır. Ekrandaki **Geçmiş** butonuna basarak geçmişinizi tablolardan görüntüleyebilirsiniz.

<div align="center">
<small>

*(Not: NetSplitter, CachyOS üzerinde geliştirilmiş ve tasarlanmıştır. Ubuntu, Debian gibi diğer Linux dağıtımlarındaki paket ve çekirdek (kernel) uyumluluğu şu an için test edilmemiştir.)*

**⚠️ YASAL UYARI VE SORUMLULUK REDDİ BEYANI ⚠️**<br>
*Bu yazılımı indirerek veya çalıştırarak %100 oranında sorumluluğu peşinen kabul etmiş sayılırsınız: (1) Sorumluluk Reddi: NetSplitter, Linux Çekirdeği (Kernel) seviyesine aşırı düşük seviyede müdahale eder. Oluşabilecek işletim sistemi çökmelerinden, donanım zararlarından veya kalıcı cihaz hatalarından (brick) geliştirici(ler) ASLA sorumlu tutulamaz. (2) Anti-Hile (Anti-Cheat) Yasaklamaları (Ban): Yazılım paketleri (QoS) ve ağ imzalarını aktif maniüle ettiği için donanım/hesap yasaklanmasından (Ban) tamamen kullanıcı sorumludur.*

</small>
</div>

---

<br><a id="español-es"></a>
## Español (ES)

*(Nota: NetSplitter ha sido diseñado y desarrollado en CachyOS. El comportamiento y la compatibilidad en distribuciones como Ubuntu o Debian aún no están probados ni verificados en su totalidad).*

NetSplitter es una avanzada herramienta de aislamiento de red a nivel de Kernel y gestión de QoS en Linux. Extrae tu aplicación de la tabla de host general usando espacios de red (network namespaces) para limitar recursos de hardware o asignar tarjetas físicas en específico.

### Arquitectura (Espacios - Namespaces)

- **Concepto de Aislamiento:** Puedes enrutar las descargas de fondo a través de Wi-Fi y dejar tu conexión Ethernet exclusiva para el juego (*CS2*, *WoW*, etc.) para asegurarte de evitar cruces de paquetes. Los cálculos criptográficos o puentes VPN se han descartado; por ende, asegura cero interferencia afectando el recuento de fotogramas (FPS).

### Funciones Principales
1. **Control de Latencia A+:** Los perfiles integrados reprograman las directivas `sysctl` para usar CAKE y BBR limitantes, eliminando en un 100% el fenómeno Bufferbloat provocado durante las descargas compulsivas en el hogar.
2. **Evaluación de Estabilidad Integradora:** Mide independientemente el "Ping Básico" vs el "Ping Cargado" mientras inyecta ruido de ancho de banda constante hacia y desde la red CDN. Clasifica tu ISP con puntuaciones A a F.
3. **Métricas en Tiempo Real & Historial JSON:** Monitoriza con gráficos en tiempo real las deltas en KB/s de subida y bajada. Las latencias pasadas y pruebas generadas se salvan indefinidamente en la memoria nativa y están expuestas internamente a revisiones para analizar cambios en tu router.

---

<br><a id="deutsch-de"></a>
## Deutsch (DE)

*(Hinweis: NetSplitter wurde speziell unter CachyOS entworfen und entwickelt. Das Verhalten und die Kompatibilität des System-Kernels in anderen Distributionen wie Ubuntu oder Debian sind noch in Erprobung und nicht offiziell zertifiziert).*

NetSplitter ist ein Netzwerkisolierungs-Werkzeug auf tiefer Kernel-Ebene ("Network Namespaces"), das den Ping bei Wettkampfspielen absolut niedrig hält und den gefürchteten "Bufferbloat"-Effekt zerstört.

### Architektur (Net-Spaces)

- **Mechanismus:** App-Downloads werden restriktiv auf das WLAN-Interface gezwungen, während dein Ethernet-Kabel ungeteilte Priorität für dein Spiel (*CS2* oder ähnliches) behält. Dank echter Kernel-Verwaltung bleibt der CPU im Standby – die FPS im Spiel verringern sich um 0%.

### Hauptmerkmale
1. **Profile zur Anpassung:** Du kannst die TCP-Übermittlungen und Warteschlagnen je nach Typ anpassen. Der "FPS-Modus" markiert UDP-Pakete mit Premium-Priorität auf Backbone-Ebene und senkt TSO-Latenzzeiten drastisch.
2. **Stresstest:** Ein Live-Injektionsmodul prüft deine Netzknoten, wertet die "Ping-Rate ohne Last" gegen die "Ping-Rate unter Volllast" systematisch aus und vergibt eine Qualitätsnote zur manuellen Feinanpassung.
3. **Telemetrie und Verlauf:** Analysiere den Netzwerk-Traffic durch Liniendiagramme auf Millisekundenebene. NetSplitter protokolliert unmerklich im Hintergrund (`JSON`-gestützt) ältere Netzwerkmessungen zur späteren Auswertung.

---

<br><a id="русский-ru"></a>
## Русский (RU)

*(Примечание: NetSplitter был специально разработан на платформе CachyOS. Поведение утилит и совместимость ядра в других дистрибутивах (например, Ubuntu, Debian) пока не проверены).*

NetSplitter — передовой инструмент сетевой изоляции на уровне ядра Linux и управления правилами QoS, полностью ограждающий ваш игровой трафик от влияния фоновых процессов внутри системы, чтобы исключить задержку (Bufferbloat).

### Принцип работы (Namespaces)

- **Движок пространств имён:** Перенаправляет трафик приложений жестко на выделенный адаптер (например, торрент на Wi-Fi, а игры строго по Ethernet). Так как изоляция базируется на системных ресурсах ядра («ip netns»), потребление процессорного времени (CPU) сведено к нулю, что гарантирует стабильно высокий FPS в играх.

### Ключевые возможности
1. **Профили и Регулировка (QoS):** Зашитые профили оптимизации самостоятельно устанавливают лучшие алгоритмы (CAKE, fq_codel, BBR) и отключают мешающие системные прерывания. Максимальная выгода для UDP шутеров и TCP MMO-игр. 
2. **Стресс Тест Линии:** Особый тестовый комплекс нагружает трафик симулируемой закачкой с CDN, фиксируя изменения Пинга (Idle против Loaded) и выставляя независимую оценку вашему провайдеру.
3. **Графики и Лог-архивация:** Живая лента графиков отслеживает объем загрузки в реальном времени. Все тесты на Буферблоат автоматически вносятся в базу данных истории (`JSON` отчеты), которые можно в любой момент просмотреть, нажав кнопку «История».
