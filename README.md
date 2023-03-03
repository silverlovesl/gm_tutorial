# Setup

# Documentation
- [Desing Guideline](https://www.figma.com/file/MIi4Sxgr8gzMQ7Q8qJaZyg/DG-APP-Epic---WIP?node-id=3%3A1011&t=AYvQ5rhvoK348jQY-0)

## Installation
```bash
# Download flutter installer
curl https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.7.5-stable.zip --output flutter_macos_arm64_3.7.5-stable.zip

# Unzip
sudo unzip ./flutter_macos_arm64_3.7.5-stable.zip -d /usr/local/flutter

 # Set to .bash_profile
export PATH=/usr/local/flutter/bin:$PATH

source ~/.bash_profile

# Check install
flutter doctor

# Run upgrade if need
flutter upgrade
```

## Proxy 
Configuring Flutter to use a mirror site
```bash
# Set to .bash_profile
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
source ~/.bash_profile
```


# Code Style
To make sure that all developers in the team use same code formatting.
Set following into .vscode/settings
```json
{
  "dart.lineLength": 160,
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false,
    "editor.codeActionsOnSave": {
      "source.fixAll": true
    }
  }
}
```

# Start app
https://go.microsoft.com/fwlink/?linkid=830387

From CLI
```bash
# List all available devices
flutter devices

#iPhone 14 Pro Max (mobile) • E5AC5E49-308D-461C-A175-EEA7FA718FA9 • ios            • com.apple.CoreSimulator.SimRuntime.iOS-16-2 (simulator)
#macOS (desktop)            • macos                                • darwin-arm64   • macOS 13.2.1 22D68 darwin-arm64
#Chrome (web)               • chrome                               • web-javascript • Google Chrome 110.0.5481.100

flutter run -d E5AC5E49-308D-461C-A175-EEA7FA718FA9 # Your device UUID
```

From vscode runner


# Generate Freezed Code

- [Freezed](https://github.com/rrousselGit/freezed)

```bash
make freeze
```


# Localization
[How to internationalize Flutter apps](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
```bash
make i18n
```