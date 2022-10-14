package main

import (
	"bufio"
	b64 "encoding/base64"
	"encoding/xml"
	"errors"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"path"
	"strconv"
	"strings"

	"github.com/pelletier/go-toml/v2"
)

var config_path = get_home_dir() + "/.config/nextcloud-cli/config.toml"

type Config struct {
	Username       string
	Password       string
	UploadFolder   string
	RootURL        string
	FileSizeWarnMB int
}

type XMLMultistatus struct {
	XMLName   xml.Name      `xml:"multistatus"`
	Responses []XMLResponse `xml:"response"`
}

type XMLResponse struct {
	XMLName xml.Name `xml:"response"`
	Href    string   `xml:"href"`
}

type XMLOcs struct {
	XMLName xml.Name `xml:"ocs"`
	Data    XMLData  `xml:"data"`
}

type XMLData struct {
	XMLName xml.Name `xml:"data"`
	URL     string   `xml:"url"`
}

func check(err error) {
	if err != nil {
		fmt.Println("⚠ FEHLER!! ⚠")
		log.Fatal(err)
	}
}

// Makes a http(s) request to the nextcloud instance specified in configuration file
// ocs flag is needed for requests to the nextcloud OCS endpoint
func make_nc_request(method string, url string, data *strings.Reader, ocs bool, config Config) []byte {
	client := &http.Client{}

	var req *http.Request
	var err error

	if data == nil {
		req, err = http.NewRequest(method, config.RootURL+url, nil)
	} else {
		req, err = http.NewRequest(method, config.RootURL+url, data)
	}

	check(err)

	auth_header := b64.StdEncoding.EncodeToString([]byte(config.Username + ":" + config.Password))

	req.Header.Add("Authorization", "Basic "+auth_header)

	if ocs {
		req.Header.Add("OCS-APIRequest", "true")
	}

	resp, err := client.Do(req)

	check(err)

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)

	check(err)

	return body
}

// input: bla/bli/file.txt
// output: file.txt
func get_file_name(path_to_file string) string {
	path_split := strings.Split(path_to_file, "/")
	return path_split[len(path_split)-1]
}

// share an already uploaded file via link and get the shared link
// TODO: Password support
func share_file(remote_path string, pw string, config Config) {

	var xml_ocs XMLOcs
	var query string

	remote_path = strings.Split(remote_path, "remote.php/dav/files/"+config.Username)[1]

	endstr := ""

	if pw != "" {
		query = "?path=" + remote_path + "&shareType=3&pw=" + pw
		endstr = " , secured with a password"
	} else {
		query = "?path=" + remote_path + "&shareType=3"
	}

	response := make_nc_request("POST", "/ocs/v2.php/apps/files_sharing/api/v1/shares"+
		strings.ReplaceAll(query, " ", "%20"), nil, true, config)
	check(xml.Unmarshal(response, &xml_ocs))

	if xml_ocs.Data.URL == "" {
		fmt.Print("😣 Something went wrong sharing the file...")
		os.Exit(1)
	}

	fmt.Println("🥂 Now sharable as " + xml_ocs.Data.URL + endstr)
}

