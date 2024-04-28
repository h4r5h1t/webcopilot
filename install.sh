#!/bin/bash

#Colors Output
NORMAL="\e[0m"
BOLD="\033[01;01m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
LCYAN="\033[1;36m"

# Check if the script is running as root or not
if [ "$(id -u)" != "0" ]; then
    echo -e "${RED}[*]${NORMAL} This script must be run as root" 1>&2
    echo -e "${YELLOW}[*]${NORMAL} Make sure you're root before installing the tools"
    echo -e "${LCYAN}[*]${NORMAL} Exiting..."
    exit 1
fi
clear
cd

# Create Directories
dirs(){
    echo -e "${LCYAN}[*]${NORMAL} Creating Directories"
    mkdir -p ~/tools
    mkdir -p ~/.gf
    mkdir -p ~/wordlists
    mkdir -p ~/wordlists/payloads/
}

# Update and Upgrade System
echo -e "${LCYAN}[*]${NORMAL} Updating and Upgrading System"
sudo apt-get update -y 2> /dev/null

# Install Dependencies
dependencies(){
    echo -e "${LCYAN}[*]${NORMAL} Installing Dependencies and Checking is Installed or Not"
    if ! command -v git &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} git could not be found ${LCYAN}[*]${NORMAL} Installing git"
        sudo apt install git -y 2> /dev/null
        if command -v git &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} git is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} git is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} git is already installed"
    fi

    if ! command -v python3 &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} python3 could not be found ${LCYAN}[*]${NORMAL} Installing python3"
        sudo apt install python3 -y 2> /dev/null
        if command -v python3 &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} python3 is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} python3 is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} python3 is already installed"
    fi

    if ! command -v pip3 &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} pip3 could not be found ${LCYAN}[*]${NORMAL} Installing python3-pip"
        sudo apt install python3-pip -y 2> /dev/null
        if command -v pip3 &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} python3-pip is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} python3-pip is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} python3-pip is already installed"
    fi

    # # Set Python3 Environment Variables if not set
    # if [ -z "$PYTHONPATH" ]; then
    #     echo -e "${LCYAN}[*]${NORMAL} Setting Up Python3 Environment Variables"
    #     echo 'export PYTHONPATH=$HOME/.local/lib/python3.8/site-packages' >> ~/.bashrc
    #     echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
    #     source ~/.bashrc
    #     if [ -z "$PYTHONPATH" ]; then
    #         echo -e "${RED}[*]${NORMAL} Python3 Environment Variables are not set, Please set it manually"
    #     else
    #         echo -e "${GREEN}[*]${NORMAL} Python3 Environment Variables are set successfully"
    #     fi
    # else 
    #     echo -e "${GREEN}[*]${NORMAL} Python3 Environment Variables are already set"
    # fi


    if ! command -v ruby &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} ruby could not be found ${LCYAN}[*]${NORMAL} Installing ruby"
        sudo apt install ruby -y 2> /dev/null
        if command -v ruby &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} ruby is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} ruby is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} ruby is already installed"
    fi

    # # Set Ruby Environment Variables if not set
    # if [ -z "$GEM_HOME" ]; then
    #     echo -e "${LCYAN}[*]${NORMAL} Setting Up Ruby Environment Variables"
    #     echo 'export GEM_HOME=$HOME/.gem' >> ~/.bashrc
    #     echo 'export PATH=$PATH:$GEM_HOME/bin' >> ~/.bashrc
    #     source ~/.bashrc
    #     if [ -z "$GEM_HOME" ]; then
    #         echo -e "${RED}[*]${NORMAL} Ruby Environment Variables are not set, Please set it manually"
    #     else
    #         echo -e "${GREEN}[*]${NORMAL} Ruby Environment Variables are set successfully"
    #     fi
    # else 
    #     echo -e "${GREEN}[*]${NORMAL} Ruby Environment Variables are already set"
    # fi

    if ! command -v go &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} golang-go could not be found ${LCYAN}[*]${NORMAL} Installing golang-go"
        # sudo apt install golang-go -y 2> /dev/null
        wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
        sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
        echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
        echo 'export GOPATH=$HOME/go' >> ~/.bashrc
        source ~/.bashrc
        if command -v go &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} golang-go is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} golang-go is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} golang-go is already installed"
    fi

    # # Set Go Environment Variables if not set
    # if [ -z "$GOPATH" ]; then
    #     echo -e "${LCYAN}[*]${NORMAL} Setting Up Go Environment Variables"
        # echo 'export GOPATH=$HOME/go' >> ~/.bashrc
        # echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
    #     source ~/.bashrc
    #     if [ -z "$GOPATH" ]; then
    #         echo -e "${RED}[*]${NORMAL} Go Environment Variables are not set, Please set it manually"
    #     else
    #         echo -e "${GREEN}[*]${NORMAL} Go Environment Variables are set successfully"
    #     fi
    # else 
    #     echo -e "${GREEN}[*]${NORMAL} Go Environment Variables are already set"
    # fi

    if ! command -v snapd &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} snapd could not be found ${LCYAN}[*]${NORMAL} Installing snapd"
        sudo apt install snapd -y 2> /dev/null
        if command -v snapd &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} snapd is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} snapd is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} snapd is already installed"
    fi

    if ! command -v cmake &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} cmake could not be found ${LCYAN}[*]${NORMAL} Installing cmake"
        sudo apt install cmake -y 2> /dev/null
        if command -v cmake &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} cmake is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} cmake is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} cmake is already installed"
    fi

    if ! command -v jq &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} jq could not be found ${LCYAN}[*]${NORMAL} Installing jq"
        sudo apt install jq -y 2> /dev/null
        if command -v jq &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} jq is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} jq is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} jq is already installed"
    fi

    if ! command -v gobuster &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} gobuster could not be found ${LCYAN}[*]${NORMAL} Installing gobuster"
        sudo apt install gobuster -y 2> /dev/null
        if command -v gobuster &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} gobuster is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} gobuster is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} gobuster is already installed"
    fi

    if ! command -v chromium &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} chromium could not be found ${LCYAN}[*]${NORMAL} Installing chromium"
        sudo snap install chromium 2> /dev/null
        if command -v chromium &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} chromium is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} chromium is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} chromium is already installed"
    fi

    if ! command -v parallel &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} parallel could not be found ${LCYAN}[*]${NORMAL} Installing parallel"
        sudo apt-get install -y parallel 2> /dev/null
        if command -v parallel &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} parallel is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} parallel is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} parallel is already installed"
    fi
}

