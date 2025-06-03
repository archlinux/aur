package main

import (
	"bufio"
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"encoding/json"
	"encoding/pem"
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/fatih/color"
	"github.com/golang-jwt/jwt/v5"
	"github.com/spf13/cobra"
)

var (
	headerColor = color.New(color.FgCyan, color.Bold)
	keyColor = color.New(color.FgBlue)
	valeuColor = color.New(color.FgGreen)
	stringColor = color.New(color.FgYellow)
	numberColor = color.New(color.FgMagenta)
	boolColor = color.New(color.FgRed)
	errorColor = color.New(color.FgRed, color.Bold)
	successColor = color.New(color.FgGreen, color.Bold)
	infoColor = color.New(color.FgCyan)
)

type JWTComponents struct {
	Header map[string]interface{}
	Payload map[string]interface{}
	Signature string
	Raw string
	Valid bool
	Error string
}

func main() {
	var rootCmd = &cobra.Command{
		Use: "jwtk",
		Short: "JWT toolkit - decode, validate, adn generate JWT tokens",
		Long: `JWT is a comprehensive JWT (Json Web Token) toolkit that provides:
- JWT decoding and parsing with syntax highlighting
- Token validation and signature verification
- JWT generation with HS256 and RS256 algorithms
- Interactive TUI mode for easy token manipulation`,
	}

	var decodeCmd = &cobra.Command{
		Use: "decode [token]",
		Short: "Decode and display JWT token components",
		Long: "Decode a JWT token and display its header, payload, and signature with color highlighting",
		Args: cobra.MaximumNArgs(1),
		Run: decodeCommand,
	}

	var validateCmd = &cobra.Command{
		Use: "validate [token]",
		Short: "Validate JWT token signature",
		Long: "Validate a JWT token's signature using the provided secret or key",
		Args: cobra.MaximumNArgs(1),
		Run: validateCommand,
	}

	var generateCmd = &cobra.Command{
		Use: "generate",
		Short: "Generate a new JWT token",
		Long: "Generate a new JWT token with specified claims and algorithm",
		Run: generateCommand,
	}

	var genKeysCmd = &cobra.Command {
		Use: "genkeys",
		Short: "Generate RSA key pair",
		Long: "Generate an RSA private and public key pair for RS256 signing and verification",
		Run: generateKeyPairCommand,
	}

	var tuiCmd = &cobra.Command {
		Use: "tui",
		Short: "Launch interactive TUI mode",
		Long: "Launch an interactive Terminal User INterface for JWT operations",
		Run: tuiCommand,
	}

	decodeCmd.Flags().BoolP("raw", "r", false, "Show raw JSON without colors")
	decodeCmd.Flags().StringP("secret", "s", "", "Secret key for signature validation")
	decodeCmd.Flags().StringP("keyfile", "k", "", "Path to key file for signature validation")

	validateCmd.Flags().StringP("secret", "s", "", "Secret key for validation")
	validateCmd.Flags().StringP("keyfile", "k", "", "Path to key file for validation")

	generateCmd.Flags().StringP("algorithm", "a", "HS256", "Signing algorithm (HS256, RS256)")
	generateCmd.Flags().StringP("secret", "s", "", "Secret key for HS256")
	generateCmd.Flags().StringP("keyfile", "k", "", "Path to private key file for RS256")
	generateCmd.Flags().StringP("subject", "", "", "Subject claim")
	generateCmd.Flags().StringP("issuer", "", "", "Issuer claim")
	generateCmd.Flags().StringP("audience", "", "", "Audience claim")
	generateCmd.Flags().StringP("name", "", "", "Name claim")
	generateCmd.Flags().StringP("admin", "", "", "Admin claim (true/false)")
	generateCmd.Flags().StringP("type", "", "", "Token type (access/refresh/etc)")
	generateCmd.Flags().StringP("csrf", "", "", "CSRF token value")
	generateCmd.Flags().StringP("fresh", "", "", "Fresh token flag (true/false)")
	generateCmd.Flags().StringP("jti", "", "", "JWT ID (unique identifier)")
	generateCmd.Flags().StringP("expires", "e", "", "Expiration time is the second from now")
	generateCmd.Flags().StringP("nbf", "n", "", "Not Before (seconds from now)")

	genKeysCmd.Flags().StringP("outdir", "o", ".", "Output directory for the key pair")

	rootCmd.AddCommand(decodeCmd, validateCmd, generateCmd, genKeysCmd, tuiCmd)
	rootCmd.Execute()
}

