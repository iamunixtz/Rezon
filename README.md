<h1 align="center">Rezon - Automated Bug Hunting Recon Tool</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python" />
  <img src="https://img.shields.io/github/license/iamunixtz/Rezon?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Contributions-Welcome-brightgreen?style=for-the-badge" />
  <br>
  <img src="https://img.shields.io/github/stars/iamunixtz/Rezon?style=for-the-badge&logo=github" />
  <img src="https://img.shields.io/github/issues/iamunixtz/Rezon?style=for-the-badge&logo=github" />
  <br>
  <img src="https://img.shields.io/badge/Windows-Supported-blue?style=for-the-badge&logo=window" />
  <img src="https://img.shields.io/badge/Linux-Supported-green?style=for-the-badge&logo=linux" />
  <img src="https://img.shields.io/badge/Made_in-Tanzania-orange?style=for-the-badge" />
  <img src="https://img.shields.io/github/forks/iamunixtz/Rezon?color=teal&style=for-the-badge&logo=github" />
</p>


![banner](images/rezon.png)


## What Rezon Can do?

| Feature                          | Description                                                                                                                                                                                                 |
|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Wayback Machine URL Collection** | *Fetches historical URLs from [web.archive.org](https://web.archive.org/) using various filters (All URLs, Sensitive Files, PHP, JS, PDF) to uncover past web assets.*                                    |
| **Shodan Integration**              | *Retrieves **subdomains**, **IP addresses**, **port information**, **host details** data from the Shodan API to enhance reconnaissance.*                                                                 |
| **URL Deduplication & Resolution**  | *Processes raw URLs by following redirects and deduplicating entries, resulting in a unique list of valid URLs.*                                                                                               |
| **JavaScript Scanning**             | *Scans JavaScript files to extract embedded URLs and sensitive data such as **API keys**, **AWS credentials**, **email addresses**, and **JWT tokens** using regex-based extraction techniques.*                         |
| **Dictionary-based Fuzzing**        | *Performs fuzzing on target URLs using custom wordlists by replacing a **FUZZ** placeholder, identifying valid endpoints based on configurable HTTP status code filters.*                                |
| **Graphical User Interface (GUI)**  | *Provides an intuitive PyQt5 interface with real-time logging, progress bars, and multiple control panels for scanning, **JS analysis**, **fuzzing**, and report generation.*                                |
| **Customizable Scanning Options**   | *Offers flexible options such as wildcard mode, filtering by file types (Sensitive, **PHP**, **JS**, **PDF**), and adjustable request delay to optimize scanning and avoid rate limiting.*                          |
| **Report Generation**               | *Generates detailed **HTML or PDF reports** with host details and geographical mapping (via Folium) for visual representation of discovered assets.*                                                         |
| **Real-time Logging & Notifications**| *Displays colored log messages with timestamps for progress updates, errors, and successes to facilitate effective monitoring of the scanning process.*                                                 |


## Installation of Rezon [Linux-Based]

```bash
# Update package list and install Python and pip
sudo apt update -y && sudo apt install python3 python3-pip -y

# Clone the repository
git clone https://github.com/iamunixtz/Rezon.git
cd Rezon

# Install required dependencies
pip3 install -r requirements.txt

# Run the tool
python3 rezon.py
```

## Installation of Rezon [Windows-Based]

```powershell
# Update package list and install Python dependencies (if not installed)
winget install Python.Python.3.9

# Clone the repository
git clone https://github.com/iamunixtz/Rezon.git
cd Rezon

# Install required Python dependencies
pip install -r requirements.txt

# Run the tool
python rezon.py
```


## 📝 Word From Me  

**I'm not a professional developer, programmer, or elite bug hunter. I built this tool to assist me in my day-to-day infosec activities, making recon easier and more structured. I’m not claiming this tool will revolutionize recon for others, but it simplifies the process and helps me focus on what truly matters.**  

**This journey never truly ends—until it does. In Allah, I trust, and I keep pushing forward. AI has become my best friend along the way.** 
