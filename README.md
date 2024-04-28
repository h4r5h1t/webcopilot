<h1 align="center"><a href="https://github.com/h4r5h1t/webcopilot/">WebCopilot</a></h1>
<h4 align="center">An automation tool that enumerate subdomains then filters out xss, sqli, open redirect, lfi, ssrf and rce parameters and then scans for vulnerabilities.</h4>

<p align="center">
<a href="https://twitter.com/h4r5h1t_hrs"><img src="https://img.shields.io/twitter/follow/h4r5h1t_hrs?style=social"></a>
<a href="https://github.com/h4r5h1t?tab=followers"><img src="https://img.shields.io/github/followers/h4r5h1t?style=social"></a>
<a href="https://github.com/h4r5h1t/webcopilot/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://github.com/h4r5h1t/webcopilot/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
<a href="#"><img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"></a>
<a href="#"><img src="https://madewithlove.org.in/badge.svg"></a>
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installing-webCopilot">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#running-webcopilot">WebCopilot</a> •
  <a href="#tools-used">Tools Used</a> •
  <a href="#acknowledgement">Acknowledgement</a>
</p>

---

**WebCopilot** is an automation tool designed to enumerate subdomains of the target and detect bugs using different open-source tools.

The script first enumerate all the subdomains of the given target domain using assetfinder, sublister, subfinder, amass, findomain, hackertarget, riddler and crt then do active subdomain enumeration using gobuster from SecLists wordlist then filters out all the live subdomains using dnsx then it extract titles of the subdomains using httpx & scans for subdomain takeover using subjack. Then it uses gau/gauplus, waybackurls, or waymore to crawl all the endpoints of the given subdomains then it use gf patterns to filters out xss, lfi, ssrf, sqli, open redirect & rce parameters from that given subdomains, and then it scans for vulnerabilities on the subdomains using different open-source tools (like kxss, dalfox, openredirex, nuclei, etc). Then it'll print out the result of the scan and save all the output in a specified directory. 

# Features