func decodeCommand(cmd *cobra.Command, args []string) {
	var token string

	if len(args) > 0 {
		token = args[0]
	} else {
		token = readTokenFromInput("Enter JWT token: ")
	}

	components := parseJWT(token)
	displayJWTComponents(components, cmd)
}

func validateCommand(cmd *cobra.Command, args []string) {
	var token string

	if len(args) > 0 {
		token = args[0]
	} else {
		token = readTokenFromInput("Enter JWT token: ")
	}

	secret, _ := cmd.Flags().GetString("secret")
	keyfile, _ := cmd.Flags().GetString("keyfile")

	if secret == "" && keyfile == "" {
		secret = readInput("Enter secret key: ")
	}

	valid, err := validateJWT(token, secret, keyfile)

	if valid {
		successColor.Println("✓ Token is valid")
	} else {
		errorColor.Printf("✗ Token is invalid: %v\n",err)
	}
}

func generateCommand(cmd *cobra.Command, args []string){
	algorithm, _ := cmd.Flags().GetString("algorithm")
	secret, _ := cmd.Flags().GetString("secret")
	keyfile, _ := cmd.Flags().GetString("keyfile")
	subject, _ := cmd.Flags().GetString("subject")
	issuer, _ := cmd.Flags().GetString("issuer")
	audience, _ := cmd.Flags().GetString("audience")
	name, _ := cmd.Flags().GetString("name")
	admin, _ := cmd.Flags().GetString("admin")
	tokenType, _ := cmd.Flags().GetString("type")
	csrf, _ := cmd.Flags().GetString("csrf")
	fresh, _ := cmd.Flags().GetString("fresh")
	jti, _ := cmd.Flags().GetString("jti")
	expires, _ := cmd.Flags().GetString("expires")
	nbf, _ := cmd.Flags().GetString("nbf")

	claims := jwt.MapClaims{
		"iat": time.Now().Unix(),
	}

	if expires != "none" {
		expiresNum, err := strconv.Atoi(expires)
		if err == nil {
			claims["exp"] = time.Now().Add(time.Duration(expiresNum) * time.Second).Unix()
		}
	}

	if nbf != "" && nbf != "none" {
		nbfNum, err := strconv.Atoi(nbf)
		if err == nil {
			claims["nbf"] = time.Now().Add(time.Duration(nbfNum) * time.Second).Unix()
		}
	}

	if subject != "" && subject != "none" {
		claims["sub"] = subject
	}

	if issuer != "" && issuer != "none" {
		claims["iss"] = issuer
	}

	if audience != "" && audience != "none" {
		claims["aud"] = audience
	}

	if name != "" && name != "none" {
		claims["name"] = name
	}

	if admin != "" && admin != "none" {
		adminBool := strings.ToLower(admin) == "true"
		claims["admin"] = adminBool
	}

	if tokenType != "" && tokenType != "none" {
		claims["type"] = tokenType
	}

	if csrf != "" && csrf != "none" {
		claims["csrf"] = csrf
	}

	if fresh != "" && fresh != "none" {
		freshBool := strings.ToLower(fresh) == "true"
		claims["fresh"] = freshBool
	}

	if jti != "" && jti != "none" {
		claims["jti"] = jti
	}

	var token string
	var err error

	switch algorithm {
	case "HS256":
		if secret == "" {
			secret = readInput("Enter secret key: ")
		}
		token, err = generateHS256Token(claims, secret)
	case "RS256":
		if keyfile == "" {
			keyfile = readInput("Enter path to private key file: ")
		}
		token, err = generateRS256Token(claims, keyfile)
	default:
		errorColor.Printf("Unsupported algorithm: %s\n", algorithm)
		return
	}

	if err != nil {
		errorColor.Printf("Error generating token: %v\n", err)
		return
	}

	successColor.Println("Generated JWT token:")
	fmt.Println(token)
}

