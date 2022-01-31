#!/bin/bash
# This script install voron stuff
# for the voron config klipper setup.

set -e

add_voron_config_to_moonraker_update_manager() {
    echo "Add Voron config to Moonraker update manager"
    cat << '#EOF' >> /home/pi/klipper_config/moonraker.conf

[update_manager client VoronConfig]
type: git_repo
path: /home/pi/klipper_config/config_voron
origin: git@github.com:odig/voron_config.git
primary_branch: main
install_script: /home/pi/klipper_config/config_voron/scripts/install.sh
#EOF
}

check_and_install_voron_config() {
    # check if timelapse ist installed and install if not
    if [ ! -d /home/pi/moonraker-timelapse ]; then
        git clone https://github.com/mainsail-crew/moonraker-timelapse.git /home/pi/moonraker-timelapse
        /home/pi/moonraker-timelapse/install.sh
    fi

    # add to moonraker.conf if needed
    if ! grep -q '\[update_manager client VoronConfig\]' /home/pi/klipper_config/moonraker.conf; then
        add_voron_config_to_moonraker_update_manager
    fi
}

check_and_install_voron_config
/home/pi/klipper_config/config_voron/scripts/install_timelapse.sh

