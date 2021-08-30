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
go get -u github.com/tomnomnom/anew 2> /dev/null
go get -u github.com/tomnomnom/gf 2> /dev/null
go get github.com/michenriksen/aquatone 2> /dev/null
go get -u github.com/tomnomnom/assetfinder 2> /dev/null
GO111MODULE=on go get -u -v github.com/bp0lr/gauplus 2> /dev/null
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx 2> /dev/null
go get -v github.com/OWASP/Amass/v3/... 2> /dev/null
go get github.com/tomnomnom/waybackurls 2> /dev/null
go get github.com/Emoe/kxss 2> /dev/null
go get github.com/haccer/subjack 2> /dev/null
go get -u github.com/tomnomnom/qsreplace 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/dnsx.git; cd dnsx/cmd/dnsx; go build; mv dnsx /usr/bin/ &> /dev/null 
cd ~/tools/temp/ && git clone https://github.com/hahwul/dalfox && cd dalfox && go install 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/dwisiswant0/crlfuzz && cd crlfuzz/cmd/crlfuzz && go build . && sudo mv crlfuzz /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/nuclei.git && cd nuclei/v2/cmd/nuclei && go build && mv nuclei /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/subfinder.git && cd subfinder/v2/cmd/subfinder && go build && mv subfinder /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && wget https://github.com/OWASP/Amass/releases/download/v3.13.4/amass_linux_i386.zip && unzip amass_linux_i386.zip && cd amass_linux_i386 && mv amass /usr/bin/ 2> /dev/null
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
