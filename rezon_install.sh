#!/bin/bash

# =============================================================================
# Reconnaissance Tools Installation Script
# =============================================================================
# This script installs all required tools for the recon script
# =============================================================================

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[$(date '+%Y-%m-%d %H:%M:%S')]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        log_warning "Running as root. This is not recommended for security reasons."
        read -p "Do you want to continue? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Update system packages
update_system() {
    log "Updating system packages..."
    sudo apt update
    log_success "System packages updated"
}

# Install basic dependencies
install_dependencies() {
    log "Installing basic dependencies..."
    sudo apt install -y curl wget git unzip build-essential
    log_success "Basic dependencies installed"
}

# Install Go tools
install_go_tools() {
    log "Installing Go-based tools..."
    
    # Set Go environment
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    
    # Install subfinder
    log "Installing subfinder..."
    go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    if command -v subfinder &> /dev/null; then
        log_success "Subfinder installed successfully"
    else
        log_error "Failed to install subfinder"
    fi
    
    # Install katana
    log "Installing katana..."
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    if command -v katana &> /dev/null; then
        log_success "Katana installed successfully"
    else
        log_error "Failed to install katana"
    fi
    
    # Install gau
    log "Installing gau..."
    go install github.com/lc/gau/v2/cmd/gau@latest
    if command -v gau &> /dev/null; then
        log_success "Gau installed successfully"
    else
        log_error "Failed to install gau"
    fi
    
    # Install assetfinder
    log "Installing assetfinder..."
    go install github.com/tomnomnom/assetfinder@latest
    if command -v assetfinder &> /dev/null; then
        log_success "Assetfinder installed successfully"
    else
        log_error "Failed to install assetfinder"
    fi
}

# Install findomain
install_findomain() {
    log "Installing findomain..."
    
    # Install via apt (Kali/Debian)
    sudo apt install -y findomain
    
    if command -v findomain &> /dev/null; then
        log_success "Findomain installed successfully"
    else
        log_error "Failed to install findomain"
    fi
}

# Install sublist3r
install_sublist3r() {
    log "Installing sublist3r..."
    
    # Clone repository
    if [ ! -d "/opt/sublist3r" ]; then
        sudo git clone https://github.com/aboul3la/Sublist3r.git /opt/sublist3r
    fi
    
    # Install Python dependencies
    sudo pip3 install -r /opt/sublist3r/requirements.txt --break-system-packages
    
    # Create symlink
    sudo ln -sf /opt/sublist3r/sublist3r.py /usr/local/bin/sublist3r
    
    if command -v sublist3r &> /dev/null; then
        log_success "Sublist3r installed successfully"
    else
        log_error "Failed to install sublist3r"
    fi
}

# Install uro
install_uro() {
    log "Installing uro..."
    
    # Install via pip
    pip3 install uro --break-system-packages
    
    if command -v uro &> /dev/null; then
        log_success "Uro installed successfully"
    else
        log_error "Failed to install uro"
    fi
}

# Install httpx-toolkit
install_httpx_toolkit() {
    log "Installing httpx-toolkit..."
    
    # Install via apt (Kali/Debian)
    sudo apt update
    sudo apt install -y httpx-toolkit
    
    if command -v httpx-toolkit &> /dev/null; then
        log_success "httpx-toolkit installed successfully"
    else
        log_error "Failed to install httpx-toolkit"
    fi
}

# Install subdominator (optional)
install_subdominator() {
    log "Installing subdominator..."
    
    # Install via pip
    pip3 install --upgrade subdominator --break-system-packages
    
    if command -v subdominator &> /dev/null; then
        log_success "Subdominator installed successfully"
    else
        log_warning "Subdominator installation failed (optional tool)"
    fi
}

# Install nmap
install_nmap() {
    log "Installing nmap..."
    if apt update && apt install -y nmap; then
        log_success "Nmap installed successfully"
    else
        log_error "Failed to install nmap"
        return 1
    fi
}

# Install gf (gf-patterns)
install_gf() {
    log "Installing gf (gf-patterns)..."
    
    # Install gf via go
    if go install github.com/tomnomnom/gf@latest; then
        log_success "gf installed successfully"
        
        # Setup gf patterns
        log "Setting up gf patterns..."
        mkdir -p ~/.gf
        if [ ! -d ~/.gf ]; then
            git clone https://github.com/1ndianl33t/Gf-Patterns.git ~/.gf
        fi
        log_success "gf patterns configured"
    else
        log_error "Failed to install gf"
        return 1
    fi
}