// read the given file path and upload its content to nextcloud
// if share is true, share_file() is called afterwards
func upload_file(path_to_file string, config Config, share bool) {

	if !file_exists(path_to_file) {
		log.Fatal("🚨🚨 The file " + path_to_file + " does not seem to exist :o")
	}

	file_name := get_file_name(path_to_file)

	file_destination := config.UploadFolder + file_name

	fmt.Println("👾 Uploading " + path_to_file + " to " + file_destination + "...")

	dat, err := os.ReadFile(path_to_file)
	check(err)

	if len(dat) > 1000000 {
		fmt.Println("👾 File is " + strconv.Itoa(len(dat)/1000000) + " MB big")
	} else if len(dat) > 1000 {
		fmt.Println("👾 File is " + strconv.Itoa(len(dat)/1000) + " KB big")
	} else {
		fmt.Println("👾 File is " + strconv.Itoa(len(dat)) + " Bytes big")
	}

	if len(dat) > (config.FileSizeWarnMB * 1000000) {
		fmt.Println("🤖 " + path_to_file + " is " + strconv.Itoa(len(dat)/1000000) + "MB big. Do you want to continue?")
		if strings.ToLower(read_cli_input("y/N")) != "y" {
			fmt.Println("exiting..")
			os.Exit(0)
		}
	}

	upload_data := strings.NewReader(string(dat))

	response := string(make_nc_request("PUT", file_destination, upload_data, false, config))

	if response != "" {
		log.Fatal("🚨🚨 Error uploading to " + file_destination + ":\n\n" + response)
	}

	fmt.Println("😎 Uploaded.")

	if share {
		share_file(file_destination, "", config)
	}
}

// returns []string containing the full paths to all folders in users nextcloud home
func list_nc_folders(config Config) []string {
	var folders XMLMultistatus

	folder := "/remote.php/dav/files/" + config.Username + "/"

	response := make_nc_request("PROPFIND", folder, nil, false, config)

	check(xml.Unmarshal(response, &folders))

	if len(folders.Responses) <= 0 {
		log.Fatal("🚨🚨 Error getting folder list of " + folder + string(response))
	}

	var folderList []string
	for i := 0; i < len(folders.Responses); i++ {
		if has_trailing_backspace(folders.Responses[i].Href) {
			folderList = append(folderList, folders.Responses[i].Href)
		}
	}

	return folderList
}

// get home directory on local machine
func get_home_dir() string {
	dirname, err := os.UserHomeDir()
	check(err)
	return dirname
}

// local machine
func file_exists(file_path string) bool {
	if _, err := os.Stat(file_path); err == nil {
		return true
	} else if errors.Is(err, os.ErrNotExist) {
		return false
	} else {
		log.Fatal(err)
	}
	return false
}

// foo/bar/ -> foo/bar
func remove_trailing_backspace(s string) string {
	sz := len(s)
	if sz > 0 && s[sz-1] == '/' {
		s = s[:sz-1]
	}
	return s
}

// foo/bar/ -> true
// foo/bar -> false
func has_trailing_backspace(s string) bool {
	sz := len(s)
	if sz > 0 && s[sz-1] == '/' {
		return true
	}
	return false
}

// lists folders in nextcloud home and asks user to choose one of them
func set_folder(folders []string) string {
	fmt.Println("Input a number from 1 to " + strconv.Itoa(len(folders)-1))

	fmt.Println()

	for i := 0; i < len(folders); i++ {
		fmt.Println(strconv.Itoa(i) + ". " + folders[i])
	}

	folder_num, err := strconv.Atoi(read_cli_input(""))
	check(err)

	if folder_num < 0 || folder_num > len(folders)-1 {
		log.Fatal("🚨🚨 Error: CLI input number out of range")
	}

	return folders[folder_num]
}

// create new config (and delete existing one if it does)
func create_config() {

	new_config := Config{
		Username:       "Foo",
		Password:       "Bar",
		UploadFolder:   "Documents",
		RootURL:        "https://cloud.mafiasi.de",
		FileSizeWarnMB: 200,
	}

	if file_exists(config_path) {
		check(os.Remove(config_path))
	} else {
		check(os.MkdirAll(get_home_dir()+"/.config/nextcloud-cli", 0700))
	}

	fmt.Println("👾: Welcome to the Nextcloud CLI setup!")

	fmt.Println()
	fmt.Println("Please enter your the root path to your Nextcloud (e.g. https://cloud.mafiasi.de):")
	new_config.RootURL = remove_trailing_backspace(read_cli_input(""))

	fmt.Println()
	fmt.Println("Now, go to " + new_config.RootURL + "/settings/user/security and create a new App.")
	new_config.Username = read_cli_input("App Username")
	new_config.Password = read_cli_input("App Password")
	folders := list_nc_folders(new_config)

	fmt.Println()
	fmt.Println("Great! Finally, we need to know which folder you want to use for default uploads.")
	new_config.UploadFolder = set_folder(folders)

	fmt.Println()
	fmt.Println("🎉🎉 Created config in " + config_path)

	toml_str, err := toml.Marshal(new_config)
	check(err)

	check(os.WriteFile(config_path, toml_str, 0644))
	os.Exit(0)
}

