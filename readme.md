# Tamil Assistant

> An AI-powered Tamil language learning companion for i3 window manager, integrating with Okular PDF viewer and Google Gemini API.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Python](https://img.shields.io/badge/python-3.8%2B-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)

## 📖 Overview

Tamil Assistant is a specialized educational tool designed to help young learners understand Tamil textbooks through AI-powered contextual translations and explanations. Built as a GTK3 application, it integrates seamlessly with the i3 window manager and Okular PDF viewer, providing instant access to word meanings and grammatical context.

### The Learning Context

This tool was created for a specific educational scenario:

- **Learner**: 10-year-old Indian-Canadian student
- **Tamil Proficiency**: Limited (beginner level, 1st grade textbook)
- **English Proficiency**: Advanced (equivalent to 14-year-old, avid reader of novels)
- **French**: Learning at school
- **Teacher**: Grandmother in India (via video calls)
- **Textbook**: Tamil Nadu 1st grade curriculum
- **Challenge**: Bridging advanced English comprehension with beginner Tamil skills

The application provides age-appropriate explanations that respect the student's high reading level while teaching Tamil fundamentals, making independent study possible between video lessons with grandmother.

## 🎯 The Journey: From Concept to Implementation

### Initial Exploration: Okular Plugin Approach

We initially explored creating an **Okular sidebar plugin** to integrate Tamil translation directly into the PDF viewer. The vision was to have a native sidebar panel similar to Okular's built-in annotations and bookmarks panels.

**What we discovered:**
- Okular's plugin system only supports **Generator plugins** (for new document formats)
- Okular does NOT support custom sidebar plugins
- The sidebar has fixed built-in tabs: Thumbnails, Contents/TOC, Annotations, and Bookmarks
- Building a sidebar plugin would require modifying Okular's core codebase (not practical)

**Decision**: Abandon the Okular plugin approach.

### Second Approach: Companion Application

We pivoted to creating a **separate companion application** that could:
- Run alongside Okular
- Communicate via D-Bus to detect current page
- Appear/disappear on demand
- Integrate with i3's workflow

**Three design patterns considered:**

1. **Separate i3 Window** (Traditional tiling approach)
   - Pros: Native i3 behavior, automatic tiling
   - Cons: Takes permanent screen space, disrupts layout

2. **Floating Overlay Window** (Always-on-top approach)
   - Pros: Doesn't affect tiling, movable
   - Cons: Obtrusive, covers content, focus management issues

3. **i3 Scratchpad Integration** (Chosen solution) ✓
   - Pros: Toggle on/off instantly, non-intrusive, follows across workspaces
   - Cons: None significant
   - **Winner**: Perfect for i3 workflow

### Third Challenge: Python SDK vs REST API

Initially attempted to use Google's official Python SDK:

**First attempt**: `google-generativeai` library
```python
import google.generativeai as genai
```
- Problem: Frequent API changes, version conflicts, installation issues

**Second attempt**: `google-genai` library (newer SDK)
```python
from google import genai
from google.genai import types
```
- Problem: Complex dependency tree, still had reliability issues on Arch Linux

**Final solution**: **Pure REST API** ✓
```python
import requests  # Only dependency needed
```
- Pros: No proprietary SDK, stable, simple, works everywhere
- Cons: Slightly more verbose code
- **Result**: Rock-solid reliability, easier to maintain

We modeled the implementation after a proven working portfolio chatbot system that successfully uses REST API calls.

### Architecture Evolution

```
Initial Vision:        Reality Check:           Final Implementation:
┌─────────────┐       ┌─────────────┐         ┌─────────────┐
│   Okular    │       │   Okular    │         │   Okular    │
│  ┌────────┐ │       │  ┌────────┐ │         │             │
│  │ PDF    │ │       │  │ PDF    │ │         │   (D-Bus)   │
│  │────────│ │       │  │────────│ │         └──────┬──────┘
│  │Tamil   │ │       │  │Tamil   │ │                │
│  │Panel   │ │       │  │Panel   │ │                ▼
│  └────────┘ │       │  └────────┘ │         ┌─────────────┐
└─────────────┘       └─────────────┘         │   Tamil     │
                                               │ Assistant  │
                                               │ (Scratchpad)│
                                               └─────────────┘
```

## ✨ Features

### Core Functionality
- **📄 Full Page Analysis**: Analyze entire PDF pages to extract and explain all Tamil words
- **🔍 Quick Word Lookup**: Select any Tamil word in Okular for instant translation
- **🧠 Contextual Understanding**: Get literal translations, contextual meanings, and grammar notes
- **📚 Sentence Context**: See how words are used in complete sentences
- **📖 Poem Analysis**: Automatic detection and comprehensive summaries of Tamil poems/songs
- **🎯 Age-Appropriate Explanations**: Responses tailored for advanced young learners
- **🌍 Cultural Context**: Explanations include cultural notes when relevant
- **🔗 Wikipedia Links**: Automatic links to Wikipedia for famous Tamil personalities and entities

### Technical Features
- **Simple Launcher Integration**: Launch with Mod+Y or application menu
- **Comprehensive Logging**: Session-based logging with token usage tracking
- **Context Display**: Shows current file name and page number
- **D-Bus Communication**: Automatic detection of current page in Okular
- **REST API Integration**: Direct connection to Google Gemini API (no SDK required)
- **PDF Rendering**: High-quality page-to-image conversion for OCR
- **Configurable Prompts**: External prompt files for maximum customization
- **AUR Package**: Easy installation via Arch User Repository
- **Offline Configuration**: All settings stored locally in `config.ini`
- **Error Recovery**: Graceful fallbacks for network issues

### User Experience
- **Non-Intrusive**: Easy launcher integration with Mod+Y or application menu
- **Fast Response**: 2-3 seconds for full page analysis
- **Beautiful Tamil Rendering**: Proper font support with Noto Sans Tamil
- **Interactive Learning**: Click any word for detailed explanations
- **Clickable URLs**: Wikipedia links open directly in browser
- **Smart Analysis**: Automatic poem detection and cultural context
- **Visual Feedback**: Progress indicators and comprehensive logging

## 🎯 How It Works

```
┌─────────────────┐
│   Tamil PDF     │
│   in Okular     │
└────────┬────────┘
         │
         │ D-Bus: Get current page number & PDF path
         │
         ▼
┌─────────────────┐      ┌──────────────────┐
│  Tamil Assistant│◄────►│ Okular Interface │
│  (GTK3 Panel)   │      │  (D-Bus Client)  │
└────────┬────────┘      └──────────────────┘
         │
         │ Render page: PDF → JPEG
         │
         ▼
┌─────────────────┐      ┌──────────────────┐
│  Gemini Client  │◄────►│ Google Gemini   │
│  (REST API)     │      │  API (REST)     │
└────────┬────────┘      └──────────────────┘
         │
         │ Parse JSON response
         │
         ▼
┌─────────────────┐
│  Tamil Words    │
│  with Context   │
│  • Literal      │
│  • Contextual  │
│  • Grammar      │
│  • Sentence     │
│  • Wikipedia    │
│  • Poem Summary │
└─────────────────┘
```

## 🚀 Installation

### Option 1: AUR Package (Recommended)

**For Arch Linux users**, the Tamil Assistant is available in the AUR:

```bash
# Install from AUR
yay -S tamil-assistant
# or
paru -S tamil-assistant
# or manually:
git clone https://aur.archlinux.org/tamil-assistant.git
cd tamil-assistant
makepkg -si
```

**Post-installation setup**:
1. The package will automatically create `~/.config/tamil-assistant/config.ini` from template
2. Edit the config file and add your Google Gemini API key:
   ```bash
   nano ~/.config/tamil-assistant/config.ini
   ```
3. Add i3 bindings to your `~/.config/i3/config`:
   ```bash
   bindsym $mod+y exec tamil-assistant-launcher
   for_window [class="TamilAssistant"] move scratchpad
   for_window [class="TamilAssistant"] resize set 400 900
   for_window [class="TamilAssistant"] floating enable
   for_window [class="TamilAssistant"] move position 1520 0
   ```
4. Reload i3: `i3-msg reload`
5. Launch with `Mod+Y`

### Option 2: Manual Installation

### Prerequisites

**Operating System**: 
- EndeavourOS (or any Arch-based distro) with i3 window manager
- Should work on any Linux with i3/sway and minor adjustments

**System Dependencies**:
```bash
sudo pacman -S python python-pip python-gobject gtk3 poppler python-cairo xclip
```

**Python Version**: 3.8 or higher

**Required Accounts**:
- Google account for Gemini API access (free tier available)

### Step 1: Clone Repository

```bash
cd ~
mkdir -p Projects
cd Projects
git clone https://github.com/jalabulajunx/tamil-assistant.git
cd tamil-assistant
```

### Step 2: Install Python Dependencies

```bash
pip install --user -r requirements.txt
```

**requirements.txt**:
```
requests>=2.31.0
Pillow>=10.0.0
pdf2image>=1.16.0
dbus-python>=1.3.2
PyGObject>=3.42.0
```

### Step 3: Get Google Gemini API Key

1. Visit [Google AI Studio](https://aistudio.google.com/apikey)
2. Sign in with your Google account
3. Click "Create API Key"
4. Copy the generated key

**Pricing**: Free tier includes:
- 15 requests per minute
- 1,500 requests per day
- 1 million tokens per month
- More than enough for personal use

### Step 4: Configure Application

```bash
# Copy example config
cp config.ini.example config.ini

# Edit config with your API key
nano config.ini
```

**config.ini**:
```ini
[gemini]
# Get your API key from: https://aistudio.google.com/apikey
api_key = YOUR_GEMINI_API_KEY_HERE
model = gemini-2.5-flash-lite

[ui]
window_width = 400
window_height = 900
font_tamil = Noto Sans Tamil
font_size = 11

[okular]
dbus_service_pattern = org.kde.okular-*
dbus_path = /okular

[prompts]
# Paths to prompt files (relative to config directory)
page_analysis_prompt_file = prompts/page_analysis.txt
word_lookup_prompt_file = prompts/word_lookup.txt
```

**Note**: The application now uses external prompt files for better customization. You can modify the prompts in the `prompts/` directory to customize how the AI analyzes Tamil text.

### Step 5: Run Setup Script

```bash
chmod +x setup.sh
./setup.sh
```

This will:
- Check for missing dependencies
- Validate your configuration
- Install required system packages
- Test API connectivity
- Make scripts executable

### Step 6: Test Installation

```bash
# Test API connection
python3 test_gemini.py

# Test configuration
python3 check_config.py

# Launch application
tamil-assistant
```

### Step 7: Configure i3 Window Manager

Add these lines to your `~/.config/i3/config`:

```bash
# Tamil Assistant Integration
bindsym $mod+y exec tamil-assistant-launcher

# Window management
for_window [class="TamilAssistant"] move scratchpad
for_window [class="TamilAssistant"] resize set 400 900
for_window [class="TamilAssistant"] floating enable
for_window [class="TamilAssistant"] move position 1520 0
```

**Position adjustment for different screen sizes**:
```bash
# 1920x1080 (Full HD)
for_window [class="TamilAssistant"] move position 1520 0

# 2560x1440 (2K/QHD)
for_window [class="TamilAssistant"] move position 2160 0

# 3840x2160 (4K/UHD)
for_window [class="TamilAssistant"] move position 3440 0
```

## 📖 Usage

### Basic Workflow

1. **Open Tamil PDF**: Load your Tamil textbook in Okular
2. **Launch Assistant**: Press `Mod+Y` to open Tamil Assistant
3. **Analyze Page**: Click "Analyze Page" to get all Tamil words explained
4. **Word Lookup**: Click any Tamil word for detailed analysis
5. **Toggle Panel**: Press `Mod+Y` again to hide/show the assistant

### Features in Action

**Page Analysis**:
- Analyzes entire PDF page
- Extracts all Tamil words
- Provides contextual meanings
- Detects poems and provides summaries
- Includes Wikipedia links for famous entities

**Word Lookup**:
- Click any Tamil word in the list
- Get detailed grammar analysis
- See sentence context
- Access cultural information

**Poem Detection**:
- Automatically detects Tamil poems/songs
- Provides comprehensive summaries
- Explains cultural significance
- Tailored for young learners

## ⚙️ Configuration

### Gemini API Settings

**Available Models**:

1. **gemini-2.5-flash-lite** (Recommended)
   - Fastest response times
   - High accuracy for Tamil
   - Best for real-time learning

2. **gemini-2.0-flash-exp**
   - Experimental, cutting-edge
   - Very high accuracy
   - May have occasional issues

3. **gemini-1.5-flash**
   - Older, stable version
   - Fallback if others have issues

**Model Configuration**:
```ini
[gemini]
model = gemini-2.5-flash-lite  # Updated default
```

**Response Parameters**:
- **Temperature**: 0.2 (lower = more consistent)
- **Max Tokens**: 8192 (allows comprehensive explanations)
- **Timeout**: 30 seconds (proven reliable)

### UI Customization

**Window Dimensions**:
```ini
[ui]
window_width = 400   # Adjust for screen size
window_height = 900  # Full height recommended
```

**Tamil Font Selection**:
```ini
font_tamil = Noto Sans Tamil  # Default, best compatibility

# Alternatives (if Noto not available):
# font_tamil = Lohit Tamil
# font_tamil = TSCu_Times
# font_tamil = Tamil Sangam MN
```

**Font Sizes**:
```ini
font_size = 11  # Base size for English text

# Tamil words display at: font_size + 3 (14pt)
# Labels display at: font_size (11pt)
```

**Color Customization** (edit `tamil_sidepanel.py`):
```python
css = f"""
    list row:selected {{
        background-color: #4CAF50;  # Change selection color
    }}
    
    window {{
        background-color: #f5f5f5;  # Change background
    }}
"""
```

### Prompt Customization

The Tamil Assistant now uses external prompt files for maximum flexibility. You can customize how the AI analyzes Tamil text by editing the prompt templates.

**Prompt Files**:
```
prompts/
├── page_analysis.txt    # For analyzing entire pages
└── word_lookup.txt      # For looking up specific words
```

**Customizing Page Analysis**:
Edit `prompts/page_analysis.txt` to modify:
- Learning context (student age, proficiency level)
- Analysis depth and focus areas
- Special instructions for poems or cultural content
- Wikipedia link requirements

**Customizing Word Lookup**:
Edit `prompts/word_lookup.txt` to modify:
- Grammar analysis depth
- Cultural context requirements
- Wikipedia link inclusion rules

**Example Customization**:
```bash
# Edit the page analysis prompt
nano prompts/page_analysis.txt

# Change the student context from:
# "Student is 10 years old - very proficient in English"
# To:
# "Student is 12 years old - intermediate English proficiency"

# The AI will adjust its explanations accordingly
```

**Configuration Reference**:
```ini
[prompts]
page_analysis_prompt_file = prompts/page_analysis.txt
word_lookup_prompt_file = prompts/word_lookup.txt
```

### Screen Resolution Adjustments

**i3 Position Configuration**:

```bash
# 1920x1080 (Full HD)
for_window [title="Tamil Assistant"] move position 1520 0

# 2560x1440 (2K/QHD)
for_window [title="Tamil Assistant"] move position 2160 0

# 3840x2160 (4K/UHD)
for_window [title="Tamil Assistant"] move position 3440 0

# Formula: screen_width - panel_width - margin
# Example: 1920 - 400 - 0 = 1520
```

**Multi-Monitor Setup**:
```bash
# Position on secondary monitor (right side)
for_window [title="Tamil Assistant"] move position 3440 0

# Position on primary monitor (left side)
for_window [title="Tamil Assistant"] move position 1520 0
```

## 🏗️ Architecture

### Project Structure

```
tamil-assistant/
├── README.md                  # This file
├── LICENSE                    # MIT License
├── requirements.txt           # Python dependencies
├── .gitignore                # Git ignore rules
│
├── config.ini                # User configuration (gitignored)
├── config.ini.example        # Configuration template
│
├── config_manager.py         # Configuration loader & validator
├── gemini_client.py          # REST API client for Gemini
├── okular_interface.py       # D-Bus interface to Okular
├── tamil_sidepanel.py        # Main GTK3 application
│
├── prompts/                  # AI prompt templates
│   ├── page_analysis.txt     # Page analysis prompt
│   └── word_lookup.txt       # Word lookup prompt
│
├── test_gemini.py            # API connection test
├── check_config.py           # Configuration validator
├── setup.sh                  # Installation script
└── diagnose.sh               # Network diagnostics script
```

### Component Architecture

```
┌─────────────────────────────────────────────────────┐
│                 Tamil Assistant                     │
│                                                     │
│  ┌────────────────────────────────────────────┐   │
│  │         tamil_sidepanel.py                 │   │
│  │         (GTK3 Main Window)                 │   │
│  │  • Event handling                          │   │
│  │  • UI rendering                            │   │
│  │  • State management                        │   │
│  └──────┬──────────────────────┬──────────────┘   │
│         │                      │                   │
│         ▼                      ▼                   │
│  ┌──────────────┐      ┌──────────────┐          │
│  │ okular_      │      │ gemini_      │          │
│  │ interface.py │      │ client.py    │          │
│  │              │      │              │          │
│  │ • D-Bus      │      │ • REST API   │          │
│  │ • PDF render │      │ • JSON parse │          │
│  │ • Page track │      │ • Configurable│         │
│  │              │      │   Prompts    │          │
│  └──────┬───────┘      └──────┬───────┘          │
│         │                     │                   │
└─────────┼─────────────────────┼───────────────────┘
          │                     │
          ▼                     ▼
┌─────────────────┐      ┌──────────────────┐
│     Okular      │      │ Google Gemini    │
│   (PDF Viewer)  │      │   API (REST)     │
│                 │      │                  │
│ • PDF rendering │      │ • Text analysis  │
│ • D-Bus server  │      │ • Contextual     │
│ • Page tracking │      │   understanding  │
│                 │      │ • Cultural       │
│                 │      │   context        │
└─────────────────┘      └──────────────────┘
```

### Data Flow

```
1. User opens Tamil PDF in Okular
   ↓
2. User launches Tamil Assistant (Mod+Y)
   ↓
3. Assistant queries Okular via D-Bus:
   - Current page number
   - PDF file path
   ↓
4. Assistant renders PDF page to JPEG image
   ↓
5. Assistant sends image to Gemini API with prompt
   ↓
6. Gemini analyzes image and returns JSON:
   - Tamil words with translations
   - Contextual meanings
   - Grammar notes
   - Cultural context
   - Wikipedia links
   ↓
7. Assistant parses JSON and displays results
   ↓
8. User can click words for detailed analysis
```

## 🔧 Logging & Analytics

### Session Logging

The Tamil Assistant automatically logs all activities to help track learning progress and API usage.

**Log Location**: `logs/tamil_assistant_YYYYMMDD_HHMMSS.log`

**Logged Information**:
- **File Name**: Current PDF being analyzed
- **Page Number**: Specific page being processed
- **Tokens Sent**: Number of tokens sent to Gemini API
- **Tokens Received**: Number of tokens in response
- **Date & Time**: Timestamp of each operation
- **API Response Time**: How long each request took
- **Error Messages**: Any issues encountered

**Example Log Entry**:
```
2024-01-15 14:30:25 [INFO] Analyzing page: tamil_textbook.pdf, page 12
2024-01-15 14:30:28 [INFO] API request completed: 1,250 tokens sent, 850 tokens received
2024-01-15 14:30:28 [INFO] Found 8 Tamil words, 1 poem detected
```

**Benefits**:
- **Progress Tracking**: See which pages have been analyzed
- **API Usage Monitoring**: Track token consumption
- **Performance Analysis**: Identify slow pages or API issues
- **Learning Analytics**: Understand study patterns

## 🚨 Troubleshooting

### Common Issues

#### 1. Configuration Errors

**Error**: `Configuration file not found`
**Solution**: 
```bash
cp config.ini.example config.ini
nano config.ini  # Add your API key
```

**Error**: `Configuration Error` due to missing API key
**Solution**: 
```bash
# Check config.ini and set the api_key
nano config.ini
# Set: api_key = YOUR_GEMINI_API_KEY_HERE
```

#### 2. API Connection Issues

**Error**: `Gemini API request failed`
**Solutions**:
1. **Check API Key**: Verify it's correct in `config.ini`
2. **Test Connection**: Run `python3 test_gemini.py`
3. **Check Quota**: Visit [Google AI Studio](https://aistudio.google.com/apikey) to check usage
4. **Network Issues**: Run `./diagnose.sh` for network diagnostics

**Error**: `Rate limit exceeded`
**Solution**: Wait a few minutes, the free tier has rate limits

#### 3. Okular Integration Issues

**Error**: `No Okular instance found`
**Solutions**:
1. **Start Okular**: Make sure Okular is running
2. **Check D-Bus**: Run `qdbus --list-sessions | grep okular`
3. **Restart Okular**: Close and reopen Okular
4. **Check PDF**: Make sure a PDF is loaded

**Error**: `Could not get current page`
**Solutions**:
1. **Navigate to page**: Click on a page in Okular
2. **Check PDF format**: Some PDFs may not be compatible
3. **Restart Assistant**: Close and reopen Tamil Assistant

#### 4. i3 Window Manager Issues

**Problem**: Tamil Assistant launching but not appearing in view, or other applications not launching until `Mod+Y` is pressed and appearing in the same position/dimensions as Tamil Assistant.

**Root Cause**: The i3 window rules using `[title="Tamil Assistant"]` were too broad and affecting other applications.

**Solution**: Change i3 configuration rules from `[title="Tamil Assistant"]` to `[class="TamilAssistant"]` in `~/.config/i3/config`:

```bash
# OLD (problematic):
for_window [title="Tamil Assistant"] move scratchpad
for_window [title="Tamil Assistant"] resize set 400 900
for_window [title="Tamil Assistant"] floating enable
for_window [title="Tamil Assistant"] move position 1520 0

# NEW (fixed):
for_window [class="TamilAssistant"] move scratchpad
for_window [class="TamilAssistant"] resize set 400 900
for_window [class="TamilAssistant"] floating enable
for_window [class="TamilAssistant"] move position 1520 0
```

**Verification Steps**:
1. Update i3 config with the new rules
2. Reload i3: `i3-msg reload`
3. Test launching other applications (they should work normally)
4. Test Tamil Assistant with `Mod+Y` (should work as expected)

#### 5. Font Issues

**Error**: Tamil text not displaying properly
**Solutions**:
1. **Install Tamil Font**: `sudo pacman -S noto-fonts`
2. **Check Font Config**: Run `fc-list | grep Tamil`
3. **Update Config**: Set `font_tamil = Noto Sans Tamil` in `config.ini`

#### 6. Permission Issues

**Error**: `Permission denied` when running scripts
**Solution**:
```bash
chmod +x *.py *.sh
```

### Debug Mode

Enable debug logging by editing `config.ini`:
```ini
[logging]
level = DEBUG
```

### Network Diagnostics

Run the diagnostic script:
```bash
./diagnose.sh
```

This will check:
- Internet connectivity
- DNS resolution
- API endpoint accessibility
- Firewall settings

### Performance Issues

**Slow Page Analysis**:
1. **Check Image Quality**: Lower quality PDFs take longer
2. **Reduce Window Size**: Smaller windows render faster
3. **Check API Response**: Run `python3 test_gemini.py`

**High Memory Usage**:
1. **Close Other Apps**: Free up system memory
2. **Restart Assistant**: Close and reopen the application
3. **Check PDF Size**: Very large PDFs use more memory

## 🎯 Recent Enhancements

### Poem Analysis
- **Automatic Detection**: AI now detects Tamil poems and songs automatically
- **Comprehensive Summaries**: Provides detailed explanations of poem themes and cultural significance
- **Age-Appropriate**: Summaries tailored for 10-year-old learners with advanced English skills
- **Cultural Context**: Explains the meaning and importance of Tamil poetry

### Interactive Wikipedia Links
- **Automatic Detection**: Identifies famous Tamil personalities, poets, scholars, and historical figures
- **Clickable Links**: Wikipedia URLs are automatically converted to clickable links
- **In-App Browsing**: Links open directly in the default browser
- **Contextual Integration**: Links are seamlessly integrated into explanations

### Simplified Launching
- **One-Key Access**: Launch Tamil Assistant with `Mod+Y`
- **Scratchpad Integration**: Appears/disappears instantly without affecting window layout
- **Context Display**: Shows current file name and page number
- **Smart Positioning**: Automatically positions for optimal viewing

## 🔮 Future Enhancements

### Planned Features
- **Voice Integration**: Text-to-speech for Tamil pronunciation
- **Progress Tracking**: Learning analytics and progress reports
- **Custom Dictionaries**: User-defined word lists and translations
- **Multi-Language Support**: Support for other Indian languages
- **Offline Mode**: Local Tamil dictionary for basic lookups
- **Study Modes**: Flashcards, quizzes, and interactive exercises

### Technical Improvements
- **Performance Optimization**: Faster page rendering and analysis
- **Better Error Handling**: More robust error recovery
- **Enhanced UI**: Improved visual design and user experience
- **Plugin System**: Extensible architecture for custom features
- **Mobile Support**: Companion mobile app for on-the-go learning

## 🤝 Contributing

### Development Setup

1. **Fork Repository**: Create your own fork on GitHub
2. **Clone Fork**: `git clone https://github.com/yourusername/tamil-assistant.git`
3. **Create Branch**: `git checkout -b feature/your-feature-name`
4. **Make Changes**: Implement your feature or fix
5. **Test Thoroughly**: Ensure all functionality works
6. **Submit PR**: Create pull request with detailed description

### Code Style

- **Python**: Follow PEP 8 guidelines
- **Comments**: Document complex logic and functions
- **Error Handling**: Include proper exception handling
- **Logging**: Use appropriate log levels
- **Testing**: Include tests for new features

### Areas for Contribution

- **UI Improvements**: Better visual design and user experience
- **Performance**: Optimize rendering and API calls
- **Documentation**: Improve guides and examples
- **Testing**: Add comprehensive test coverage
- **Features**: Implement planned enhancements
- **Bug Fixes**: Address reported issues

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Google Gemini API**: For providing powerful AI capabilities
- **Okular Team**: For the excellent PDF viewer and D-Bus integration
- **i3 Window Manager**: For the flexible tiling window management
- **Tamil Language Community**: For preserving and promoting Tamil culture
- **Arch Linux Community**: For the robust package management system

## 📞 Support

### Getting Help

1. **Check Documentation**: Review this README and troubleshooting section
2. **Search Issues**: Look through existing GitHub issues
3. **Create Issue**: Submit detailed bug reports or feature requests
4. **Community**: Join discussions in the GitHub discussions section

### Reporting Issues

When reporting issues, please include:
- **Operating System**: Distribution and version
- **Error Messages**: Complete error output
- **Steps to Reproduce**: Detailed reproduction steps
- **Configuration**: Relevant config.ini settings (remove API key)
- **Log Files**: Relevant log entries (remove sensitive information)

### Feature Requests

For feature requests, please include:
- **Use Case**: How the feature would help your learning
- **Expected Behavior**: What you'd like to see
- **Current Workarounds**: How you currently handle this need
- **Priority**: How important this is for your use case

---

**Happy Learning! 📚✨**

The Tamil Assistant is designed to make Tamil language learning accessible, engaging, and effective. Whether you're a young learner studying with your grandmother or an adult exploring Tamil literature, this tool aims to bridge the gap between languages and cultures.

*"தமிழ் கற்றல் மகிழ்ச்சி!" (Tamil Learning is Joy!)*