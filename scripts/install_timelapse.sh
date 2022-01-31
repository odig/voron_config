#!/bin/bash
# This script install timelapse
# for the voron config klipper setup.

set -e

########
# timelapse stuff
########
add_timelapse_to_moonraker_update_manager() {
    echo "Add timelapse to Moonraker update manager"
    cat << '#EOF' >> /home/pi/klipper_config/moonraker.conf

[update_manager timelapse]
type: git_repo
primary_branch: main
path: ~/moonraker-timelapse
origin: https://github.com/mainsail-crew/moonraker-timelapse.git
#EOF
}

enable_timelapse_in_moonraker() {
    echo "Enable timelapse in Moonraker"
    cat << '#EOF' >> /home/pi/klipper_config/moonraker.conf

# enables timelapse feature.
[timelapse]
#EOF
}

check_and_install_timelapse() {
    # check if timelapse ist installed and install if not
    if [ ! -d /home/pi/moonraker-timelapse ]; then
        git clone https://github.com/mainsail-crew/moonraker-timelapse.git /home/pi/moonraker-timelapse
        /home/pi/moonraker-timelapse/install.sh
    fi

    # add to moonraker.conf if needed
    if ! grep -q '\[update_manager timelapse\]' /home/pi/klipper_config/moonraker.conf; then
        add_timelapse_to_moonraker_update_manager
    fi

    if ! grep -q '\[timelapse\]' /home/pi/klipper_config/moonraker.conf; then
        enable_timelapse_in_moonraker
    fi
}


check_and_install_timelapse