# Install jshunter
install_jshunter() {
    log "Installing jshunter..."
    
    # Install jshunter via go
    if go install github.com/ThreatUnkown/jsubfinder@latest; then
        log_success "jshunter installed successfully"
    else
        log_error "Failed to install jshunter"
        return 1
    fi
}

# Install nuclei
install_nuclei() {
    log "Installing nuclei..."
    
    # Install nuclei via go
    if go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest; then
        log_success "Nuclei installed successfully"
        
        # Update nuclei templates
        log "Updating nuclei templates..."
        if nuclei -update-templates; then
            log_success "Nuclei templates updated"
        else
            log_warning "Failed to update nuclei templates"
        fi
    else
        log_error "Failed to install nuclei"
        return 1
    fi
}

# Verify all installations
verify_installations() {
    log "Verifying tool installations..."
    
    local tools=("subfinder" "findomain" "sublist3r" "assetfinder" "katana" "gau" "uro" "httpx-toolkit" "nmap" "gf" "jshunter" "nuclei")
    local missing_tools=()
    
    for tool in "${tools[@]}"; do
        if command -v "$tool" &> /dev/null; then
            log_success "$tool is installed and available"
        else
            missing_tools+=("$tool")
        fi
    done
    
    if [ ${#missing_tools[@]} -ne 0 ]; then
        log_error "Missing tools: ${missing_tools[*]}"
        return 1
    else
        log_success "All required tools are installed successfully!"
        return 0
    fi
}

# Display installation summary
display_summary() {
    echo ""
    echo "============================================================================="
    echo "                    Installation Summary"
    echo "============================================================================="
    echo ""
    echo "Installed tools:"
    echo "  • subfinder    - Fast subdomain enumeration"
    echo "  • findomain    - Cross-platform subdomain enumerator"
    echo "  • sublist3r    - Python-based subdomain enumeration"
    echo "  • assetfinder  - Domain and subdomain discovery"
    echo "  • katana       - Web crawler and URL extractor"
    echo "  • gau          - URL fetcher from various sources"
    echo "  • uro          - URL normalization and filtering"
    echo "  • httpx-toolkit - HTTP probe and port scanner"
    echo "  • nmap         - Network port scanner and service detector"
    echo "  • gf           - URL pattern filtering tool"
    echo "  • jshunter     - JavaScript endpoint hunter"
    echo "  • nuclei       - Vulnerability scanner with custom templates"
    echo ""
    echo "Optional tools:"
    echo "  • subdominator - Advanced subdomain enumeration"
    echo ""
    echo "You can now run the rezon script:"
    echo "  rezon example.com"
    echo "  rezon -f domains.txt"
    echo ""
}

# Main installation function
main() {
    echo -e "${BLUE}"
    echo "███████████   ██████████ ███████████    ███████    ██████   █████"
    echo "░░███░░░░░███ ░░███░░░░░█░█░░░░░░███   ███░░░░░███ ░░██████ ░░███ "
    echo " ░███    ░███  ░███  █ ░ ░     ███░   ███     ░░███ ░███░███ ░███ "
    echo " ░██████████   ░██████        ███    ░███      ░███ ░███░░███░███ "
    echo " ░███░░░░░███  ░███░░█       ███     ░███      ░███ ░███ ░░██████ "
    echo " ░███    ░███  ░███ ░   █  ████     █░░███     ███  ░███  ░░█████ "
    echo " █████   █████ ██████████ ███████████ ░░░███████░   █████  ░░█████"
    echo "░░░░░   ░░░░░ ░░░░░░░░░░ ░░░░░░░░░░░    ░░░░░░░    ░░░░░    ░░░░░ "
    echo ""
    echo "                    Rezon Tools Installer"
    echo "============================================================================="
    echo -e "${NC}"
    
    check_root
    update_system
    install_dependencies
    install_go_tools
    install_findomain
    install_sublist3r
    install_uro
    install_httpx_toolkit
    install_nmap
    install_gf
    install_jshunter
    install_nuclei
    install_subdominator
    
    if verify_installations; then
        display_summary
        log_success "Installation completed successfully!"
    else
        log_error "Installation completed with errors. Please check the logs above."
        exit 1
    fi
}

# Run main function
main "$@"
