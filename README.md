# Capture Agent Installation

This repository provides a script to install and configure the **Capture agent** (Bluewave-Labs) on Linux systems with **systemd** support. The agent monitors system metrics and integrates with the Checkmate backend.

---

## Features

* Downloads the latest Capture binary
* Installs binary to `/usr/local/bin/`
* Creates a systemd service for automatic startup
* Runs the agent in **release mode**

---

## Prerequisites

* Linux system (tested on Debian)
* `wget`, `tar`, and `sudo` installed
* Access to Checkmate backend

---

## Installation

### 1. Clone this repository

```bash
git clone https://github.com/edwardtakev/checkmate-capture-service-installer.git
cd checkmate-capture-service-installer
```

> **⚠ Note:** Before running the script, open the systemd service file and replace `### CHANGE ME !!` with your actual `API_SECRET` from Checkmate.

---

### 2. Run the installation script

```bash
./install_capture.sh
```

> **⚠ Note:** If you didn’t replace `### CHANGE ME !!` before running the script, you can update it afterwards:

```bash
sudo nano /etc/systemd/system/capture.service
sudo systemctl daemon-reload
sudo systemctl restart capture.service
```
---

## Manual Run

To run the agent manually (debug mode):

```bash
API_SECRET=<your_api_secret> capture
```

---

## Systemd Service

The script creates a systemd service `capture.service`:


## License

This script is provided as-is. See the [Bluewave-Labs Capture repository](https://github.com/bluewave-labs/capture) for the agent’s license and documentation.

---

## Notes

* Make sure the API secret matches your Checkmate backend.
* The agent runs in **release mode** by default for cleaner logs.