sleep 2s
clear

# Install Python Tools
python_tools(){
    echo -e "${LCYAN}[*]${NORMAL} Installing Python Tools"
    ### Replace aboul3la/Sublist3r with SUBLIST3R_V2.0 by hxlxmjxbbxs - Visit here: (https://github.com/hxlxmjxbbxs/sublist3rV2)
    # cd && git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt 2> /dev/null
    if [ ! -d ~/tools/SUBLIST3R_V2.0 ]; then
        echo -e "${YELLOW}[*]${NORMAL} Sublist3r could not be found ${LCYAN}[*]${NORMAL} Installing Sublist3r"
        cd && git clone https://github.com/hxlxmjxbbxs/SUBLIST3R_V2.0 ~/tools/SUBLIST3R_V2.0 && cd ~/tools/SUBLIST3R_V2.0 && sudo pip3 install -r requirements.txt 2> /dev/null
        if [ -d ~/tools/SUBLIST3R_V2.0 ]; then
            echo -e "${GREEN}[*]${NORMAL} Sublist3r is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} Sublist3r is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} Sublist3r is already installed"
    fi
    
    if [ ! -d ~/tools/sqlmap ]; then
        echo -e "${YELLOW}[*]${NORMAL} sqlmap could not be found ${LCYAN}[*]${NORMAL} Installing sqlmap"
        cd && git clone https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap/ 2> /dev/null
        if [ -d ~/tools/sqlmap ]; then
            echo -e "${GREEN}[*]${NORMAL} sqlmap is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} sqlmap is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} sqlmap is already installed"
    fi

    if [ ! -d ~/tools/urldedupe ]; then
        echo -e "${YELLOW}[*]${NORMAL} urldedupe could not be found ${LCYAN}[*]${NORMAL} Installing urldedupe"
        cd && git clone https://github.com/ameenmaali/urldedupe.git ~/tools/urldedupe && cd ~/tools/urldedupe && cmake CMakeLists.txt && make && mv urldedupe /usr/bin/ 2> /dev/null
        if [ -d ~/tools/urldedupe ]; then
            echo -e "${GREEN}[*]${NORMAL} urldedupe is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} urldedupe is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} urldedupe is already installed"
    fi

    if [ ! -d ~/tools/openredirex ]; then
        echo -e "${YELLOW}[*]${NORMAL} openredirex could not be found ${LCYAN}[*]${NORMAL} Installing openredirex"
        cd && git clone https://github.com/devanshbatham/openredirex ~/tools/openredirex && cd ~/tools/openredirex && sudo chmod +x setup.sh && ./setup.sh 2> /dev/null
        if [ -d ~/tools/urldedupe ]; then
            echo -e "${GREEN}[*]${NORMAL} openredirex is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} openredirex is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} openredirex is already installed"
    fi

    if [ ! -d ~/tools/waymore ]; then
        echo -e "${YELLOW}[*]${NORMAL} waymore could not be found ${LCYAN}[*]${NORMAL} Installing waymore"
        ### Replace gau/gauplus, and waybackurls with waymore by xnl-h4ck3r - Visit here: (https://github.com/xnl-h4ck3r/waymore)
        cd && git clone https://github.com/xnl-h4ck3r/waymore.git ~/tools/waymore && cd ~/tools/waymore && sudo pip3 install -r requirements.txt 2> /dev/null
        if [ -d ~/tools/waymore ]; then
            echo -e "${GREEN}[*]${NORMAL} waymore is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} waymore is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} waymore is already installed"
    fi

    if ! command -v findomain &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} findomain could not be found ${LCYAN}[*]${NORMAL} Installing findomain"
        cd ~/tools/ && wget https://github.com/Findomain/Findomain/releases/download/9.0.4/findomain-linux.zip && unzip findomain-linux.zip && chmod +x findomain && mv findomain /usr/bin/ 2> /dev/null
        if command -v findomain &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} findomain is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} findomain is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} findomain is already installed"
    fi

    if ! command -v uro &> /dev/null; then
        echo -e "${YELLOW}[*]${NORMAL} uro could not be found ${LCYAN}[*]${NORMAL} Installing uro"
        pip3 install uro
        if command -v uro &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} uro is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} uro is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} uro is already installed"
    fi
}

