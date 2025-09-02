#!/bin/bash
# Capture install & systemd service setup script

# 1. Create folder, download, extract, install binary
echo "==> Creating capture directory at ~/capture..."
mkdir -p ~/capture
cd ~/capture

echo "==> Downloading Capture."
wget -q --show-progress https://github.com/bluewave-labs/capture/releases/download/v1.3.0/capture_1.3.0_linux_amd64.tar.gz

echo "==> Extracting Capture..."
tar -xzf capture_1.3.0_linux_amd64.tar.gz

echo "==> Installing Capture to /usr/local/bin/..."
sudo cp capture /usr/local/bin/
sudo chmod +x /usr/local/bin/capture

echo "==> Verify installation:"
capture --version

# 2. Create systemd service
echo "==> Creating systemd service for Capture..."
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
echo "==> Enabling and starting Capture service..."
sudo systemctl daemon-reload
sudo systemctl enable capture
sudo systemctl start capture

echo "==> Service status:"
sudo systemctl status capture
