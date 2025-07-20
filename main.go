package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"math/rand"
	"net/http"
	"net/url"
	"os"
	"os/exec"
	"path/filepath"
	"sort"
	"strconv"
	"strings"
	"time"
)

// Константы — настройки программы
const (
	MAX_WALLPAPERS    = 100
	KONACHAN_URL      = "https://konachan.com/post.json"
	KONACHAN_TAGS_URL = "https://konachan.com/tag.json"
	MAX_ATTEMPTS      = 20
	REQUEST_TIMEOUT   = 15 * time.Second
	REQUEST_DELAY     = 1 * time.Second
)

// Популярные теги — подсказка для пользователя
var POPULAR_TAGS = []string{
	"anime", "blonde_hair", "maid", "cat_ears", "school_uniform",
	"blue_eyes", "long_hair", "sakura", "landscape", "fantasy",
}

// Структура для данных о картинке от API
type Post struct {
	FileURL string `json:"file_url"`
	Width   int    `json:"width"`
	Height  int    `json:"height"`
}

// Проверяем, работает ли сайт
func checkAPIavailability() bool {
	client := &http.Client{Timeout: REQUEST_TIMEOUT}
	resp, err := client.Get(KONACHAN_URL)
	if err != nil {
		fmt.Printf("API недоступен: %v\n", err)
		return false
	}
	defer resp.Body.Close()
	if resp.StatusCode != 200 {
		fmt.Printf("API вернул ошибку: %d\n", resp.StatusCode)
		return false
	}
	fmt.Println("API доступен")
	return true
}

// Проверяем, существует ли тег
func validateTag(tag string) bool {
	client := &http.Client{Timeout: REQUEST_TIMEOUT}
	resp, err := client.Get(KONACHAN_TAGS_URL + "?name=" + url.QueryEscape(tag))
	if err != nil {
		fmt.Printf("Ошибка проверки тега '%s': %v\n", tag, err)
		return false
	}
	defer resp.Body.Close()
	var tags []map[string]interface{}
	json.NewDecoder(resp.Body).Decode(&tags)
	for _, t := range tags {
		if t["name"] == tag {
			fmt.Printf("Тег '%s' найден\n", tag)
			return true
		}
	}
	fmt.Printf("Тег '%s' не найден\n", tag)
	return false
}

// Узнаём разрешение экрана через xrandr
func getScreenResolution() (int, int) {
	cmd := exec.Command("xrandr")
	output, err := cmd.Output()
	if err != nil {
		fmt.Printf("Ошибка получения разрешения: %v\n", err)
		return 1920, 1080
	}
	lines := strings.Split(string(output), "\n")
	for _, line := range lines {
		if strings.Contains(line, "*") {
			parts := strings.Fields(line)
			res := strings.Split(parts[0], "x")
			if len(res) == 2 {
				width, _ := strconv.Atoi(res[0])
				height, _ := strconv.Atoi(res[1])
				return width, height
			}
		}
	}
	return 1920, 1080
}

// Убираем пробелы из тегов
func sanitizeTags(tags string) string {
	return strings.ReplaceAll(tags, " ", "_")
}

// Очищаем имя файла от проблемных символов
func sanitizeFilename(filename string) string {
	filename = strings.ReplaceAll(filename, "%20", "_")
	filename = strings.ReplaceAll(filename, " ", "_")
	filename = strings.ReplaceAll(filename, "%", "_")
	filename = strings.ReplaceAll(filename, "?", "_")
	filename = strings.ReplaceAll(filename, "&", "_")
	return filename
}

