#!/bin/bash
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    echo "Make sure you're root before installing the tools"
    exit 1
fi
clear
cd
mkdir -p ~/tools
mkdir -p ~/tools/temp/
mkdir -p ~/tools
mkdir -p ~/.gf
mkdir -p ~/wordlists
mkdir -p ~/wordlists/payloads/

echo "Updating the system"
sudo apt-get update -y 2> /dev/null

echo "Installing all dependencies and checking is installed or not"

if ! command -v git &> /dev/null
then
    echo "git could not be found"
    sudo apt-get install git -y 2> /dev/null
fi

if ! command -v python3 &> /dev/null
then
    echo "python3 could not be found"
    sudo apt-get install python3 -y 2> /dev/null
fi

if ! command -v python3-pip &> /dev/null
then
    echo "python3-pip could not be found"
    sudo apt-get install python3-pip -y 2> /dev/null
fi

if ! command -v ruby &> /dev/null
then
    echo "ruby could not be found"
    sudo apt-get install ruby -y 2> /dev/null
fi

if ! command -v golang-go &> /dev/null
then
    echo "golang-go could not be found"
    sudo apt-get install golang-go -y 2> /dev/null
fi

if ! command -v snapd &> /dev/null
then
    echo "snapd could not be found"
    sudo apt install snapd -y 2> /dev/null
fi

if ! command -v cmake &> /dev/null
then
    echo "cmake could not be found"
    sudo apt install cmake -y 2> /dev/null
fi

if ! command -v jq &> /dev/null
then
    echo "jq could not be found"
    sudo apt install jq -y 2> /dev/null
fi

if ! command -v gobuster &> /dev/null
then
    echo "gobuster could not be found"
    sudo apt install gobuster -y 2> /dev/null
fi

if ! command -v chromium &> /dev/null
then
    echo "chromium could not be found"
    sudo snap install chromium 2> /dev/null
fi

if ! command -v parallel &> /dev/null
then
    echo "parallel could not be found"
    sudo apt-get install -y parallel 2> /dev/null
fi

sleep 2s
clear

echo "Installing python tools"
cd && git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt 2> /dev/null
cd && git clone https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap/ 2> /dev/null
cd && git clone https://github.com/ameenmaali/urldedupe.git ~/tools/urldedupe && cd ~/tools/urldedupe && cmake CMakeLists.txt && make && mv urldedupe /usr/bin/ 2> /dev/null
cd && git clone https://github.com/devanshbatham/OpenRedireX.git ~/tools/OpenRedireX && cd ~/tools/OpenRedireX && sudo pip3 install -r requirements.txt
cd ~/tools/ && wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux && chmod +x findomain-linux && mv findomain-linux /usr/bin/findomain 2> /dev/null
echo "Installing Wordlists & Payloads"
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt
cd ~/wordlists/ && wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt -O dns.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
cd ~/wordlists/payloads/ && wget https://github.com/R0X4R/Garud/edit/master/payloads/lfi.txt
sleep 2s
echo "Installing go-lang tools"
if ! command -v anew &> /dev/null
then
    echo "anew could not be found"
    go get -u github.com/tomnomnom/anew@latest 2> /dev/null
fi

if ! command -v gf &> /dev/null
then
    echo "gf could not be found"
    go get -u github.com/tomnomnom/gf@latest 2> /dev/null
fi

if ! command -v assetfinder &> /dev/null
then
    echo "assetfinder could not be found"
    go install github.com/tomnomnom/assetfinder@latest 2> /dev/null
fi

if ! command -v aquatone &> /dev/null
then
    echo "aquatone could not be found"
    go install github.com/michenriksen/aquatone@latest 2> /dev/null
fi

if ! command -v httpx &> /dev/null
then
    echo "httpx could not be found"
    go install -u github.com/projectdiscovery/httpx/cmd/httpx@latest 2> /dev/null
fi

if ! command -v kxss &> /dev/null
then
    echo "kxss could not be found"
    go install github.com/Emoe/kxss@latest 2> /dev/null
fi

if ! command -v subjack &> /dev/null
then
    echo "subjack could not be found"
    go install github.com/haccer/subjack@latest 2> /dev/null
fi

if ! command -v qsreplace &> /dev/null
then
    echo "qsreplace could not be found"
    go install -u github.com/tomnomnom/qsreplace@latest 2> /dev/null
fi

if ! command -v waybackurls &> /dev/null
then
    echo "waybackurls could not be found"
    go install github.com/tomnomnom/waybackurls@latest 2> /dev/null
fi

if ! command -v gauplus &> /dev/null
then
    echo "gauplus could not be found"
    GO111MODULE=on go get -u -v github.com/bp0lr/gauplus 2> /dev/null
fi

if ! command -v httpx &> /dev/null
then
    echo "httpx could not be found"
    GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx@latest 2> /dev/null
fi

echo "Installing other tools"

if ! command -v dnsx &> /dev/null
then
    echo "dnsx could not be found"
    go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest 2> /dev/null
fi

if ! command -v dalfox &> /dev/null
then
    echo "dalfox could not be found"
    go install github.com/hahwul/dalfox/v2@latest 2> /dev/null
fi

if ! command -v crlfuzz &> /dev/null
then
    echo "crlfuzz could not be found"
    go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest 2> /dev/null
fi

if ! command -v nuclei &> /dev/null
then
    echo "nuclei could not be found"
    go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest 2> /dev/null
fi

if ! command -v subfinder &> /dev/null
then
    echo "subfinder could not be found"
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 2> /dev/null
fi

if ! command -v amass &> /dev/null
then
    echo "amass could not be found"
    go install -v github.com/owasp-amass/amass/v4/...@master 2> /dev/null
fi

cd
cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/
echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc 
git clone https://github.com/1ndianl33t/Gf-Patterns 2> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf
git clone https://github.com/R0X4R/Garud.git 2> /dev/null
mv ~/Garud/payloads/patterns/*.json ~/.gf
rm -rf ~/Garud ~/Gf-Patterns 2> /dev/null
sudo cp ~/go/bin/* /usr/bin/
rm -rf ~/tools/temp/
nuclei -update-templates &> /dev/null
sleep 2s
clear
