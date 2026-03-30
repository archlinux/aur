package main

import (
    "bufio"
    "crypto/rand"
    "crypto/sha256"
    "encoding/hex"
    "encoding/json"
    "fmt"
    "log"
    "net"
    "net/http"
    "os"
    "strings"
)

type AuthRequest struct {
    Username string `json:"username"`
    Password string `json:"password"`
    Token    string `json:"token"`
}

type AuthResponse struct {
    Status  string `json:"status"`
    Message string `json:"message,omitempty"`
}

type RegisterRequest struct {
    Username string `json:"username"`
    Password string `json:"password"`
}

type RegisterResponse struct {
    Status  string `json:"status"`
    Token   string `json:"token,omitempty"`
    QRCode  string `json:"qrcode,omitempty"`
    Message string `json:"message,omitempty"`
}

var usersFile = "/etc/2fact/passwd"

// Временное хранение QR токенов (в памяти)
var qrTokens = make(map[string]string) // username -> qr_token

func getLocalIP() string {
    addrs, err := net.InterfaceAddrs()
    if err != nil {
        return "localhost"
    }
    
    for _, addr := range addrs {
        if ipnet, ok := addr.(*net.IPNet); ok && !ipnet.IP.IsLoopback() && ipnet.IP.To4() != nil {
            return ipnet.IP.String()
        }
    }
    return "localhost"
}

func generateQRToken() string {
    bytes := make([]byte, 16)
    rand.Read(bytes)
    return hex.EncodeToString(bytes)
}

func generateToken(username, password string) string {
    h := sha256.New()
    h.Write([]byte(username + password))
    return hex.EncodeToString(h.Sum(nil))
}

func getUserToken(username string) (string, error) {
    file, err := os.Open(usersFile)
    if err != nil {
        return "", err
    }
    defer file.Close()

    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line := scanner.Text()
        parts := strings.SplitN(line, ":", 2)
        if len(parts) == 2 && parts[0] == username {
            return parts[1], nil
        }
    }
    return "", fmt.Errorf("user not found")
}

func saveUserToken(username, token string) error {
    var lines []string
    file, err := os.Open(usersFile)
    if err == nil {
        scanner := bufio.NewScanner(file)
        for scanner.Scan() {
            line := scanner.Text()
            parts := strings.SplitN(line, ":", 2)
            if len(parts) == 2 && parts[0] != username {
                lines = append(lines, line)
            }
        }
        file.Close()
    }

    lines = append(lines, username+":"+token)

    f, err := os.Create(usersFile)
    if err != nil {
        return err
    }
    defer f.Close()

    for _, line := range lines {
        fmt.Fprintln(f, line)
    }
    return nil
}

func registerHandler(w http.ResponseWriter, r *http.Request) {
    var req RegisterRequest
    if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
        sendJSON(w, http.StatusBadRequest, RegisterResponse{Status: "error", Message: "Invalid request"})
        return
    }

    if req.Username == "" || req.Password == "" {
        sendJSON(w, http.StatusBadRequest, RegisterResponse{Status: "error", Message: "Username and password required"})
        return
    }

    existingToken, _ := getUserToken(req.Username)
    if existingToken != "" {
        sendJSON(w, http.StatusConflict, RegisterResponse{Status: "error", Message: "User already exists"})
        return
    }

    token := generateToken(req.Username, req.Password)
    qrToken := generateQRToken()
    
    // Сохраняем QR токен в памяти
    qrTokens[req.Username] = qrToken

    if err := saveUserToken(req.Username, token); err != nil {
        sendJSON(w, http.StatusInternalServerError, RegisterResponse{Status: "error", Message: "Failed to save user"})
        return
    }

    // Генерируем ссылку с автоматическим IP
    ip := getLocalIP()
    qrURL := fmt.Sprintf("http://%s:13031/api/v1/verify?token=%s&user=%s", ip, qrToken, req.Username)
    
    sendJSON(w, http.StatusOK, RegisterResponse{
        Status:  "ok",
        Token:   token,
        QRCode:  qrURL,
        Message: "User registered. Scan QR code or visit URL to verify",
    })
}