# Install Wordlists
wordlists(){
    echo -e "${LCYAN}[*]${NORMAL} Installing Wordlists and Payloads"
    local base_url="https://raw.githubusercontent.com"
    cd ~/wordlists/

    # Define an associative array for files and URLs
    declare -A files=(
        ["big.txt"]="${base_url}/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt"
        ["dicc.txt"]="https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt"
        ["dns.txt"]="${base_url}/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt"
        ["subdomains.txt"]="${base_url}/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt"
        ["resolvers.txt"]="${base_url}//janmasarik/resolvers/master/resolvers.txt"
        ["fuzz.txt"]="${base_url}//Bo0oM/fuzz.txt/master/fuzz.txt"
        ["payloads/lfi.txt"]="${base_url}//R0X4R/Garud/master/.github/payloads/lfi.txt"
    )

    # Iterate over the associative array
    for file in "${!files[@]}"; do
        if [ ! -f "$file" ]; then
            echo -e "${YELLOW}[*]${NORMAL} Downloading $file..."
            wget -O "$file" "${files[$file]}"
        else
            echo -e "${GREEN}[*]${NORMAL} Skipping $file, already exists."
        fi
    done

#     cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt
#     cd ~/wordlists/ && wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt
#     cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt -O dns.txt
#     cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
#     cd ~/wordlists/ && wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
#     cd ~/wordlists/ && wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
#     cd ~/wordlists/payloads/ && wget https://raw.githubusercontent.com/R0X4R/Garud/master/.github/payloads/lfi.txt
}
sleep 2s
clear