- Subdomain Enumeration using [assetfinder](https://github.com/tomnomnom/assetfinder), [SUBLIST3R_V2.0](https://github.com/hxlxmjxbbxs/SUBLIST3R_V2.0), [subfinder](https://github.com/projectdiscovery/subfinder), [amass](https://github.com/OWASP/Amass), [findomain](https://github.com/Findomain/Findomain), etc.
- Active Subdomain Enumeration using [gobuster](https://github.com/OJ/gobuster) & [amass](https://github.com/OWASP/Amass) from [SecLists/DNS](https://github.com/danielmiessler/SecLists/tree/master/Discovery/DNS) wordlist.
- Extract titles and take screenshots of live subdomains using [aquatone](https://github.com/michenriksen/aquatone) & [httpx](https://github.com/projectdiscovery/httpx).
- Crawl all the endpoints of the subdomains using [waymore](https://github.com/xnl-h4ck3r/waymore) and filter out XSS, SQLi, SSRF, etc parameters using [gf patterns](https://github.com/tomnomnom/gf).
- Run different open-source tools (like [dalfox](https://github.com/hahwul/dalfox), [nuclei](https://github.com/projectdiscovery/nuclei), [sqlmap](https://github.com/sqlmapproject/sqlmap), etc) to search for vulnerabilities on these parameters and then save all the outputs in the folder.


# Usage
```bash
g!2m0:~ webcopilot -h
```

```js                    
                                ──────▄▀▄─────▄▀▄
                                ─────▄█░░▀▀▀▀▀░░█▄
                                ─▄▄──█░░░░░░░░░░░█──▄▄
                                █▄▄█─█░░▀░░┬░░▀░░█─█▄▄█
 ██╗░░░░░░░██╗███████╗██████╗░░█████╗░░█████╗░██████╗░██╗██╗░░░░░░█████╗░████████╗
░██║░░██╗░░██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║██║░░░░░██╔══██╗╚══██╔══╝
░╚██╗████╗██╔╝█████╗░░██████╦╝██║░░╚═╝██║░░██║██████╔╝██║██║░░░░░██║░░██║░░░██║░░░
░░████╔═████║░██╔══╝░░██╔══██╗██║░░██╗██║░░██║██╔═══╝░██║██║░░░░░██║░░██║░░░██║░░░
░░╚██╔╝░╚██╔╝░███████╗██████╦╝╚█████╔╝╚█████╔╝██║░░░░░██║███████╗╚█████╔╝░░░██║░░░
░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░╚════╝░░░░╚═╝░░░
                                                                [●] Version: 2.0.0
                                                                [●] @h4r5h1t | G!2m0


[❌] Warning: Use with caution. You are responsible for your own actions.
[❌] Developers assume no liability and are not responsible for any misuse or damage cause by this tool.


Usage:
webcopilot -d <target>
webcopilot -d <target> -a
webcopilot [-d target] [-o output destination] [-t threads] [-b blind server URL] [-x exclude domains] [-f subdomains file] [-a] [-v] [-h]
Flags:
  -d        Add your target [Optional]
  -o        To save outputs in folder [Default: webcopilot-<timestamp>]
  -t        Number of threads [Default: 100]
  -b        Add your server for BXSS [Default: False]
  -x        Exclude out of scope domains [Default: False]
  -f        Specify a file containing subdomains, this will skip subdomain enumeration [Optional]
  -a        Run all Enumeration by default it will run only subdomain enumeration [Default: False][Time Consuming]
  -v        Show version of the tool
  -h        Show this help message

Example:./webcopilot  -d domain.com -a -o domain -t 333 -x exclude.txt -b testServer.oast.fun
You can use  https://app.interactsh.com/ to get your server
```
# Installing WebCopilot

WebCopilot requires **git** to install successfully. Run the following command as a **root** to install webcopilot 

```bash
git clone https://github.com/h4r5h1t/webcopilot && cd webcopilot/ && chmod +x webcopilot install.sh && mv webcopilot /usr/bin/ && ./install.sh
```
```js
[*] Installing Tools
[*] Creating Directories
[*] Installing Dependencies and Checking is Installed or Not
[*] git is already installed
[*] python3 is already installed
[*] python3-pip is already installed
[*] ruby is already installed
[*] golang-go is already installed
[*] snapd could not be found [*] Installing snapd
[*] snapd is not installed successfully, Please install it manually
[*] cmake is already installed
[*] jq is already installed
[*] gobuster is already installed
[*] chromium is already installed
[*] parallel is already installed
[*] Installing Python Tools
[*] Sublist3r could not be found [*] Installing Sublist3r
[*] Sublist3r is installed successfully
[*] sqlmap is already installed
[*] urldedupe is already installed
[*] openredirex is already installed
[*] waymore is already installed
[*] findomain is already installed
[*] uro is already installed
[*] Installing Wordlists and Payloads
[*] Skipping payloads/lfi.txt, already exists.
[*] Skipping resolvers.txt, already exists.
[*] Skipping subdomains.txt, already exists.
[*] Skipping fuzz.txt, already exists.
[*] Skipping dicc.txt, already exists.
[*] Skipping big.txt, already exists.
[*] Skipping dns.txt, already exists.
[*] Installing Go Tools
[*] anew is already installed
[*] gf is already installed
[*] aquatone could not be found [*] Installing aquatone
[*] aquatone is not installed successfully, Please install it manually
[*] assetfinder is already installed
[*] gau is already installed
[*] waybackurls is already installed
[*] httpx could not be found [*] Installing httpx
[*] httpx is not installed successfully, Please install it manually
[*] amass could not be found [*] Installing amass
[*] amass is not installed successfully, Please install it manually
[*] kxss is already installed
[*] subjack is already installed
[*] qsreplace is already installed
[*] dnsx could not be found [*] Installing dnsx
[*] dnsx is not installed successfully, Please install it manually
[*] dalfox is already installed
[*] crlfuzz is already installed
[*] nuclei could not be found [*] Installing nuclei
[*] nuclei is not installed successfully, Please install it manually
[*] subfinder could not be found [*] Installing subfinder
[*] subfinder is not installed successfully, Please install it manually
[*] Configuring Tools and Setting Up Environment
[*] All Tools are installed successfully
```

### Tools Used:

<p align="center">
<a href="https://github.com/projectdiscovery/subfinder">SubFinder</a> • 
<a href="https://github.com/aboul3la/Sublist3r">Sublist3r</a> •
<a href="https://github.com/Findomain/Findomain">Findomain</a> •
<a href="https://github.com/tomnomnom/gf">gf</a> •
<a href="https://github.com/devanshbatham/OpenRedireX">OpenRedireX</a> •
<a href="https://github.com/projectdiscovery/dnsx">dnsx</a> •
<a href="https://github.com/sqlmapproject/sqlmap">sqlmap</a> •
<a href="https://github.com/OJ/gobuster">gobuster</a> •
<a href="https://github.com/tomnomnom/assetfinder">assetfinder</a> •
<a href="https://github.com/projectdiscovery/httpx">httpx</a> •
<a href="https://github.com/Emoe/kxss">kxss</a> •
<a href="https://github.com/tomnomnom/qsreplace">qsreplace</a> •
<a href="https://github.com/projectdiscovery/nuclei">Nuclei</a> •
<a href="https://github.com/hahwul/dalfox">dalfox</a> •
<a href="https://github.com/tomnomnom/anew">anew</a> •
<a href="https://github.com/stedolan/jq">jq</a> •
<a href="https://github.com/michenriksen/aquatone">aquatone</a> •
<a href="https://github.com/ameenmaali/urldedupe">urldedupe</a> •
<a href="https://github.com/OWASP/Amass">Amass</a> •
<a href="https://github.com/bp0lr/gauplus">gauplus</a> •
<a href="https://github.com/tomnomnom/waybackurls">waybackurls</a> •
<a href="https://github.com/dwisiswant0/crlfuzz">crlfuzz</a> •
<a href="https://github.com/lc/gau">gau</a> •
<a href="https://github.com/xnl-h4ck3r/waymore">waymore</a> •
<a href="https://github.com/hxlxmjxbbxs/SUBLIST3R_V2.0">SUBLIST3R_V2.0</a> •
<a href="https://github.com/s0md3v/uro">uro</a>
</p>

## Running WebCopilot
To run the tool on a target, just use the following command.
```bash
g!2m0:~ webcopilot -d example.com
```
The `-o` command can be used to specify an output dir.
```bash
g!2m0:~ webcopilot -d example.com -o example
```
<!-- The `-s` command can be used for only subdomain enumerations (Active + Passive and also get title & screenshots). -->
The `-a` command can be used for running all enumerations (Subdomain Enumeration + Vulnerabilities Scanning).
```bash
g!2m0:~ webcopilot -d example.com -o example -a
```
The `-t` command can be used to add threads to your scan for faster result.
```bash
g!2m0:~ webcopilot -d example.com -o example -t 333 
```
The `-b` command can be used for blind xss (OOB), you can get your server from [interact](https://app.interactsh.com/)
```bash 
g!2m0:~ webcopilot -d example.com -o example -t 333 -b eeuyhzfnsezrraragtd70ex5oc2hsw.oast.fun
```
The `-x` command can be used to exclude out of scope domains.
```bash
g!2m0:~ echo out.example.com > excludeDomain.txt
g!2m0:~ webcopilot -d example.com -o example -t 333 -x excludeDomain.txt -b eeuyhzfnsezrraragtd70ex5oc2hsw.oast.fun
```
The `-f` command can be used to pass file containing subdomains (using this skip Active + Passive Subdomain enumeration)
```bash
g!2m0:~ webcopilot -d example.com -o example -f /home/ubuntu/subdomains.txt -a
```
## Example
Default options looks like this:
```bash
g!2m0:~ webcopilot -d http://testphp.vulnweb.com/ -a -b eeuyhzfpwgnsezrraragtd70ex5oc2hsw.oast.fun
```

```js
                                ──────▄▀▄─────▄▀▄
                                ─────▄█░░▀▀▀▀▀░░█▄
                                ─▄▄──█░░░░░░░░░░░█──▄▄
                                █▄▄█─█░░▀░░┬░░▀░░█─█▄▄█
 ██╗░░░░░░░██╗███████╗██████╗░░█████╗░░█████╗░██████╗░██╗██╗░░░░░░█████╗░████████╗
░██║░░██╗░░██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║██║░░░░░██╔══██╗╚══██╔══╝
░╚██╗████╗██╔╝█████╗░░██████╦╝██║░░╚═╝██║░░██║██████╔╝██║██║░░░░░██║░░██║░░░██║░░░
░░████╔═████║░██╔══╝░░██╔══██╗██║░░██╗██║░░██║██╔═══╝░██║██║░░░░░██║░░██║░░░██║░░░
░░╚██╔╝░╚██╔╝░███████╗██████╦╝╚█████╔╝╚█████╔╝██║░░░░░██║███████╗╚█████╔╝░░░██║░░░
░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░╚════╝░░░░╚═╝░░░
                                                                [●] Version: 2.0.0
                                                                [●] @h4r5h1t | G!2m0


[❌] Warning: Use with caution. You are responsible for your own actions.
[❌] Developers assume no liability and are not responsible for any misuse or damage cause by this tool.


Target:  http://testphp.vulnweb.com/
Output:  /home/ubuntu/github/webcopilot/webcopilot-1714304809
Threads: 100
Server:  eeuyhzfpwgnsezdyeragtd70ex5oc2hsw.oast.fun
Exclude: False
Mode:    Running all Enumeration
Time:    28-04-2024 17:16:49

[!] Please wait while scanning...

[●] Passive Subdomain Scanning is in progress:

[●] Subdomain Scanned  -  [assetfinder✔]                 Subdomain Found: 0
[●] Subdomain Scanned  -  [SUBLIST3R_V2.0✔]              Subdomain Found: 0
[●] Subdomain Scanned  -  [subfinder✔]                   Subdomain Found: 1
[●] Subdomain Scanned  -  [amass✔]                       Subdomain Found: 0
[●] Subdomain Scanned  -  [findomain✔]                   Subdomain Found: 1

[●] Subdomain Scanned  -  [crt.sh✔]                      Subdomain Found: 0
[●] Subdomain Scanned  -  [hackertarget✔]                Subdomain Found: 1
[●] Subdomain Scanned  -  [riddler✔]                     Subdomain Found: 0
[●] Subdomain Scanned  -  [certspotter✔]                 Subdomain Found: 0

[●] Active Subdomain Scanning is in progress:
[!] Please be patient. This may take a while...
[●] Active Subdomain Scanned  -  [gobuster✔]             Subdomain Found: 0
[●] Active Subdomain Scanned  -  [amass✔]                Subdomain Found: 0

[●] Subdomain Filtering: Filtering Alive subdomains
[●] Subdomain Filtering  -   Filtering alive subdomains is completed.    Check: /subdomains/alivesub.txt
[●] Subdomain Scanning: Getting titles of valid subdomains
[●] Visual inspection of Subdomains is completed.        Check: /subdomains/aquatone/

[●] Subdomain Enumeration Completed.    Total: 1 | Alive: 1

[●] Endpoints Scanning Completed.  Total: 0
[●] Vulnerabilities Scanning is in progress: Getting all vulnerabilities of 
[●] Vulnerabilities Scanning is in progress:

[●] Vulnerabilities Scanned  -  [XSS✔]                   Found: 0
[●] Vulnerabilities Scanned  -  [SQLi✔]                  Found: 0
[●] Vulnerabilities Scanned  -  [LFI✔]                   Found: 0
[●] Vulnerabilities Scanned  -  [CRLF✔]                  Found: 0
[●] Vulnerabilities Scanned  -  [SSRF✔]                  Found: 0
[●] Vulnerabilities Scanned  -  [Open redirect✔]         Found: 0
[●] Vulnerabilities Scanned  -  [Subdomain Takeover✔]    Found: 0
[●] Vulnerabilities Scanned  -  [Nuclie✔]                Found: 0
[●] Vulnerabilities Scanning Completed.    Check: /vulnerabilities/


▒█▀▀█ █▀▀ █▀▀ █░░█ █░░ ▀▀█▀▀
▒█▄▄▀ █▀▀ ▀▀█ █░░█ █░░ ░░█░░
▒█░▒█ ▀▀▀ ▀▀▀ ░▀▀▀ ▀▀▀ ░░▀░░

[+] Subdomains of http://testphp.vulnweb.com/
[+] Subdomains Found: 1
[+] Subdomains Alive: 1
[+] Endpoints: 0
[+] XSS: 0
[+] SQLi: 0
[+] Open Redirect: 0
[+] SSRF: 0
[+] CRLF: 0
[+] LFI: 0
[+] Subdomain Takeover: 0
[+] Nuclei: 0
```
---

### Acknowledgement
WebCopilot is inspired from [Garud](https://github.com/R0X4R/Garud) & [Pinaak](https://github.com/R0X4R/Pinaak) by [ROX4R](https://github.com/R0X4R/).  

#### Thanks to the authors of the tools & wordlists used in this script.

[@aboul3la](https://github.com/aboul3la) [@tomnomnom](https://github.com/tomnomnom) [@lc](https://github.com/lc) [@hahwul](https://github.com/hahwul) [@projectdiscovery](https://github.com/projectdiscovery) [@maurosoria](https://github.com/maurosoria) [@shelld3v](https://github.com/shelld3v) [@devanshbatham](https://github.com/devanshbatham) [@michenriksen](https://github.com/michenriksen) [@defparam](https://github.com/defparam/) [@projectdiscovery](https://github.com/projectdiscovery) [@bp0lr](https://github.com/bp0lr/) [@ameenmaali](https://github.com/ameenmaali) [@sqlmapproject](https://github.com/sqlmapproject/sqlmap) [@dwisiswant0](https://github.com/dwisiswant0) [@OWASP](https://github.com/OWASP/) [@OJ](https://github.com/OJ/) [@Findomain](https://github.com/Findomain/Findomain) [@danielmiessler](https://github.com/danielmiessler) [@1ndianl33t](https://github.com/1ndianl33t) [@ROX4R](https://github.com/R0X4R/) [@xnl-h4ck3r](https://github.com/xnl-h4ck3r/) [@hxlxmjxbbxs](https://github.com/hxlxmjxbbxs/) [@s0md3v](https://github.com/s0md3v/)

<table>
<td>
<b>Warning:</b> Developers assume no liability and are not responsible for any misuse or damage cause by this tool. So, please se with caution because you are responsible for your own actions.
</td>
</table>
