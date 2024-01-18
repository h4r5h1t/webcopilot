#!/bin/bash
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    echo "Make sure you're root before installing the tools"
    exit 1
fi
# clear
cd
mkdir -p ~/tools
mkdir -p ~/tools/temp/
mkdir -p ~/tools
mkdir -p ~/.gf
mkdir -p ~/wordlists
mkdir -p ~/wordlists/payloads/

echo "Installing all dependencies"
cd
sudo apt-get install git -y 2> /dev/null
sudo apt-get install python3 -y 2> /dev/null
sudo apt-get install python3-pip -y 2> /dev/null
sudo apt-get install ruby -y 2> /dev/null
sudo apt-get install golang-go -y 2> /dev/null
sudo apt install snapd -y 2> /dev/null
sudo apt install cmake -y 2> /dev/null
sudo apt install jq -y 2> /dev/null
sudo apt install gobuster -y 2> /dev/null
sudo snap install chromium 2> /dev/null
sudo apt-get install -y parallel 2> /dev/null
sleep 2s
# clear

echo "Installing python tools"
### Replace aboul3la/Sublist3r with SUBLIST3R_V2.0 by hxlxmjxbbxs - Visit here: (https://github.com/hxlxmjxbbxs/sublist3rV2)
# cd && git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt 2> /dev/null
cd && git clone https://github.com/hxlxmjxbbxs/SUBLIST3R_V2.0 ~/tools/SUBLIST3R_V2.0 && cd ~/tools/SUBLIST3R_V2.0 && sudo pip3 install -r requirements.txt 2> /dev/null
cd && git clone https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap/ 2> /dev/null
cd && git clone https://github.com/ameenmaali/urldedupe.git ~/tools/urldedupe && cd ~/tools/urldedupe && cmake CMakeLists.txt && make && mv urldedupe /usr/bin/urldedupe 2> /dev/null
cd && git clone https://github.com/devanshbatham/openredirex ~/tools/openredirex && cd ~/tools/openredirex && sudo chmod +x setup.sh && ./setup.sh 2> /dev/null
cd ~/tools/ && wget https://github.com/Findomain/Findomain/releases/download/9.0.4/findomain-linux.zip && unzip findomain-linux.zip && chmod +x findomain && mv findomain /usr/bin/findomain 2> /dev/null
### Replace gau, gauplus, and waybackurls with waymore by xnl-h4ck3r - Visit here: (https://github.com/xnl-h4ck3r/waymore)
cd && git clone https://github.com/xnl-h4ck3r/waymore.git ~/tools/waymore && cd ~/tools/waymore && sudo python setup.py install && mv waymore.py /usr/bin/waymore 2> /dev/null

echo "Installing Wordlists & Payloads"
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt
cd ~/wordlists/ && wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt -O dns.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
cd ~/wordlists/ && wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
cd ~/wordlists/payloads/ && wget https://raw.githubusercontent.com/R0X4R/Garud/master/.github/payloads/lfi.txt
sleep 2s

echo "Installing go-lang tools"
go install -v github.com/tomnomnom/anew@latest 2> /dev/null
go install -v github.com/tomnomnom/gf@latest 2> /dev/null
go install -v github.com/michenriksen/aquatone@latest 2> /dev/null
go install -v github.com/tomnomnom/assetfinder@latest 2> /dev/null
### bp0lr/gauplus discontinued - Visit here: (https://github.com/lc/gau)
# go install -v github.com/bp0lr/gauplus@latest 2> /dev/null
go install -v github.com/lc/gau/v2/cmd/gau@latest 2> /dev/null
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest 2> /dev/null
go install -v github.com/owasp-amass/amass/v4/...@latest 2> /dev/null
go install -v github.com/tomnomnom/waybackurls@latest 2> /dev/null
go install -v github.com/Emoe/kxss@latest 2> /dev/null
go install -v github.com/haccer/subjack@latest 2> /dev/null
go install -v github.com/tomnomnom/qsreplace@latest 2> /dev/null
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest 2> /dev/null
go install -v github.com/hahwul/dalfox/v2@latest 2> /dev/null
GO111MODULE=on go install -v github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest 2> /dev/null
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest 2> /dev/null
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 2> /dev/null
# cd ~/tools/temp/ && wget https://github.com/owasp-amass/amass/releases/download/v4.2.0/amass_Linux_i386.zip && unzip amass_linux_i386.zip && cd amass_linux_i386 && mv amass /usr/bin/amass 2> /dev/null

cd
cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/
echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc 
git clone https://github.com/1ndianl33t/Gf-Patterns 2> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf
git clone https://github.com/R0X4R/Garud.git 2> /dev/null
mv ~/Garud/.github/payloads/patterns/*.json ~/.gf
rm -rf ~/Garud ~/Gf-Patterns 2> /dev/null
sudo cp ~/go/bin/* /usr/bin/
rm -rf ~/tools/temp/
nuclei -update-templates &> /dev/null
sleep 2s
# clear