func read_cli_input(txt string) string {
	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Print(txt + " -> ")
		text, _ := reader.ReadString('\n')
		text = strings.Replace(text, "\n", "", -1) // CRLF -> LF
		return text
	}
}

func read_config() Config {

	var config Config

	if !file_exists(config_path) {
		create_config()
	}

	dat, err := os.ReadFile(config_path)
	check(err)

	check(toml.Unmarshal([]byte(dat), &config))

	return config
}

// all handlers are invoked directly by different flags such as "--upload"
func handle_upload(i int, args []string, config Config, share bool) {
	if len(args) < i+2 {
		log.Fatal("🚨🚨 No path provided")
	} else {
		if args[i+1][0:1] == "/" { //           <- absolute path
			upload_file(args[i+1], config, share)
		} else { //                             <- relative path
			cwd, err := os.Getwd()
			check(err)
			upload_file(path.Join(cwd, args[i+1]), config, share)
		}
	}
	os.Exit(0)
}

func handle_test(i int, args []string, config Config) {
	cwd, err := os.Getwd()
	check(err)
	new_path := path.Join(cwd, args[i+1])
	fmt.Println(new_path)
	os.Exit(0)
}

func handle_configure(i int, args []string, config Config) {
	if len(args) < i+2 {
		txtconf, err := toml.Marshal(config)
		check(err)
		fmt.Println(string(txtconf))
	} else {
		switch strings.ToLower(args[i+1]) {
		case "reset":
			create_config()
		case "username":
			config.Username = read_cli_input("App Username")
		case "password":
			config.Password = read_cli_input("App Password")
		case "uploadfolder":
			folders := list_nc_folders(config)
			config.UploadFolder = set_folder(folders)
		case "rooturl":
			config.RootURL = read_cli_input("Root ULR (e.g. https://cloud.mafiasi.de)")
		case "filesizewarnmb":
			new_fs, err := strconv.Atoi(read_cli_input("Warning File Size (MB)"))
			check(err)
			config.FileSizeWarnMB = new_fs
		default:
			fmt.Println("Setting " + args[i+1] + " unknown")
		}

		toml_str, err := toml.Marshal(config)
		check(err)

		check(os.WriteFile(config_path, toml_str, 0644))

		fmt.Println("😎 Saved.")
	}
	os.Exit(0)
}

func main() {

	config := read_config()

	args := os.Args[1:]

	for i := 0; i < len(args); i++ {
		switch strings.ToLower(args[i]) {
		case "-u":
			handle_upload(i, args, config, false)
		case "--upload":
			handle_upload(i, args, config, false)
		case "-c":
			handle_configure(i, args, config)
		case "--configure":
			handle_configure(i, args, config)
		case "--test":
			handle_test(i, args, config)
		case "--share":
			handle_upload(i, args, config, true)
		case "-s":
			handle_upload(i, args, config, true)
		}
	}

	println("👾 Nextcloud-CLI Usage:")
	println("   -S, --share <path/foo.bar>                  Upload given file to nextcloud and create a link to share that file")
	println("   -U, --upload <path/foo.bar>                 Upload given file to nextcloud")
	println("   -C, --configure [setting | reset]           List the settings, configure a given setting or reset 'em all")
	println()
	println("github.com/m4r1vs/nextcloud-share-cli v1.0.2, Created by Marius Niveri <marius@niveri.de>")
}