func generateKeyPairCommand(cmd *cobra.Command, args []string) {
	outdir, _ := cmd.Flags().GetString("outdir")

	privateKey, err := rsa.GenerateKey(rand.Reader, 2048)
	if err != nil {
		errorColor.Printf("Failed to generate RSA key: %v\n", err)
		return
	}

	privateFile := outdir + "/private.pem"
	privBytes := x509.MarshalPKCS1PrivateKey(privateKey)
	privPem := &pem.Block{
		Type: "RSA PRIVATE KEY",
		Bytes: privBytes,
	}
	err = os.WriteFile(privateFile, pem.EncodeToMemory(privPem), 0600)
	if err != nil {
		errorColor.Printf("Failed to write private key: %v\n",err)
		return
	}

	publicFile := outdir + "/public.pem"
	pubBytes, err := x509.MarshalPKIXPublicKey(&privateKey.PublicKey)
	if err != nil {
		errorColor.Printf("Failed to marshal public key: %v\n", err)
		return
	}
	pubPem := &pem.Block{
		Type: "PUBLIC KEY",
		Bytes: pubBytes,
	}
	err = os.WriteFile(publicFile, pem.EncodeToMemory(pubPem), 0644)
	if err != nil {
		errorColor.Printf("Failed to write public key: %v\n",err)
		return
	}

	successColor.Printf("✓ RSA key pair generated:\n")
	fmt.Printf("  - Private key: %s\n", privateFile)
	fmt.Printf("  - Public key: %s\n", publicFile)
}

func tuiCommand(cmd *cobra.Command, args []string) {
	for {
		fmt.Println()
		headerColor.Println("=== JWTK - JWT Toolkit ===")
		fmt.Println("1. Decode JWT")
		fmt.Println("2. Validate JWT")
		fmt.Println("3. Generate JWT")
		fmt.Println("4. Generate RSA Key Pair")
		fmt.Println("5. Exit")
		fmt.Print("\nSelect an option (1-5): ") 

		choice := readInput("")

		switch choice {
		case "1":
			tuiDecode()
		case "2":
			tuiValidate()
		case "3":
			tuiGenerate()
		case "4":
			tuiGenerateKeyPair()
		case "5":
			fmt.Println("Goodbye!")
			return
		default:
			errorColor.Println("Invalid option. Please select 1-4.")
		}
	}
}

func tuiDecode() {
	fmt.Println()
	headerColor.Println("=== JWT Decoder ===")
	token := readTokenFromInput("Enter JWT token: ")

	components := parseJWT(token)
	displayJWTComponents(components, nil)
}

func tuiValidate() {
	fmt.Println()
	headerColor.Println("=== JWT Validator ===")
	token := readTokenFromInput("Enter JWT token: ")

	components := parseJWT(token)
	if !components.Valid {
		errorColor.Printf("Invalid token: %s\n", components.Error)
		return
	}

	alg, ok := components.Header["alg"].(string)
	if !ok {
		errorColor.Println("Cannot determine token algorithm")
		return
	}

	infoColor.Printf("Detected algorithm: %s\n", alg)

	var valid bool
	var err error

	switch alg {
	case "HS256", "HS384", "HS512":
		secret := readInput("Enter secret key: ")
		valid, err = validateJWT(token, secret, "")
	case "RS256", "RS384", "RS512":
		keyfile := readInput("Enter path to public key file: ")
		valid, err = validateJWT(token, "", keyfile)
	default:
		errorColor.Printf("Unsupported algorithm: %s\n", alg)
		return
	}

	if valid {
		successColor.Println("✓ Token is valid")
	} else {
		errorColor.Printf("✗ Token is invalid: %v\n",err)
	}
}

