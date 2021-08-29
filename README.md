<h1 align="center">
  <br>
  <a href="https://github.com/h4r5h1t-hrs/webcopilot/">WebCopilot</a>
</h1>
      
<h4 align="center">An automation tool that enumerates subdomains then filters out xss, sqli, open redirect, lfi, ssrf and rce parameters and then scans for vulnerabilities.
</h4>

<p align="center">
<a href="https://twitter.com/h4r5h1t_hrs"><img src="https://img.shields.io/twitter/follow/h4r5h1t_hrs?style=social"></a>
  <a href="https://github.com/h4r5h1t-hrs?tab=followers"><img src="https://img.shields.io/github/followers/h4r5h1t-hrs?style=social"></a>
<a href="https://github.com/h4r5h1t-hrs/webcopilot/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://github.com/h4r5h1t-hrs/webcopilot/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
<a href="#"><img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"></a>
<a href="#"><img src="https://madewithlove.org.in/badge.svg"></a>
</p>

---
This tool is inspired by [ROX4R](https://github.com/R0X4R/) work.<br/> 

The script first enumerates all the subdomains of the given target domain using assetfinder, sublister, subfinder, amass, findomain, hackertarget, riddler and crt then do active subdomain enumeration using SecLists wordlist then filters out all the live subdomains using dnsx then it extract titles of the subdomains using httpx & scans for subdomain takeover using subjack. Then it uses gauplus & waybackurls to crawl all the endpoints of the given subdomains then it use gf patterns to filters out xss, lfi, ssrf, sqli, open redirect & rce parameters from that given subdomains, and then it scans for vulnerabilities on the subdomains using different open-source tools (like kxss, dalfox, openredirex, nuclei, etc...). Then it'll print out the result of the scan and save all the output in a specified directory. <br/>

<h3>Installation</h3>

**Requirements:** Git, Golang and Python3.<br/>
**Tools Used:**<br/>
[SubFinder](https://github.com/projectdiscovery/subfinder) •
[Sublist3r](https://github.com/aboul3la/Sublist3r) •
[GF Patterns](https://github.com/1ndianl33t/Gf-Patterns) •
[OpenRedireX](https://github.com/devanshbatham/OpenRedireX) •
[dnsx](https://github.com/projectdiscovery/dnsx) •
[Assetfinder](https://github.com/tomnomnom/assetfinder) •
[HTTPX](https://github.com/projectdiscovery/httpx) •
[Kxss](https://github.com/Emoe/kxss) •
[QSreplace](https://github.com/tomnomnom/qsreplace) •
[Nuclei](https://github.com/projectdiscovery/nuclei) •
[Dalfox](https://github.com/hahwul/dalfox) •
[anew](https://github.com/tomnomnom/anew) •
[JQ](https://github.com/stedolan/jq) •
[Aquatone](https://github.com/michenriksen/aquatone) •
[urldedupe](https://github.com/ameenmaali/urldedupe) •
[Amass](https://github.com/OWASP/Amass) •
[Gauplus](https://github.com/bp0lr/gauplus) •
[waybackurls](https://github.com/tomnomnom/waybackurls) •
[crlfuzz](https://github.com/dwisiswant0/crlfuzz)
  
```bash
g!2m0:~ sudo su
g!2m0:~ apt install git
g!2m0:~ git clone https://github.com/h4r5h1t-hrs/webcopilot && cd webcopilot/ && chmod +x webcopilot install.sh && mv webcopilot /usr/bin/ && ./install.sh
```

<h3>Usage</h3>

```js
             
                                  ──────▄▀▄─────▄▀▄
                                  ─────▄█░░▀▀▀▀▀░░█▄
                                  ─▄▄──█░░░░░░░░░░░█──▄▄
                                  █▄▄█─█░░▀░░┬░░▀░░█─█▄▄█
  vv██╗░░░░░░░██╗███████╗██████╗░░█████╗░░█████╗░██████╗░██╗██╗░░░░░░█████╗░████████╗
```v██║░░██╗░░██║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║██║░░░░░██╔══██╗╚══██╔══╝
```░╚██╗████╗██╔╝█████╗░░██████╦╝██║░░╚═╝██║░░██║██████╔╝██║██║░░░░░██║░░██║░░░██║░░░
```░░████╔═████║░██╔══╝░░██╔══██╗██║░░██╗██║░░██║██╔═══╝░██║██║░░░░░██║░░██║░░░██║░░░
```░░╚██╔╝░╚██╔╝░███████╗██████╦╝╚█████╔╝╚█████╔╝██║░░░░░██║███████╗╚█████╔╝░░░██║░░░
```░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░╚════╝░░░░╚═╝░░░
                                                         [●] @h4r5h1t.hrs | G!2m0

Usage:
webcopilot -d <target>
webcopilot -d <target> -s
webcopilot [-d target] [-o output destination] [-t threads] [-b blind server URL] [-x exclude domains]

Flags:  
  -d        Add your target [Requried]
  -o        To save outputs in folder [Default: domain.com]
  -t        Number of threads [Default: 100]
  -b        Add your server for BXSS [Default: False]
  -x        Exclude out of scope domains [Default: False]
  -s        Run only Subdomain Enumeration [Default: False]
  -h        Show this help message

Example: webcopilot  -d domain.com -o domain -t 333 -x exclude.txt -b testServer.xss
Use https://xsshunter.com/ or https://interact.projectdiscovery.io/ to get your server
```
**Exaple Usage** 

```bash
g!2m0:~ webcopilot -d bugcrowd.com
```
For only subdomain enumerations
```bash
g!2m0:~ webcopilot -d bugcrowd.com -s 
```
Add thrads to your scan for faster result
```bash
g!2m0:~ webcopilot -d bugcrowd.com -o domain -t 333 
```
For blind xss, you can get your server from [xsshunter](https://xsshunter.com/) or [interact](https://interact.projectdiscovery.io/)
```bash 
g!2m0:~ webcopilot -d bugcrowd.com -o bugcrowd -t 333 -b testServer.xss
```
Exclude out of scope domains
```bash
g!2m0:~ echo out.bugcrowd.com > excludeDomain.txt
g!2m0:~ webcopilot -d bugcrowd.com -o bugcrowd -t 333 -x excludeDomain.txt -b testServer.xss
```

**Fix errors while using or installing webcopilot**
```
    Error: ./install.sh : /bin/bash^M : bad interpretor: No such file or directory
    Fix: sed -i -e 's/\r$//' install.sh
 ```

#### Thanks to the authors of the tools used in this script.

[@aboul3la](https://github.com/aboul3la) [@tomnomnom](https://github.com/tomnomnom) [@lc](https://github.com/lc) [@hahwul](https://github.com/hahwul) [@projectdiscovery](https://github.com/projectdiscovery) [@maurosoria](https://github.com/maurosoria) [@shelld3v](https://github.com/shelld3v) [@devanshbatham](https://github.com/devanshbatham) [@michenriksen](https://github.com/michenriksen) [@defparam](https://github.com/defparam/) [@projectdiscovery](https://github.com/projectdiscovery) [@bp0lr](https://github.com/bp0lr/) [@ameenmaali](https://github.com/ameenmaali) [@dwisiswant0](https://github.com/dwisiswant0) [@OWASP](https://github.com/OWASP/) [@1ndianl33t](https://github.com/1ndianl33t)

**Special Thanks to [ROX4R](https://github.com/R0X4R/)**

**Warning:**  Developers assume no liability and are not responsible for any misuse or damage cause by this tool. So, please se with caution because you are responsible for your own actions.
