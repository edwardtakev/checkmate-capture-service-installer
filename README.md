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

1. Clone this repository:

```bash
git clone https://github.com/edwardtakev/checkmate-capture-service-installer
cd https://github.com/edwardtakev/checkmate-capture-service-installer
```

2. Make the script executable and run it:

```bash
chmod +x install_capture.sh
./install_capture.sh
```

> **Note:** Replace `### CHANGE ME !!` in the systemd service file with your actual `API_SECRET` from Checkmate.

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