# Install Go Tools
go_tools(){
    echo -e "${LCYAN}[*]${NORMAL} Installing Go Tools"
    if ! command -v anew &> /dev/null && [ ! -f ~/go/bin/anew ]; then
        echo -e "${YELLOW}[*]${NORMAL} anew could not be found ${LCYAN}[*]${NORMAL} Installing anew"
        go install -v github.com/tomnomnom/anew@latest 2> /dev/null
        if command -v anew &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} anew is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} anew is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} anew is already installed"
    fi

    if ! command -v gf &> /dev/null && [ ! -f ~/go/bin/gf ]; then
        echo -e "${YELLOW}[*]${NORMAL} gf could not be found ${LCYAN}[*]${NORMAL} Installing gf"
        go install -v github.com/tomnomnom/gf@latest 2> /dev/null
        if command -v gf &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} gf is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} gf is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} gf is already installed"
    fi

    if ! command -v aquatone &> /dev/null && [ ! -f ~/go/bin/aquatone ]; then
        echo -e "${YELLOW}[*]${NORMAL} aquatone could not be found ${LCYAN}[*]${NORMAL} Installing aquatone"
        go install -v github.com/michenriksen/aquatone@latest 2> /dev/null
        if command -v aquatone &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} aquatone is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} aquatone is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} aquatone is already installed"
    fi

    if ! command -v assetfinder &> /dev/null && [ ! -f ~/go/bin/assetfinder ]; then
        echo -e "${YELLOW}[*]${NORMAL} assetfinder could not be found ${LCYAN}[*]${NORMAL} Installing assetfinder"
        go install -v github.com/tomnomnom/assetfinder@latest 2> /dev/null
        if command -v assetfinder &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} assetfinder is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} assetfinder is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} assetfinder is already installed"
    fi

    ### Switch back to gau by lc (bp0lr/gauplus - discontinued) - Visit here: (https://github.com/lc/gau)
    # if ! command -v gauplus &> /dev/null; then
    #     echo -e "${YELLOW}[*]${NORMAL} gauplus could not be found ${LCYAN}[*]${NORMAL} Installing gauplus"
    #     go install -v github.com/bp0lr/gauplus@latest 2> /dev/null
    #     if command -v gauplus &> /dev/null; then
    #         echo -e "${GREEN}[*]${NORMAL} gauplus is installed successfully"
    #     else
    #         echo -e "${RED}[*]${NORMAL} gauplus is not installed successfully, Please install it manually"
    #     fi
    # else
    #     echo -e "${GREEN}[*]${NORMAL} gauplus is already installed"
    # fi

    if ! command -v gau &> /dev/null && [ ! -f ~/go/bin/gau ]; then
        echo -e "${YELLOW}[*]${NORMAL} gau could not be found ${LCYAN}[*]${NORMAL} Installing gau"
        go install -v github.com/lc/gau/v2/cmd/gau@latest 2> /dev/null
        if command -v gau &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} gau is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} gau is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} gau is already installed"
    fi

    if ! command -v waybackurls &> /dev/null && [ ! -f ~/go/bin/waybackurls ]; then
        echo -e "${YELLOW}[*]${NORMAL} waybackurls could not be found ${LCYAN}[*]${NORMAL} Installing waybackurls"
        go install -v github.com/tomnomnom/waybackurls@latest 2> /dev/null
        if command -v waybackurls &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} waybackurls is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} waybackurls is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} waybackurls is already installed"
    fi

    if ! command -v httpx &> /dev/null && [ ! -f ~/go/bin/httpx ]; then
        echo -e "${YELLOW}[*]${NORMAL} httpx could not be found ${LCYAN}[*]${NORMAL} Installing httpx"
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest 2> /dev/null
        if command -v httpx &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} httpx is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} httpx is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} httpx is already installed"
    fi

    if ! command -v amass &> /dev/null && [ ! -f ~/go/bin/amass ]; then
        echo -e "${YELLOW}[*]${NORMAL} amass could not be found ${LCYAN}[*]${NORMAL} Installing amass"
        go install -v github.com/owasp-amass/amass/v4/...@master 2> /dev/null
        if command -v amass &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} amass is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} amass is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} amass is already installed"
    fi

    if ! command -v kxss &> /dev/null && [ ! -f ~/go/bin/kxss ]; then
        echo -e "${YELLOW}[*]${NORMAL} kxss could not be found ${LCYAN}[*]${NORMAL} Installing kxss"
        go install -v github.com/Emoe/kxss@latest 2> /dev/null
        if command -v kxss &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} kxss is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} kxss is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} kxss is already installed"
    fi

    if ! command -v subjack &> /dev/null && [ ! -f ~/go/bin/subjack ]; then
        echo -e "${YELLOW}[*]${NORMAL} subjack could not be found ${LCYAN}[*]${NORMAL} Installing subjack"
        go install -v github.com/haccer/subjack@latest 2> /dev/null
        if command -v subjack &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} subjack is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} subjack is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} subjack is already installed"
    fi

    if ! command -v qsreplace &> /dev/null && [ ! -f ~/go/bin/qsreplace ]; then
        echo -e "${YELLOW}[*]${NORMAL} qsreplace could not be found ${LCYAN}[*]${NORMAL} Installing qsreplace"
        go install -v github.com/tomnomnom/qsreplace@latest 2> /dev/null
        if command -v qsreplace &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} qsreplace is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} qsreplace is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} qsreplace is already installed"
    fi

    if ! command -v dnsx &> /dev/null && [ ! -f ~/go/bin/dnsx ]; then
        echo -e "${YELLOW}[*]${NORMAL} dnsx could not be found ${LCYAN}[*]${NORMAL} Installing dnsx"
        go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest 2> /dev/null
        if command -v dnsx &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} dnsx is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} dnsx is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} dnsx is already installed"
    fi

    if ! command -v dalfox &> /dev/null && [ ! -f ~/go/bin/dalfox ]; then
        echo -e "${YELLOW}[*]${NORMAL} dalfox could not be found ${LCYAN}[*]${NORMAL} Installing dalfox"
        go install -v github.com/hahwul/dalfox/v2@latest 2> /dev/null
        if command -v dalfox &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} dalfox is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} dalfox is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} dalfox is already installed"
    fi

    if ! command -v crlfuzz &> /dev/null && [ ! -f ~/go/bin/crlfuzz ]; then
        echo -e "${YELLOW}[*]${NORMAL} crlfuzz could not be found ${LCYAN}[*]${NORMAL} Installing crlfuzz"
        GO111MODULE=on go install -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest 2> /dev/null
        if command -v crlfuzz &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} crlfuzz is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} crlfuzz is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} crlfuzz is already installed"
    fi

    if ! command -v nuclei &> /dev/null && [ ! -f ~/go/bin/nuclei ]; then
        echo -e "${YELLOW}[*]${NORMAL} nuclei could not be found ${LCYAN}[*]${NORMAL} Installing nuclei"
        go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest 2> /dev/null
        if command -v nuclei &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} nuclei is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} nuclei is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} nuclei is already installed"
    fi

    if ! command -v subfinder &> /dev/null && [ ! -f ~/go/bin/subfinder ]; then
        echo -e "${YELLOW}[*]${NORMAL} subfinder could not be found ${LCYAN}[*]${NORMAL} Installing subfinder"
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 2> /dev/null
        if command -v subfinder &> /dev/null; then
            echo -e "${GREEN}[*]${NORMAL} subfinder is installed successfully"
        else
            echo -e "${RED}[*]${NORMAL} subfinder is not installed successfully, Please install it manually"
        fi
    else
        echo -e "${GREEN}[*]${NORMAL} subfinder is already installed"
    fi

