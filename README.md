<div align="center">
  <pre style="display:inline-block; text-align:left; color:#00d4ff; background:#0a0a0a; padding:20px; border-radius:8px;">
 █████   █████   █████████  ███████████
░░███   ░░███   ███░░░░░███░░███░░░░░███
 ░███    ░███  ███     ░░░  ░███    ░███
 ░███████████ ░███          ░██████████
 ░███░░░░░███ ░███          ░███░░░░░███
 ░███    ░███ ░░███     ███ ░███    ░███
 █████   █████ ░░█████████  █████   █████
░░░░░   ░░░░░   ░░░░░░░░░  ░░░░░   ░░░░░
  </pre>
  <h1>HCR CLI Installer</h1>
  <p><strong>One command. Any project. Zero Python required.</strong></p>
  <p>
    <a href="#macos--linux"><img src="https://img.shields.io/badge/macOS-Silicon%20%7C%20Intel-000000?logo=apple&logoColor=white" alt="macOS"></a>
    <a href="#macos--linux"><img src="https://img.shields.io/badge/Linux-x64%20%7C%20ARM-000000?logo=linux&logoColor=white" alt="Linux"></a>
    <a href="#windows"><img src="https://img.shields.io/badge/Windows-x64-0078D4?logo=windows&logoColor=white" alt="Windows"></a>
    <a href="https://github.com/PantheraLabs/HybridCognitiveRuntime"><img src="https://img.shields.io/badge/version-0.2.0-00d4ff.svg" alt="Version"></a>
    <a href="https://github.com/PantheraLabs/HybridCognitiveRuntime"><img src="https://img.shields.io/badge/license-Proprietary-red.svg" alt="License"></a>
  </p>
</div>

---

## One-Line Install

### macOS / Linux

```bash
curl -fsSL https://install.hcr.dev | bash
```

### Windows (PowerShell)

```powershell
irm https://install.hcr.dev/win | iex
```

**That's it.** `hcr` is now available from any terminal, any project directory.

---

## What You Get

The HCR CLI — a commercial-grade developer tool for the <a href="https://github.com/PantheraLabs/HybridCognitiveRuntime">Hybrid Cognitive Runtime</a>.

| Feature | Description |
|---------|-------------|
| **State Management** | Initialize, inspect, and optimize `.hcr/` cognitive state |
| **Dependency Graphs** | Visualize file relationships and impact analysis |
| **Diagnostics** | `hcr doctor` checks installation health |
| **Zero Dependencies** | Single binary — no Python, no pip, no setup |

---

## Supported Platforms

| Platform | Architecture | Binary |
|----------|-------------|--------|
| macOS (Apple Silicon) | ARM64 | `hcr-macos-arm64` |
| macOS (Intel) | x64 | `hcr-macos-x64` |
| Linux | x64 | `hcr-linux-x64` |
| Windows | x64 | `hcr-windows-x64.exe` |

Binaries are built automatically on every release via GitHub Actions and published to <a href="https://github.com/PantheraLabs/hcr-install/releases">Releases</a>.

---

## Manual Install

If you prefer to download the binary yourself:

```bash
# 1. Download the latest release for your platform
#    https://github.com/PantheraLabs/hcr-install/releases/latest

# 2. Make executable (macOS / Linux)
chmod +x hcr-*

# 3. Move to your PATH
mv hcr-* /usr/local/bin/hcr
```

---

## pip Install (Developer Mode)

If you have Python installed and want the latest source:

```bash
pip install git+https://github.com/PantheraLabs/HybridCognitiveRuntime.git
```

---

## Quick Start

```bash
# Initialize HCR in any project
cd my-project
hcr init

# Check health
hcr doctor

# See what's being tracked
hcr status

# Visualize dependencies
hcr graph

# Optimize state files
hcr clean
```

---

## Architecture

```
Private Repo (source)          Public Repo (this)
===================            ==================
HybridCognitiveRuntime    -->  hcr-install
├── src/                         ├── install.sh
├── .github/workflows/           ├── install.ps1
│   └── release.yml              ├── index.html
│       ├── builds binaries      └── vercel.json
│       └── uploads to
│           hcr-install releases
```

---

## Releases

| Version | Date | macOS | Linux | Windows |
|---------|------|-------|-------|---------|
| v0.2.0 | 2026-05-05 | ✅ | ✅ | ✅ |

View all releases: <a href="https://github.com/PantheraLabs/hcr-install/releases">github.com/PantheraLabs/hcr-install/releases</a>

---

## Links

- **Main Repository**: <a href="https://github.com/PantheraLabs/HybridCognitiveRuntime">PantheraLabs/HybridCognitiveRuntime</a>
- **Documentation**: <a href="https://github.com/PantheraLabs/HybridCognitiveRuntime/tree/main/docs">docs/</a>
- **Issues**: <a href="https://github.com/PantheraLabs/HybridCognitiveRuntime/issues">GitHub Issues</a>

---

<div align="center">
  <p><strong>Built by PantheraLabs</strong></p>
  <p><em>Intelligence should persist. Context should resume.</em></p>
</div>