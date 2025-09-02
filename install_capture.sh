#!/bin/bash
# Capture install & systemd service setup script with colors

# Color codes
BLUE="\033[1;34m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# 1. Create folder, download, extract, install binary
echo -e "${BLUE}==> Creating capture directory at ~/capture...${RESET}"
mkdir -p ~/capture
cd ~/capture

echo -e "${BLUE}==> Downloading Capture...${RESET}"
wget -q --show-progress https://github.com/bluewave-labs/capture/releases/download/v1.3.0/capture_1.3.0_linux_amd64.tar.gz

echo -e "${BLUE}==> Extracting Capture...${RESET}"
tar -xzf capture_1.3.0_linux_amd64.tar.gz

echo -e "${BLUE}==> Installing Capture to /usr/local/bin/...${RESET}"
sudo cp capture /usr/local/bin/
sudo chmod +x /usr/local/bin/capture

echo -e "${GREEN}==> Verify installation:${RESET}"
capture --version

# 2. Create systemd service
echo -e "${BLUE}==> Creating systemd service for Capture...${RESET}"
sudo tee /etc/systemd/system/capture.service > /dev/null <<EOF
[Unit]
Description=Capture Agent
After=network.target

[Service]
Type=simple
Environment=API_SECRET=### CHANGE ME !!
Environment=GIN_MODE=release
ExecStart=/usr/local/bin/capture
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# 3. Enable and start service
echo -e "${BLUE}==> Enabling and starting Capture service...${RESET}"
sudo systemctl daemon-reload
sudo systemctl enable capture
sudo systemctl start capture

echo -e "${GREEN}==> Service status:${RESET}"
sudo systemctl status capture
