# include <fstream>
# include <string>
# include <set>
# include <regex>
# include <iostream>
# include <fmt/format.h>
# include <filesystem>

enum class item_type
{
    full,
    domain,
    regex
};

std::set<std::pair<std::string, item_type>> read(const std::string& filename)
{
    std::set<std::pair<std::string, item_type>> data;
    std::ifstream ins(filename);
    std::string line;
    while (std::getline(ins, line))
    {
        std::cerr << fmt::format("read {}\n", line);
        std::smatch match;
        while (std::regex_match(line, match, std::regex(R"(^(.*)[@#].*$)")))
            line = match[1].str();
        if (std::regex_match(line, match, std::regex(R"(^\s*(\S*)\s*$)")))
            line = match[1].str();
        std::cerr << fmt::format("after clean {}\n", line);
        if (line.length() == 0)
            continue;

        if (std::regex_match(line, match, std::regex(R"(^(.*):(.*)$)")))
        {
            if (match[1].str() == "include")
            {
                std::cerr << fmt::format("command include \"{}\"\n", match[2].str());
                data.merge(read(match[2].str()));
            }
            else if (match[1].str() == "full")
            {
                std::cerr << fmt::format("command full \"{}\"\n", match[2].str());
                data.insert({match[2].str(), item_type::full});
            }
            else if (match[1].str() == "domain")
            {
                std::cerr << fmt::format("command domain \"{}\"\n", match[2].str());
                data.insert({match[2].str(), item_type::domain});
            }
            else if (match[1].str() == "regexp")
            {
                std::cerr << fmt::format("command regex \"{}\"\n", match[2].str());
                data.insert({match[2].str(), item_type::regex});
            }
            else
            {
                std::cerr << fmt::format("unknow command \"{}\" \"{}\"\n", match[1].str(), match[2].str());
                std::terminate();
            }
        }
        else
        {
            std::cerr << fmt::format("command default(domain) \"{}\"\n", line);
            data.insert({line, item_type::domain});
        }
    }
    return data;
}

std::string convert_full_to_regex(const std::string& data)
{
    unsigned find_begin = 0;
    unsigned loc;
    std::stringstream result;
    while (loc = data.find('.', find_begin), loc != std::string::npos)
    {
        result << data.substr(find_begin, loc - find_begin) << "\\.";
        find_begin = loc + 1;
    }
    return result.str();
}

void write(const std::set<std::pair<std::string, item_type>>& data, const std::string& server, std::ostream& os)
{
    for (const auto& item : data)
    {
        if (item.second == item_type::full)
            os << fmt::format("address=/:^{}$:/{}\n", item.first, server);
        else if (item.second == item_type::domain)
            os << fmt::format("address=/{}/{}\n", item.first, server);
        else if (item.second == item_type::regex)
            os << fmt::format("address=/:{}:/{}\n", item.first, server);
        else
            std::terminate();
    }
}

int main(int argc, const char** argv)
{
    std::vector<std::string> args(argv, argv + argc);
    std::ofstream os(args[4]);
    std::filesystem::current_path(args[1]);
    auto result = read(args[2]);
    write(result, args[3], os);
}