func tuiGenerate() {
	fmt.Println()
	headerColor.Println("=== JWT Generator ===")

	fmt.Println("1. HS256 (HMAC)")
	fmt.Println("2. RS256 (RSA)")
	fmt.Print("Select algorithm (1-2): ")

	algChoice := readInput("")

	claims := jwt.MapClaims{
		"iat": time.Now().Unix(),
	}

	subject := readInput("Subject (sub) [optional]: ")
	if subject != "" {
		claims["sub"] = subject
	}

	issuer := readInput("Issuer (iss) [optional]: ")
	if issuer != "" {
		claims["iss"] = issuer
	}

	audience := readInput("Audience (aud) [optional]: ")
	if audience != "" {
		claims["aud"] = audience
	}

	name := readInput("Name (name) [optional]: ")
	if name != "" {
		claims["name"]  = name
	}

	admin := readInput("Admin (admin) [optional]: ")
	if admin != "" {
		adminBool := strings.ToLower(admin) == "true"
		claims["admin"] = adminBool
	}

	tokenType := readInput("Token type (type) (access/refresh/etc) [optional]: ")
	if tokenType != "" {
		claims["type"] = tokenType
	}

	csrf := readInput("CSRF token value (csrf) [optional]: ")
	if csrf != "" {
		claims["csrf"] = csrf
	}

	fresh := readInput("Fresh token flag (fresh) (true/false) [optoinal]: ")
	if fresh != "" {
		freshBool := strings.ToLower(fresh) == "true"
		claims["fresh"] = freshBool
	}

	jti := readInput("JWT ID (jti) (unique identifier) [optional]: ")
	if jti != "" {
		claims["jti"] = jti
	}

	expires := readInput("Expires in seconds [optional]: ")
	if expires != "" {
		expiresNum, err := strconv.Atoi(expires)
		if err == nil {
			claims["exp"] = time.Now().Add(time.Duration(expiresNum) * time.Second).Unix()
		}
	}

	nbf := readInput("Not before in seconds [optional]: ")
	if nbf != "" {
		nbfNum, err := strconv.Atoi(nbf)
		if err == nil {
			claims["nbf"] = time.Now().Add(time.Duration(nbfNum) * time.Second).Unix()
		}
	}

	var token string
	var err error

	switch algChoice {
	case "1":
		secret := readInput("Enter secret key: ")
		token, err = generateHS256Token(claims, secret)
	case "2":
		keyfile := readInput("Enter path to private key file: ")
		token, err = generateRS256Token(claims, keyfile)
	default:
		errorColor.Println("Invalid algorithm choice")
		return
	}

	if err != nil {
		errorColor.Printf("Error generating token: %v\n", err)
		return
	}
	
	successColor.Println("\nGenerated JWT token:")
	fmt.Println(token)
}

func tuiGenerateKeyPair() {
	fmt.Println()
	headerColor.Println("=== RSA Key Pair Generator ===")

	outdir := readInput("Enter output directory [current directory]: ")
	if outdir == "" {
		outdir = "."
	}
    privateKey, err := rsa.GenerateKey(rand.Reader, 2048)
	if err != nil {
		errorColor.Printf("Failed to generate RSA key: %v\n", err)
		return
	}

	privateFile := outdir + "/private.pem"
	privBytes := x509.MarshalPKCS1PrivateKey(privateKey)
	privPem := &pem.Block{
		Type: "RSA PRIVATE KEY",
		Bytes: privBytes,
	}
	err = os.WriteFile(privateFile, pem.EncodeToMemory(privPem), 0600)
	if err != nil {
		errorColor.Printf("Failed to write private key: %v\n", err)
		return
	}

	publicFile := outdir + "/public.pem"
	pubBytes, err := x509.MarshalPKIXPublicKey(&privateKey.PublicKey)
	if err != nil {
		errorColor.Printf("Failed to marshal public key: %v\n", err)
		return
	}

	pubPem := &pem.Block{
		Type: "PUBLIC KEY",
		Bytes: pubBytes,
	}
	err = os.WriteFile(publicFile, pem.EncodeToMemory(pubPem), 0644)
	if err != nil {
		errorColor.Printf("Failed to write public key: %v\n", err)
		return
	}

	successColor.Printf("✓ RSA key pair generated:\n")
	fmt.Printf("  - Private key: %s\n", privateFile)
	fmt.Printf("  - Public key: %s\n", publicFile)

	infoColor.Println("\nNote: The private key should be kept secure and never shared.")
	infoColor.Println("      The public key can be used to verify RS256 tokens.")
}

