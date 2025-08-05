#include <iostream>
#include <vector>
#include <string>
#include <thread>
#include <mutex>
#include <chrono>
#include <atomic>
#include <algorithm>
#include <fstream>
#include <sstream>
#include <cstring>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <fcntl.h>
#include <errno.h>
#include <signal.h>
#include <iomanip>
#include <map>

#define RESET   "\033[0m"
#define BOLD    "\033[1m"
#define RED     "\033[31m"
#define GREEN   "\033[32m"
#define YELLOW  "\033[33m"
#define BLUE    "\033[34m"
#define MAGENTA "\033[35m"
#define CYAN    "\033[36m"
#define WHITE   "\033[37m"
#define GRAY    "\033[90m"

enum Lang { EN, RU };

struct Strings {
    Lang lang;
    std::string banner_title;
    std::string banner_sub;
    std::string usage;
    std::string host;
    std::string ports;
    std::string type;
    std::string performance;
    std::string threads;
    std::string timeout;
    std::string delay;
    std::string special_ports;
    std::string top_ports;
    std::string all_ports;
    std::string output_opts;
    std::string verbose;
    std::string save;
    std::string format;
    std::string no_ping;
    std::string no_progress;
    std::string service_detection;
    std::string examples;
    std::string host_accessible;
    std::string resolving;
    std::string start_scan;
    std::string scanning;
    std::string progress;
    std::string results_title;
    std::string scan_type;
    std::string total_ports;
    std::string open_ports;
    std::string open_ports_header;
    std::string no_open_ports;
    std::string saved;
    std::string completed_in;
    std::string error_host;
};

Strings make_strings(Lang l) {
    if (l == EN) {
        return {
            EN,
            "KoteyScanner v1.0",
            "Multifunctional port scanner",
            "Usage:",
            "Host:",
            "Ports:",
            "Type:",
            "Performance:",
            "Threads:",
            "Timeout:",
            "Delay:",
            "Special ports:",
            "Top ports:",
            "All ports:",
            "Output/options:",
            "Verbose",
            "Save",
            "Format:",
            "No ping",
            "No progress",
            "Service detection",
            "Examples:",
            "✓ Host reachable:",
            "Resolving target...",
            "Starting scan...",
            "Scanning",
            "Progress",
            "SCAN RESULTS",
            "Scan type:",
            "Total ports checked:",
            "Open ports:",
            "Open ports:",
            "No open ports found",
            "Results saved to",
            "Scan completed in"
        };
    } else {
        return {
            RU,
            "KoteyScanner v1.0",
            "Многофункциональный порт-сканер",
            "Использование:",
            "Хост:",
            "Порты:",
            "Тип:",
            "Производительность:",
            "Потоков:",
            "Таймаут:",
            "Задержка:",
            "Специальные порты:",
            "Топ портов:",
            "Все порты:",
            "Вывод и опции:",
            "Подробный вывод",
            "Сохранить",
            "Формат:",
            "Не пинговать",
            "Без прогресса",
            "Определение сервисов на портах",
            "Примеры:",
            "✓ Хост доступен:",
            "Проверка доступности хоста...",
            "Начинаем сканирование...",
            "Сканирование",
            "Прогресс",
            "РЕЗУЛЬТАТЫ СКАНИРОВАНИЯ",
            "Тип сканирования:",
            "Всего портов проверено:",
            "Открытых портов:",
            "Открытые порты:",
            "Открытые порты не найдены",
            "Результаты сохранены в",
            "Сканирование завершено за"
        };
    }
}

class KoteyScanner {
private:
    std::string target_host;
    std::vector<int> ports;
    std::string scan_type;
    int thread_count;
    int timeout_ms;
    int delay_ms;
    bool verbose;
    bool no_ping;
    bool show_progress;
    bool service_detection;
    std::string output_file;
    std::string format;
    Lang lang_flag;
    Strings S;

    std::mutex output_mutex;
    std::atomic<int> completed_scans{0};
    std::atomic<int> total_scans{0};
    std::vector<std::pair<int, std::string>> open_ports;
    std::mutex ports_mutex;

    std::vector<int> top_ports = {
        21, 22, 23, 25, 53, 80, 110, 111, 135, 139, 143, 443, 993, 995, 1723, 3306, 3389, 5432, 5900, 6000
    };

    std::map<int, std::string> known_services = {
        {21, "FTP"}, {22, "SSH"}, {23, "Telnet"}, {25, "SMTP"}, {53, "DNS"},
        {80, "HTTP"}, {110, "POP3"}, {143, "IMAP"}, {443, "HTTPS"}, {993, "IMAPS"},
        {995, "POP3S"}, {3306, "MySQL"}, {3389, "RDP"}, {5432, "PostgreSQL"}, {5900, "VNC"}
    };