// Ищем случайную картинку
func fetchRandomImage(minWidth, minHeight int, tags string, useSafeRating, useResolution bool) (string, int, int) {
	tagString := sanitizeTags(tags)
	if useResolution {
		tagString = fmt.Sprintf("width:>=%d height:>=%d %s", minWidth, minHeight, tagString)
	}
	if useSafeRating {
		tagString = fmt.Sprintf("rating:safe %s", tagString)
	}
	params := url.Values{
		"limit": {"100"},
		"tags":  {tagString},
		"page":  {strconv.Itoa(rand.Intn(50) + 1)},
	}
	client := &http.Client{Timeout: REQUEST_TIMEOUT}
	resp, err := client.Get(KONACHAN_URL + "?" + params.Encode())
	if err != nil {
		fmt.Printf("Ошибка поиска: %v\n", err)
		return "", 0, 0
	}
	defer resp.Body.Close()
	var posts []Post
	json.NewDecoder(resp.Body).Decode(&posts)
	if len(posts) == 0 {
		fmt.Printf("Ничего не найдено для тегов: %s\n", tagString)
		return "", 0, 0
	}
	rand.Shuffle(len(posts), func(i, j int) { posts[i], posts[j] = posts[j], posts[i] })
	for _, post := range posts {
		if strings.HasSuffix(post.FileURL, ".jpg") || strings.HasSuffix(post.FileURL, ".png") {
			return post.FileURL, post.Width, post.Height
		}
	}
	return "", 0, 0
}

// Проверяем, есть ли такая картинка
func isDuplicate(fileURL string, saveDir string) bool {
	fname := sanitizeFilename(filepath.Base(fileURL))
	_, err := os.Stat(filepath.Join(saveDir, fname))
	return err == nil
}

// Скачиваем картинку
func downloadImage(url string, destDir string) (string, error) {
	fname := sanitizeFilename(filepath.Base(url))
	dest := filepath.Join(destDir, fname)
	resp, err := http.Get(url)
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()
	out, err := os.Create(dest)
	if err != nil {
		return "", err
	}
	defer out.Close()
	_, err = io.Copy(out, resp.Body)
	if err != nil {
		return "", err
	}
	return dest, nil
}

// Перемещаем файл с копированием вместо переименования
func moveFile(src, dest string) error {
	input, err := os.Open(src)
	if err != nil {
		return err
	}
	defer input.Close()
	output, err := os.Create(dest)
	if err != nil {
		return err
	}
	defer output.Close()
	_, err = io.Copy(output, input)
	if err != nil {
		return err
	}
	return os.Remove(src)
}

// Удаляем старые обои
func cleanupOldWallpapers(saveDir string, maxWallpapers int) {
	files, err := ioutil.ReadDir(saveDir)
	if err != nil {
		fmt.Printf("Ошибка чтения папки: %v\n", err)
		return
	}
	if len(files) <= maxWallpapers {
		return
	}
	sort.Slice(files, func(i, j int) bool {
		return files[i].ModTime().Before(files[j].ModTime())
	})
	for _, file := range files[:len(files)-maxWallpapers] {
		path := filepath.Join(saveDir, file.Name())
		fmt.Printf("Удаляю старые обои: %s\n", path)
		os.Remove(path)
	}
}

// Устанавливаем обои через qdbus
func applyWallpaper(path string) {
	script := fmt.Sprintf(`
var all = desktops();
for (var i = 0; i < all.length; i++) {
    var d = all[i];
    d.wallpaperPlugin = "org.kde.image";
    d.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    d.writeConfig("Image", "file://%s");
    d.reloadConfig();
}
`, path)
	cmd := exec.Command("qdbus", "org.kde.plasmashell", "/PlasmaShell", "org.kde.PlasmaShell.evaluateScript", script)
	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Printf("Ошибка установки обоев: %v\n%s\n", err, output)
	} else {
		fmt.Printf("Обои установлены: %s\n", path)
	}
}

