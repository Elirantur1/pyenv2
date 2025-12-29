# Python 2 Local Installer for VLSI Course

Quick solution for Python 2/3 compatibility issues with `s19toslm.py` script in HW4.

## Quick Install

```bash
cd /path/to/hw4
curl -O https://raw.githubusercontent.com/Elirantur1/pyenv2/main/install_python2.sh
bash install_python2.sh
source ~/.bashrc
```

Installation takes ~10 minutes. No sudo/admin access needed!

## What It Does

- Installs **pyenv** (Python version manager) in your home directory
- Installs **Python 2.7.18** locally
- Configures Python 2 to auto-activate in hw4 directory
- Doesn't affect your system Python

## Verify Installation

```bash
cd /path/to/hw4
python --version  # Should show: Python 2.7.18
```

## Usage

Once installed, Python 2.7.18 automatically activates in the hw4 directory:

```bash
cd apps/bubblesort
../sw_utils/comp_app_local.sh bsort  # Now works without errors!
```

## Troubleshooting

**"pyenv: command not found"**  
Run: `source ~/.bashrc` or open a new terminal

**"python still shows Python 3"**  
Make sure you're in hw4 directory and `.python-version` file exists

**Installation fails**  
Contact course staff or check if you have network access

## Questions?

Ask on course Discord/forum or during TA office hours.

---

Works on lab machines. Installation is per-user and per-directory.