    struct sockaddr_in target_addr;
    bool resolved = false;

public:
    KoteyScanner() : thread_count(50), timeout_ms(3000), delay_ms(0),
    verbose(false), no_ping(false), show_progress(true),
    service_detection(false), format("text"), lang_flag(EN),
    S(make_strings(EN)) {
        memset(&target_addr, 0, sizeof(target_addr));
    }

    void print_banner() {
        std::cout << CYAN << BOLD;
        std::cout << "    /\\_/\\  " << std::endl;
        std::cout << "   ( o.o ) " << std::endl;
        std::cout << "    > ^ <  " << std::endl;
        std::cout << RESET << std::endl;
        std::cout << BOLD << BLUE << "╔══════════════════════════════════════╗" << std::endl;
        std::cout << "║            " << CYAN << S.banner_title << BLUE << "            ║" << std::endl;
        std::cout << "║      " << GRAY << S.banner_sub << BLUE << "      ║" << std::endl;
        std::cout << "╚══════════════════════════════════════╝" << RESET << std::endl;
        std::cout << std::endl;
    }

    void print_help() {
        std::cout << BOLD << S.usage << RESET << " koteyscanner [options]" << std::endl << std::endl;
        std::cout << BOLD << YELLOW << S.host << RESET << " HOST        " << S.banner_sub << std::endl;
        std::cout << "  " << GREEN << "-h, --host" << RESET << " HOST        " << S.host << std::endl;
        std::cout << "  " << GREEN << "-p, --ports" << RESET << " PORTS      " << S.ports << std::endl;
        std::cout << "  " << GREEN << "-t, --type" << RESET << " TYPE        " << S.type << std::endl;
        std::cout << "  " << GREEN << "--lang" << RESET << " en/ru      Language selection" << std::endl;
        std::cout << std::endl;
        std::cout << BOLD << YELLOW << S.performance << RESET << std::endl;
        std::cout << "  " << GREEN << "--threads" << RESET << " N           " << S.threads << std::endl;
        std::cout << "  " << GREEN << "--timeout" << RESET << " MS          " << S.timeout << std::endl;
        std::cout << "  " << GREEN << "--delay" << RESET << " MS            " << S.delay << std::endl;
        std::cout << std::endl;
        std::cout << BOLD << YELLOW << S.special_ports << RESET << std::endl;
        std::cout << "  " << GREEN << "--top-ports" << RESET << " N         " << S.top_ports << std::endl;
        std::cout << "  " << GREEN << "--all-ports" << RESET << "           " << S.all_ports << std::endl;
        std::cout << std::endl;
        std::cout << BOLD << YELLOW << S.output_opts << RESET << std::endl;
        std::cout << "  " << GREEN << "-v, --verbose" << RESET << "         " << S.verbose << std::endl;
        std::cout << "  " << GREEN << "-o, --output" << RESET << " FILE      " << S.save << std::endl;
        std::cout << "  " << GREEN << "--format" << RESET << " FORMAT      " << S.format << std::endl;
        std::cout << "  " << GREEN << "--no-ping" << RESET << "            " << S.no_ping << std::endl;
        std::cout << "  " << GREEN << "--no-progress" << RESET << "         " << S.no_progress << std::endl;
        std::cout << "  " << GREEN << "--service-detection" << RESET << "  " << S.service_detection << std::endl;
        std::cout << std::endl;
        std::cout << BOLD << S.examples << RESET << std::endl;
        std::cout << "  " << CYAN << "koteyscanner -h google.com -p 80,443 -t TCP --lang en" << RESET << std::endl;
        std::cout << "  " << CYAN << "koteyscanner -h 192.168.1.1 --top-ports 100 --threads 100 --lang ru" << RESET << std::endl;
        std::cout << "  " << CYAN << "koteyscanner -h example.com -p 1-1000 -t HTTP -o results.json --format json" << RESET << std::endl;
        std::cout << std::endl;
    }