// Главная функция
func main() {
	rand.Seed(time.Now().UnixNano())
	home, _ := os.UserHomeDir()
	saveDir := filepath.Join(home, "Pictures", "wallpapers")
	tempDir := filepath.Join(os.TempDir(), "konachan_preview")
	os.MkdirAll(saveDir, 0755)
	os.MkdirAll(tempDir, 0755)

	width, height := getScreenResolution()
	fmt.Printf("Разрешение экрана: %dx%d\n", width, height)

	if !checkAPIavailability() {
		fmt.Println("Программа завершена: API недоступен.")
		os.Exit(1)
	}

	for {
		fmt.Printf("Популярные теги: %s\n", strings.Join(POPULAR_TAGS, ", "))
		fmt.Print("Введи теги (например, 'anime blonde_hair') или нажми Enter для случайного выбора: ")
		scanner := bufio.NewScanner(os.Stdin)
		scanner.Scan()
		tags := scanner.Text()
		if tags != "" {
			for _, tag := range strings.Split(tags, " ") {
				validateTag(tag)
			}
		}
		fmt.Print("Только безопасные картинки? [Y/n]: ")
		scanner.Scan()
		useSafe := strings.ToLower(scanner.Text()) != "n"
		fmt.Print("Фильтровать по разрешению? [Y/n]: ")
		scanner.Scan()
		useResolution := strings.ToLower(scanner.Text()) != "n"

		minWidth, minHeight := 0, 0
		if useResolution {
			minWidth, minHeight = width, height
		}

		attempts := 0
		for {
			url, w, h := fetchRandomImage(minWidth, minHeight, tags, useSafe, useResolution)
			if url == "" {
				fmt.Printf("Попытка %d не удалась: ничего не найдено\n", attempts+1)
				if tags == "" && attempts >= MAX_ATTEMPTS-1 {
					fmt.Println("Достигнут лимит попыток для случайного выбора.")
					os.Exit(0)
				}
				break // Ошибка: спросим новые теги
			}
			if isDuplicate(url, saveDir) {
				fmt.Println("Картинка уже есть, ищу другую...")
				attempts++
				time.Sleep(REQUEST_DELAY)
				continue
			}
			tmp, err := downloadImage(url, tempDir)
			if err != nil {
				fmt.Printf("Ошибка скачивания: %v\n", err)
				break // Ошибка: спросим новые теги
			}
			// Проверяем, существует ли файл и валиден ли он
			fileInfo, err := os.Stat(tmp)
			if os.IsNotExist(err) {
				fmt.Printf("Файл не найден: %s\n", tmp)
				attempts++
				time.Sleep(REQUEST_DELAY)
				continue
			}
			if fileInfo.Size() == 0 {
				fmt.Printf("Файл пустой: %s\n", tmp)
				os.Remove(tmp)
				attempts++
				time.Sleep(REQUEST_DELAY)
				continue
			}
			fmt.Printf("Картинка: %dx%d\n", w, h)
			fmt.Printf("Отображаемый файл: %s\n", tmp)
			// Упрощённая команда для kitty icat
			cmd := exec.Command("kitty", "+kitten", "icat", "--scale-up", tmp)
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			err = cmd.Run()
			if err != nil {
				fmt.Printf("Ошибка отображения картинки: %v\n", err)
				os.Remove(tmp)
				attempts++
				time.Sleep(REQUEST_DELAY)
				continue
			}
			fmt.Print("Установить эти обои? [Y/n]: ")
			scanner.Scan()
			if strings.ToLower(scanner.Text()) != "n" {
				dest := filepath.Join(saveDir, filepath.Base(tmp))
				err := moveFile(tmp, dest)
				if err != nil {
					fmt.Printf("Ошибка перемещения файла: %v\n", err)
					os.Remove(tmp)
					attempts++
					time.Sleep(REQUEST_DELAY)
					continue
				}
				applyWallpaper(dest)
				cleanupOldWallpapers(saveDir, MAX_WALLPAPERS)
				os.Exit(0)
			} else {
				os.Remove(tmp)
				attempts++
				time.Sleep(REQUEST_DELAY)
			}
			// Если теги пустые, проверяем лимит попыток
			if tags == "" && attempts >= MAX_ATTEMPTS {
				fmt.Println("Достигнут лимит попыток для случайного выбора.")
				os.Exit(0)
			}
		}
		fmt.Print("Попробовать другие теги? [Y/n]: ")
		scanner.Scan()
		if strings.ToLower(scanner.Text()) == "n" {
			fmt.Println("Выход из программы.")
			os.Exit(0)
		}
	}
}