func parseJWT(tokenString string) JWTComponents {
	parts := strings.Split(tokenString, ".")
	if len(parts) != 3 {
		return JWTComponents{
			Raw: tokenString,
			Valid: false,
			Error: "Invalid JWT format - must have 3 parts separated by dots.",
		}
	}

	headerBytes, err := base64.RawURLEncoding.DecodeString(parts[0])
	if err != nil {
		return JWTComponents{
			Raw: tokenString,
			Valid: false,
			Error: fmt.Sprintf("Error decoding header: %v", err),
		}
	}

	var header map[string]interface{}
	if err := json.Unmarshal(headerBytes, &header); err != nil {
		return JWTComponents{
			Raw: tokenString,
			Valid: false,
			Error: fmt.Sprintf("Error parsing header JSON: %v", err),
		}
	}

	payloadBytes, err := base64.RawURLEncoding.DecodeString(parts[1])
	if err != nil {
		return JWTComponents{
			Raw: tokenString,
			Valid: false,
			Error: fmt.Sprintf("Error decoding payload: %v", err),
		}
	}

	var payload map[string]interface{}
	if err := json.Unmarshal(payloadBytes, &payload); err != nil {
		return JWTComponents{
			Raw: tokenString,
			Valid: false,
			Error: fmt.Sprintf("Error parsing payload JSON: %v", err),
		}
	}

	return JWTComponents{
		Header: header,
		Payload: payload,
		Signature: parts[2],
		Raw: tokenString,
		Valid: true,
	}
}

func displayJWTComponents(components JWTComponents, cmd *cobra.Command) {
	if !components.Valid {
		errorColor.Printf("Error: %s\n", components.Error)
		return
	}

	var useColors = true
	if cmd != nil {
		raw, _ := cmd.Flags().GetBool("raw")
		useColors = !raw
	}

	if useColors {
		fmt.Println()
		headerColor.Println("=== JWT HEADER ===")
		displayJSONWithColors(components.Header, 0)

		fmt.Println()
		headerColor.Println("=== JWT PAYLOAD ===")
		displayJSONWithColors(components.Payload, 0)

		fmt.Println()
		headerColor.Println("=== JWT SIGNATURE ===")
		fmt.Printf("%s\n", components.Signature)
	} else {
		headerJson, _ := json.MarshalIndent(components.Header, "", "  ")
		payloadJson, _ := json.MarshalIndent(components.Payload, "", "  ")

		fmt.Println("HEADER:")
		fmt.Println(string(headerJson))
		fmt.Println("\nPAYLOAD:")
		fmt.Println(string(payloadJson))
		fmt.Printf("\nSIGNATURE:\n%s\n", components.Signature)
	}

	if exp, ok := components.Payload["exp"]; ok {
		if expFloat, ok := exp.(float64); ok {
			expTime := time.Unix(int64(expFloat), 0)
			fmt.Printf("\n")
			if time.Now().After(expTime) {
				errorColor.Printf("⚠ Token expired at: %s\n", expTime.Format(time.RFC3339))
			} else {
				infoColor.Printf("i Token expires at: %s\n", expTime.Format(time.RFC3339))
			}
		}
	}

	if nbf, ok := components.Payload["nbf"]; ok {
		if nbfFloat, ok := nbf.(float64); ok {
			nbfTime := time.Unix(int64(nbfFloat), 0)
			fmt.Printf("\n")
			if time.Now().Before(nbfTime) {
				errorColor.Printf("⚠ Token not yet valid (active at: %s)\n", nbfTime.Format(time.RFC3339))
			} else {
				infoColor.Printf("i Token become valid at: %s\n", nbfTime.Format(time.RFC3339))
			}
		}
	}

	if cmd != nil {
		secret, _ := cmd.Flags().GetString("secret")
		keyfile, _ := cmd.Flags().GetString("keyfile")

		if secret != "" || keyfile != "" {
			valid, err := validateJWT(components.Raw, secret, keyfile)
			fmt.Println()
			if valid {
				successColor.Println("✓ Signature is valid")
			} else {
				errorColor.Printf("✗ Signature is invalid: %v\n", err)
			}
		}
	}
}

