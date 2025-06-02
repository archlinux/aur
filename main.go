package main

import (
	"bufio"
	// "crypto/rand"
	// "crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"encoding/json"
	"encoding/pem"
	"fmt"
	"io/ioutil"
	"os"
	// "strconv"
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

	decodeCmd.Flags().BoolP("raw", "r", false, "Show raw JSON without colors")
	decodeCmd.Flags().StringP("secret", "s", "", "Secret key for signature validation")
	decodeCmd.Flags().StringP("keyfile", "k", "", "Path to key file for signature validation")

	rootCmd.AddCommand(decodeCmd)
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
	} // TODO: write else for without colors

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
