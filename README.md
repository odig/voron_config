# voron_config
For now this is a technology study.
Use it at your own risk.

Clone the repo in your klipper_config as config_voron.

Copy the template as a sample config and adjust it to your needs.

cd ~/klipper_config
git clone https://github.com/odig/voron_config.git config_voron
cp config_voron/templates/voron-2-4-printer.template.cfg printer.cfg

# moonraker.cfg
[update_manager client VoronConfig]
type: git_repo
path: /home/pi/klipper_config/config_voron
origin: git@github.com:odig/voron_config.git
primary_branch: main

[update_manager timelapse]
type: git_repo
path: ~/moonraker-timelapse
origin: https://github.com/mainsail-crew/moonraker-timelapse.git
primary_branch: main