func displayJSONWithColors(obj interface{}, indent int) {
	indentStr := strings.Repeat("  ", indent)

	switch v := obj.(type) {
	case map[string]interface{}:
		fmt.Println("{")
		keys := make([]string, 0, len(v))
		for k := range v {
			keys = append(keys, k)
		}

		for i, key := range keys {
			fmt.Printf("%s ", indentStr)
			keyColor.Printf("\"%s\"", key)
			fmt.Print(": ")
			displayJSONWithColors(v[key], indent+1)
			if i < len(keys) - 1 {
				fmt.Print(",")
			}
			fmt.Println()
		}
		fmt.Printf("%s}", indentStr)

	case []interface{}:
		fmt.Println("[")
		for i, item := range v {
			fmt.Printf("%s  ", indentStr)
			displayJSONWithColors(item, indent+1)
			if i < len(v) - 1 {
				fmt.Print(",")
			}
			fmt.Println()
		}
		fmt.Printf("%s]", indentStr)

	case string:
		stringColor.Printf("\"%s\"", v)

	case float64:
		numberColor.Printf("%.0f", v)
	
	case bool:
		boolColor.Printf("%t", v)
	
	case nil:
		fmt.Print("null")

	default:
		fmt.Printf("%v",v)
	}
}

func validateJWT(tokenString, secret, keyfile string) (bool, error) {
	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		switch token.Method.(type) {
		case *jwt.SigningMethodHMAC:
			if secret == "" {
				return nil, fmt.Errorf("secret key required for HMAC algorithms")
			}
			return []byte(secret), nil

		case *jwt.SigningMethodRSA:
			if keyfile == "" {
				return nil, fmt.Errorf("key file required for RSA algorithms")
			}
			keyData, err := ioutil.ReadFile(keyfile)
			if err != nil {
				return nil, fmt.Errorf("error reading key file: %v", err)
			}

			block, _ := pem.Decode(keyData)
			if block == nil {
				return nil, fmt.Errorf("failed to parse PEM block")
			}

			if block.Type == "RSA PRIVATE KEY" {
				return x509.ParsePKCS1PrivateKey(block.Bytes)
			} else if block.Type == "PRIVATE KEY" {
				return x509.ParsePKCS8PrivateKey(block.Bytes)
			} else if block.Type == "PUBLIC KEY" || block.Type == "RSA PUBLIC KEY" {
				return x509.ParsePKIXPublicKey(block.Bytes)
			}

			return nil, fmt.Errorf("unsupported key type: %s", block.Type)

		default:
			return nil, fmt.Errorf("unsupported signing method: %v", token.Header["alg"])
		}
	})

	if err != nil {
		return false, err
	}

	return token.Valid, nil
}

func generateHS256Token(claims jwt.MapClaims, secret string) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString([]byte(secret))
}

func generateRS256Token(claims jwt.MapClaims, keyfile string) (string, error) {
	keyData, err := ioutil.ReadFile(keyfile)
	if err != nil {
		return "", fmt.Errorf("error reading key file: %v", err)
	}

	block, _ := pem.Decode(keyData)
	if block == nil {
		return "", fmt.Errorf("failed to parse PEM block")
	}

	var privateKey *rsa.PrivateKey
	if block.Type == "RSA PRIVATE KEY" {
		privateKey, err = x509.ParsePKCS1PrivateKey(block.Bytes)
	} else if block.Type == "PRIVATE KEY" {
		key, err := x509.ParsePKCS8PrivateKey(block.Bytes)
		if err != nil {
			return "", err
		}
		var ok bool
		privateKey, ok = key.(*rsa.PrivateKey)
		if !ok {
			return "", fmt.Errorf("not an RSA private key")
		}
	} else {
		return "", fmt.Errorf("unsupported key type: %s", block.Type)
	}

	if err != nil {
		return "", err
	}

	token := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)
	return token.SignedString(privateKey)
}

func readInput(prompt string) string {
	if prompt != "" {
		fmt.Print(prompt)
	}

	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	return strings.TrimSpace(scanner.Text())
}

func readTokenFromInput(prompt string) string {
	fmt.Print(prompt)
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Scan()
	token := strings.TrimSpace(scanner.Text())

	if strings.HasPrefix(token, "Bearer ") {
		token = strings.TrimPrefix(token, "Bearer ")
	}

	return token
}
