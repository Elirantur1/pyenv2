#!/bin/bash
# Script to install Python 2.7.18 locally for Digital VLSI Design HW4
# This script installs pyenv and Python 2.7.18 in your home directory
# No sudo/admin privileges required!

set -e  # Exit on any error

echo "=========================================="
echo "Python 2.7.18 Local Installation Script"
echo "For Digital VLSI Design (83-612) - HW4"
echo "=========================================="
echo ""

# Check if we're in the hw4 directory
if [ ! -f "apps/bubblesort/bsort.c" ]; then
    echo "ERROR: Please run this script from your hw4 root directory"
    echo "Usage: cd /path/to/hw4 && bash install_python2.sh"
    exit 1
fi

echo "Step 1: Installing pyenv..."
echo "----------------------------"

# Check if pyenv is already installed
if [ -d "$HOME/.pyenv" ]; then
    echo "✓ pyenv already installed at $HOME/.pyenv"
else
    echo "Installing pyenv..."
    curl https://pyenv.run | bash
    echo "✓ pyenv installed successfully"
fi

echo ""
echo "Step 2: Configuring shell environment..."
echo "-----------------------------------------"

# Add pyenv to bashrc if not already there
if ! grep -q "PYENV_ROOT" "$HOME/.bashrc"; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
    echo "✓ Added pyenv configuration to ~/.bashrc"
else
    echo "✓ pyenv already configured in ~/.bashrc"
fi

# Source the configuration for current session
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

echo ""
echo "Step 3: Installing Python 2.7.18..."
echo "------------------------------------"
echo "This may take 5-10 minutes to compile..."

# Check if Python 2.7.18 is already installed
if pyenv versions | grep -q "2.7.18"; then
    echo "✓ Python 2.7.18 already installed"
else
    pyenv install 2.7.18
    echo "✓ Python 2.7.18 installed successfully"
fi

echo ""
echo "Step 4: Setting Python 2.7.18 for hw4 directory..."
echo "---------------------------------------------------"

pyenv local 2.7.18
echo "✓ Python 2.7.18 set as default for hw4 directory"

echo ""
echo "Step 5: Verifying installation..."
echo "----------------------------------"

python --version
python2 --version

echo ""
echo "=========================================="
echo "✓ Installation Complete!"
echo "=========================================="
echo ""
echo "Python 2.7.18 is now active in your hw4 directory."
echo ""
echo "Next steps:"
echo "1. Open a new terminal OR run: source ~/.bashrc"
echo "2. Navigate to your hw4 directory"
echo "3. Run: python --version  (should show Python 2.7.18)"
echo "4. Compile your code: cd apps/bubblesort && ../sw_utils/comp_app_local.sh bsort"
echo ""
echo "Note: Python 2.7.18 will automatically activate whenever you're"
echo "      in the hw4 directory (or any subdirectory)."
echo ""
echo "If you have questions, ask on the course Discord/forum!"
echo "=========================================="
