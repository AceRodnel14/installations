# Download dependencies and perform update
sudo apt-get update && sudo apt-get -y upgrade && apt-get -y install curl wget unzip

# Download and install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb

# Download Chromedriver based on Google Chrome version
CHROME_VERSION=$(curl "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$(awk -F'[ .]' '{print $3"."$4"."$5}' <<< $(google-chrome --version))")

wget "https://chromedriver.storage.googleapis.com/${CHROME_VERSION}/chromedriver_linux64.zip"

sudo unzip -o chromedriver_linux64.zip -d /usr/bin

# Cleanup
rm ./chromedriver*.zip