    bool parse_args(int argc, char* argv[]) {
        for (int i = 1; i < argc; i++) {
            std::string arg = argv[i];
            if (arg == "-h" || arg == "--host") {
                if (i + 1 < argc) target_host = argv[++i];
                else { std::cerr << RED << "Error: host not specified" << RESET << std::endl; return false; }
            }
            else if (arg == "-p" || arg == "--ports") {
                if (i + 1 < argc) parse_ports(argv[++i]);
                else { std::cerr << RED << "Error: ports not specified" << RESET << std::endl; return false; }
            }
            else if (arg == "-t" || arg == "--type") {
                if (i + 1 < argc) scan_type = argv[++i];
                else { std::cerr << RED << "Error: scan type not specified" << RESET << std::endl; return false; }
            }
            else if (arg == "--threads") {
                if (i + 1 < argc) thread_count = std::stoi(argv[++i]);
            }
            else if (arg == "--timeout") {
                if (i + 1 < argc) timeout_ms = std::stoi(argv[++i]);
            }
            else if (arg == "--delay") {
                if (i + 1 < argc) delay_ms = std::stoi(argv[++i]);
            }
            else if (arg == "--top-ports") {
                if (i + 1 < argc) {
                    int n = std::stoi(argv[++i]);
                    ports.clear();
                    for (int j = 0; j < std::min(n, (int)top_ports.size()); j++) {
                        ports.push_back(top_ports[j]);
                    }
                }
            }
            else if (arg == "--all-ports") {
                ports.clear();
                for (int port = 1; port <= 65535; port++) {
                    ports.push_back(port);
                }
            }
            else if (arg == "-v" || arg == "--verbose") {
                verbose = true;
            }
            else if (arg == "-o" || arg == "--output") {
                if (i + 1 < argc) output_file = argv[++i];
            }
            else if (arg == "--format") {
                if (i + 1 < argc) format = argv[++i];
            }
            else if (arg == "--no-ping") {
                no_ping = true;
            }
            else if (arg == "--no-progress") {
                show_progress = false;
            }
            else if (arg == "--service-detection") {
                service_detection = true;
            }
            else if (arg == "--lang") {
                if (i + 1 < argc) {
                    std::string l = argv[++i];
                    if (l == "ru") lang_flag = RU;
                    else lang_flag = EN;
                    S = make_strings(lang_flag);
                }
            }
            else if (arg == "--help") {
                print_help();
                return false;
            }
        }
        if (target_host.empty()) {
            std::cerr << RED << (lang_flag == EN ? "Error: target host not specified (-h)" : "Ошибка: Не указан целевой хост (-h)") << RESET << std::endl;
            return false;
        }
        if (ports.empty()) {
            for (int i = 0; i < 20 && i < top_ports.size(); i++) {
                ports.push_back(top_ports[i]);
            }
        }
        if (scan_type.empty()) {
            scan_type = "TCP";
        }
        return true;
    }

    void parse_ports(const std::string& port_string) {
        ports.clear();
        std::stringstream ss(port_string);
        std::string token;
        while (std::getline(ss, token, ',')) {
            size_t dash_pos = token.find('-');
            if (dash_pos != std::string::npos) {
                int start = std::stoi(token.substr(0, dash_pos));
                int end = std::stoi(token.substr(dash_pos + 1));
                for (int port = start; port <= end; port++) ports.push_back(port);
            } else {
                ports.push_back(std::stoi(token));
            }
        }
    }

    bool resolve_target() {
        if (resolved) return true;
        struct addrinfo hints;
        struct addrinfo* res = nullptr;
        memset(&hints, 0, sizeof(hints));
        hints.ai_family = AF_INET;
        hints.ai_socktype = SOCK_STREAM;
        int err = getaddrinfo(target_host.c_str(), nullptr, &hints, &res);
        if (err != 0 || res == nullptr) {
            std::cerr << RED << "✗ " << (lang_flag == EN ? "Failed to resolve host:" : "Не удалось разрешить имя хоста:") << " " << target_host << RESET << std::endl;
            if (res) freeaddrinfo(res);
            return false;
        }
        struct sockaddr_in* addr_in = (struct sockaddr_in*)res->ai_addr;
        target_addr = *addr_in;
        resolved = true;
        freeaddrinfo(res);
        return true;
    }

    bool ping_host() {
        if (no_ping) return true;
        std::cout << GRAY << S.resolving << RESET << std::endl;
        if (!resolve_target()) return false;
        std::cout << GREEN << S.host_accessible << " " << target_host << RESET << std::endl;
        return true;
    }

    bool tcp_scan(int port) {
        int sock = socket(AF_INET, SOCK_STREAM, 0);
        if (sock < 0) return false;
        fcntl(sock, F_SETFL, O_NONBLOCK);
        struct sockaddr_in addr = target_addr;
        addr.sin_port = htons(port);
        int result = connect(sock, (struct sockaddr*)&addr, sizeof(addr));
        if (result < 0 && errno == EINPROGRESS) {
            fd_set write_fds;
            FD_ZERO(&write_fds);
            FD_SET(sock, &write_fds);
            struct timeval timeout;
            timeout.tv_sec = timeout_ms / 1000;
            timeout.tv_usec = (timeout_ms % 1000) * 1000;
            int select_result = select(sock + 1, nullptr, &write_fds, nullptr, &timeout);
            if (select_result > 0) {
                int sock_error = 0;
                socklen_t len = sizeof(sock_error);
                if (getsockopt(sock, SOL_SOCKET, SO_ERROR, &sock_error, &len) < 0) {
                    close(sock);
                    return false;
                }
                close(sock);
                return sock_error == 0;
            } else {
                close(sock);
                return false;
            }
        }
        bool success = (result == 0);
        close(sock);
        return success;
    }

