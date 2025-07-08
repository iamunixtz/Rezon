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


## 🎯 Overview

BantuHunters is a comprehensive, automated bug hunting and vulnerability assessment platform that integrates multiple security testing tools into a unified, web-based interface. Built for security researchers, penetration testers, and bug bounty hunters, it provides real-time scanning capabilities with intelligent analysis and reporting.


## 🏗️ Architecture

```mermaid
graph TB
    A[Web Interface] --> B[FastAPI Backend]
    B --> C[Scan Engine]
    C --> D[SQLMap Scanner]
    C --> E[Subdominator Scanner]
    C --> F[Nmap Scanner]
    C --> G[Nuclei Scanner]
    C --> H[Waybackurls Scanner]
    B --> I[PostgreSQL Database]
    B --> J[Redis Cache]
    B --> K[WebSocket Manager]
    K --> A
    
    style A fill:#e1f5fe
    style B fill:#f3e5f5
    style C fill:#fff3e0
    style I fill:#e8f5e8
    style J fill:#ffebee


