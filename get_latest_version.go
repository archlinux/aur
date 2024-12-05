package main

import (
    "fmt"
    "io"
    "net/http"
    "sort"
    "strings"
)

func main() {
    url := "https://archive2.kylinos.cn/DEB/KYLIN_DEB/pool/main/deb/wpsoffice"
    resp, err := http.Get(url)
    if err!= nil {
        fmt.Printf("获取网页内容出错: %v\n", err)
        return
    }
    defer resp.Body.Close()

    body, err := io.ReadAll(resp.Body)
    if err!= nil {
        fmt.Printf("读取网页内容出错: %v\n", err)
        return
    }

    content := string(body)
    hrefTags := findHrefTags(content)
    var wpsPackages []string
    for _, href := range hrefTags {
        if strings.HasPrefix(href, "wpsoffice") {
            wpsPackages = append(wpsPackages, href)
        }
    }

    if len(wpsPackages) == 0 {
        fmt.Println("未找到wps-office的软件包链接")
        return
    }

    sort.Slice(wpsPackages, func(i, j int) bool {
        return wpsPackages[i] > wpsPackages[j]
    })

    latestPackage := wpsPackages[0]
    fmt.Printf("最新版本的wps-office的软件包为: %s\n", latestPackage)
}

func findHrefTags(content string) []string {
    var hrefTags []string
    startIndex := 0
    for {
        start := strings.Index(content[startIndex:], "<a href=\"")
        if start == -1 {
            break
        }
        start += len("<a href=\"") + startIndex
        end := strings.Index(content[start:], "\">")
        if end == -1 {
            break
        }
        end += start
        hrefTags = append(hrefTags, content[start:end])
        startIndex = end
    }
    return hrefTags
}