#     if ! command -v notify &> /dev/null && [ ! -f ~/go/bin/notify ]; then
#         echo -e "${YELLOW}[*]${NORMAL} notify could not be found ${LCYAN}[*]${NORMAL} Installing notify"
#         go install -v github.com/projectdiscovery/notify/cmd/notify@latest 2> /dev/null
#         if command -v notify &> /dev/null; then
#             echo -e "${GREEN}[*]${NORMAL} notify is installed successfully"
#         else
#             echo -e "${RED}[*]${NORMAL} notify is not installed successfully, Please install it manually"
#         fi
#     else
#         echo -e "${GREEN}[*]${NORMAL} notify is already installed"
#     fi
}

sleep 2s
clear
cd

# Configure Tools and Setup Environment
configs(){
    echo -e "${LCYAN}[*]${NORMAL} Configuring Tools and Setting Up Environment"
    
    # Ensure .gf directory exists
    mkdir -p ~/.gf

    # Copy gf examples if they haven't been copied before
    if [ ! -d "~/.gf/examples" ]; then
        cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/
    fi

    # Add gf completion to bashrc if it's not already there
    if ! grep -q 'gf-completion.bash' ~/.bashrc; then
        echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
    fi

    # Add GOPATH/bin to PATH in bashrc if it's not already there
    if ! grep -q 'GOPATH/bin' ~/.bashrc; then
        echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
    fi

    # Clone Gf-Patterns and move json files if not already done
    if [ ! -d "~/Gf-Patterns" ]; then
        git clone https://github.com/1ndianl33t/Gf-Patterns ~/Gf-Patterns 2> /dev/null
        mv ~/Gf-Patterns/*.json ~/.gf
        rm -rf ~/Gf-Patterns
    fi

    # Clone Garud, move payloads, and clean up if not already done
    if [ ! -d "~/Garud" ]; then
        git clone https://github.com/R0X4R/Garud.git ~/Garud 2> /dev/null
        mv ~/Garud/.github/payloads/patterns/*.json ~/.gf
        rm -rf ~/Garud
    fi

    # # Ensure all binaries from go/bin are in /usr/bin if they aren't already there
    # find ~/go/bin/ -type f -exec bash -c 'bin_file={}; base_bin=$(basename $bin_file); [ ! -f "/usr/bin/$base_bin" ] && sudo cp "$bin_file" /usr/bin/' \;
    sudo cp ~/go/bin/* /usr/bin/

    # Update nuclei templates
    nuclei -update-templates &> /dev/null

    # echo -e "${LCYAN}[*]${NORMAL} Configuring Tools and Setting Up Environment"
    # cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/
    # echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
    # echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
    # git clone https://github.com/1ndianl33t/Gf-Patterns 2> /dev/null
    # mv ~/Gf-Patterns/*.json ~/.gf
    # git clone https://github.com/R0X4R/Garud.git 2> /dev/null
    # mv ~/Garud/.github/payloads/patterns/*.json ~/.gf
    # rm -rf ~/Garud ~/Gf-Patterns 2> /dev/null
    # sudo cp ~/go/bin/* /usr/bin/
    # nuclei -update-templates &> /dev/null
}
sleep 2s
clear

# Install Tools
echo -e "${LCYAN}[*]${NORMAL} Installing Tools"
main(){
    dirs
    dependencies
    python_tools
    wordlists
    go_tools
    configs
    echo -e "${GREEN}[*]${NORMAL} All Tools are installed successfully"
    # echo -e "${YELLOW}[*]${NORMAL} Please configure notify API's in ${BOLD}${RED}~/.config/notify/provider-config.yaml${NORMAL} file"
    # echo -e "${YELLOW}[*]${NORMAL}${BOLD} Don't forget to add your API keys in the config file of the tools"
    webcopilot -h 2> /dev/null
}

while true; do
    main
    exit
done