    std::string get_service_banner(int port) {
        if (!service_detection) return "";
        int sock = socket(AF_INET, SOCK_STREAM, 0);
        if (sock < 0) return "";
        struct sockaddr_in addr = target_addr;
        addr.sin_port = htons(port);
        struct timeval tv;
        tv.tv_sec = 2;
        tv.tv_usec = 0;
        setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
        setsockopt(sock, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
        if (connect(sock, (struct sockaddr*)&addr, sizeof(addr)) == 0) {
            char buffer[1024] = {0};
            int bytes = recv(sock, buffer, sizeof(buffer) - 1, 0);
            close(sock);
            if (bytes > 0) {
                buffer[bytes] = '\0';
                std::string banner(buffer);
                banner.erase(std::remove(banner.begin(), banner.end(), '\n'), banner.end());
                banner.erase(std::remove(banner.begin(), banner.end(), '\r'), banner.end());
                if (banner.size() > 50) banner = banner.substr(0, 50);
                return banner;
            }
        }
        close(sock);
        return "";
    }

    void scan_port(int port) {
        bool is_open = false;
        std::string service_name;
        std::string banner;
        if (scan_type == "TCP" || scan_type == "HTTP" || scan_type == "HTTPS") {
            is_open = tcp_scan(port);
        }
        if (is_open) {
            if (known_services.find(port) != known_services.end()) {
                service_name = known_services[port];
            }
            banner = get_service_banner(port);
            std::lock_guard<std::mutex> lock(ports_mutex);
            open_ports.emplace_back(port, service_name + (banner.empty() ? "" : " (" + banner + ")"));
            if (verbose) {
                std::lock_guard<std::mutex> output_lock(output_mutex);
                std::cout << GREEN << "✓ " << target_host << ":" << port << " open";
                if (!service_name.empty()) std::cout << " [" << service_name << "]";
                if (!banner.empty()) std::cout << " - " << GRAY << banner << RESET;
                std::cout << RESET << std::endl;
            }
        } else if (verbose) {
            std::lock_guard<std::mutex> output_lock(output_mutex);
            std::cout << RED << "✗ " << target_host << ":" << port << " closed" << RESET << std::endl;
        }
        completed_scans++;
        if (delay_ms > 0) std::this_thread::sleep_for(std::chrono::milliseconds(delay_ms));
    }

    void show_progress_bar() {
        const std::vector<char> spinner = {'|', '/', '-', '\\'};
        size_t spin_idx = 0;
        while (completed_scans < total_scans) {
            int current = completed_scans.load();
            int total = total_scans.load();
            if (total == 0) {
                std::this_thread::sleep_for(std::chrono::milliseconds(100));
                continue;
            }
            int progress = (current * 100) / total;
            int bar_width = 40;
            int filled = (progress * bar_width) / 100;
            std::ostringstream oss;
            oss << "\r" << BLUE << S.progress << ": [";
            for (int i = 0; i < bar_width; i++) {
                if (i < filled) oss << "█";
                else oss << "░";
            }
            oss << "] " << progress << "% (" << current << "/" << total << ") " << spinner[spin_idx % spinner.size()] << RESET;
            std::cout << oss.str();
            std::cout.flush();
            spin_idx++;
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }
        std::cout << std::endl;
    }

    void print_results() {
        std::cout << std::endl;
        std::cout << BOLD << CYAN << "╔══════════════════════════════════════╗" << std::endl;
        std::cout << "║            " << S.results_title << "            ║" << std::endl;
        std::cout << "╚══════════════════════════════════════╝" << RESET << std::endl << std::endl;
        std::cout << BOLD << (lang_flag == EN ? "Host: " : "Хост: ") << RESET << CYAN << target_host << RESET << std::endl;
        std::cout << BOLD << (lang_flag == EN ? "Scan type: " : S.scan_type) << RESET << YELLOW << scan_type << RESET << std::endl;
        std::cout << BOLD << (lang_flag == EN ? "Total ports checked: " : S.total_ports) << RESET << total_scans << std::endl;
        std::cout << BOLD << (lang_flag == EN ? "Open ports: " : S.open_ports) << RESET << GREEN << open_ports.size() << RESET << std::endl << std::endl;
        if (!open_ports.empty()) {
            std::cout << BOLD << GREEN << S.open_ports_header << RESET << std::endl;
            std::cout << std::string(50, '-') << std::endl;
            for (const auto& port_info : open_ports) {
                std::cout << GREEN << "  " << std::setw(5) << port_info.first << RESET;
                if (!port_info.second.empty()) {
                    std::cout << "  " << BLUE << port_info.second << RESET;
                }
                std::cout << std::endl;
            }
        } else {
            std::cout << YELLOW << S.no_open_ports << RESET << std::endl;
        }
        std::cout << std::endl;
    }

    void save_results() {
        if (output_file.empty()) return;
        std::ofstream file(output_file);
        if (!file.is_open()) {
            std::cerr << RED << "Error: cannot create file " << output_file << RESET << std::endl;
            return;
        }
        if (format == "json") {
            file << "{\n";
            file << "  \"host\": \"" << target_host << "\",\n";
            file << "  \"scan_type\": \"" << scan_type << "\",\n";
            file << "  \"total_ports\": " << total_scans << ",\n";
            file << "  \"open_ports\": [\n";
            for (size_t i = 0; i < open_ports.size(); i++) {
                file << "    {\n";
                file << "      \"port\": " << open_ports[i].first << ",\n";
                file << "      \"service\": \"" << open_ports[i].second << "\"\n";
                file << "    }";
                if (i < open_ports.size() - 1) file << ",";
                file << "\n";
            }
            file << "  ]\n";
            file << "}\n";
        } else if (format == "csv") {
            file << "port,service\n";
            for (const auto& port_info : open_ports) {
                file << port_info.first << ",\"" << port_info.second << "\"\n";
            }
        } else {
            file << (lang_flag == EN ? "Scan results for " : "Результаты сканирования для ") << target_host << "\n";
            file << (lang_flag == EN ? "Type: " : "Тип: ") << scan_type << "\n";
            file << (lang_flag == EN ? "Total ports: " : "Всего портов: ") << total_scans << "\n";
            file << (lang_flag == EN ? "Open ports: " : "Открытых портов: ") << open_ports.size() << "\n\n";
            for (const auto& port_info : open_ports) {
                file << port_info.first << " - " << port_info.second << "\n";
            }
        }
        file.close();
        std::cout << GREEN << S.saved << " " << output_file << RESET << std::endl;
    }

    void run_scan() {
        if (!ping_host()) return;
        total_scans = ports.size();
        completed_scans = 0;
        std::cout << BOLD << S.start_scan << RESET << std::endl;
        std::cout << (lang_flag == EN ? "Host: " : "Хост: ") << CYAN << target_host << RESET << std::endl;
        std::cout << (lang_flag == EN ? "Ports: " : "Портов: ") << YELLOW << total_scans << RESET << std::endl;
        std::cout << (lang_flag == EN ? "Threads: " : "Потоков: ") << MAGENTA << thread_count << RESET << std::endl;
        std::cout << (lang_flag == EN ? "Type: " : "Тип: ") << GREEN << scan_type << RESET << std::endl << std::endl;
        auto start_time = std::chrono::high_resolution_clock::now();
        std::vector<std::thread> threads;
        std::thread progress_thread;
        bool progress_started = false;
        if (show_progress) {
            progress_thread = std::thread(&KoteyScanner::show_progress_bar, this);
            progress_started = true;
        }
        std::atomic<size_t> port_index{0};
        int actual_threads = std::min(thread_count, (int)ports.size());
        for (int t = 0; t < actual_threads; t++) {
            threads.emplace_back([this, &port_index]() {
                size_t idx;
                while ((idx = port_index.fetch_add(1)) < ports.size()) {
                    scan_port(ports[idx]);
                }
            });
        }
        for (auto& thread : threads) thread.join();
        if (progress_started && progress_thread.joinable()) progress_thread.join();
        auto end_time = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::seconds>(end_time - start_time);
        print_results();
        save_results();
        std::cout << GRAY << S.completed_in << " " << duration.count() << " " << (lang_flag == EN ? "seconds" : "секунд") << RESET << std::endl;
    }
};

int main(int argc, char* argv[]) {
    signal(SIGPIPE, SIG_IGN);
    KoteyScanner scanner;
    scanner.print_banner();
    if (argc == 1) {
        scanner.print_help();
        return 0;
    }
    if (!scanner.parse_args(argc, argv)) {
        return 1;
    }
    scanner.run_scan();
    return 0;
}