func verifyQRHandler(w http.ResponseWriter, r *http.Request) {
    qrToken := r.URL.Query().Get("token")
    username := r.URL.Query().Get("user")
    
    if qrToken == "" || username == "" {
        w.Write([]byte(`
            <html>
            <body style="font-family: monospace; padding: 20px;">
                <h2>2FA Verification</h2>
                <p>Invalid verification link</p>
            </body>
            </html>
        `))
        return
    }
    
    // Проверяем существует ли пользователь
    savedToken, err := getUserToken(username)
    if err != nil {
        w.Write([]byte(`
            <html>
            <body style="font-family: monospace; padding: 20px;">
                <h2>2FA Verification</h2>
                <p style="color: red;">User not found</p>
            </body>
            </html>
        `))
        return
    }
    
    // Проверяем QR токен из памяти
    storedQRToken, exists := qrTokens[username]
    if !exists || storedQRToken != qrToken {
        w.Write([]byte(`
            <html>
            <body style="font-family: monospace; padding: 20px;">
                <h2>2FA Verification</h2>
                <p style="color: red;">Invalid or expired verification token</p>
            </body>
            </html>
        `))
        return
    }
    
    // Удаляем QR токен после успешной верификации
    delete(qrTokens, username)
    
    w.Write([]byte(fmt.Sprintf(`
        <html>
        <body style="font-family: monospace; padding: 20px;">
            <h2>✅ 2FA Verification Successful!</h2>
            <p>User: <strong>%s</strong></p>
            <p>Your device has been verified. You can now log in.</p>
            <p style="font-size: 12px; color: gray;">Close this window and proceed with login.</p>
        </body>
        </html>
    `, username)))
}

func authHandler(w http.ResponseWriter, r *http.Request) {
    var req AuthRequest
    if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
        sendJSON(w, http.StatusBadRequest, AuthResponse{Status: "error", Message: "Invalid request"})
        return
    }

    if req.Username == "" || req.Password == "" || req.Token == "" {
        sendJSON(w, http.StatusBadRequest, AuthResponse{Status: "error", Message: "Username, password and token required"})
        return
    }

    savedToken, err := getUserToken(req.Username)
    if err != nil {
        sendJSON(w, http.StatusUnauthorized, AuthResponse{Status: "error", Message: "User not found"})
        return
    }

    computedToken := generateToken(req.Username, req.Password)

    if savedToken != computedToken {
        sendJSON(w, http.StatusUnauthorized, AuthResponse{Status: "error", Message: "Invalid password"})
        return
    }

    if req.Token != savedToken {
        sendJSON(w, http.StatusUnauthorized, AuthResponse{Status: "error", Message: "Invalid token"})
        return
    }

    sendJSON(w, http.StatusOK, AuthResponse{Status: "ok", Message: "Authenticated"})
}

func getTokenHandler(w http.ResponseWriter, r *http.Request) {
    var req struct {
        Username string `json:"username"`
        Password string `json:"password"`
    }
    if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
        sendJSON(w, http.StatusBadRequest, AuthResponse{Status: "error", Message: "Invalid request"})
        return
    }

    if req.Username == "" || req.Password == "" {
        sendJSON(w, http.StatusBadRequest, AuthResponse{Status: "error", Message: "Username and password required"})
        return
    }

    savedToken, err := getUserToken(req.Username)
    if err != nil {
        sendJSON(w, http.StatusUnauthorized, AuthResponse{Status: "error", Message: "User not found"})
        return
    }

    computedToken := generateToken(req.Username, req.Password)

    if savedToken != computedToken {
        sendJSON(w, http.StatusUnauthorized, AuthResponse{Status: "error", Message: "Invalid password"})
        return
    }

    sendJSON(w, http.StatusOK, map[string]string{"token": savedToken})
}

func sendJSON(w http.ResponseWriter, status int, data interface{}) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(status)
    json.NewEncoder(w).Encode(data)
}

func main() {
    // Создаем директорию если нет
    os.MkdirAll("/etc/2fact", 0700)

    http.HandleFunc("/api/v1/register", registerHandler)
    http.HandleFunc("/api/v1/auth", authHandler)
    http.HandleFunc("/api/v1/token", getTokenHandler)
    http.HandleFunc("/api/v1/verify", verifyQRHandler)

    ip := getLocalIP()
    log.Printf("Server starting on %s:13031", ip)
    log.Printf("Password file: %s", usersFile)
    log.Printf("QR verification URL: http://%s:13031/api/v1/verify?token=<token>&user=<user>", ip)
    log.Fatal(http.ListenAndServe(":13031", nil))
}
