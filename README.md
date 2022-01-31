# Voron config for RatOS
For now this is a technology study.  
Use it at your own risk.

## Goals

This repository adds a directory config_voron to your klipper_config dir.  
It utilizes the RatOS Klipper config structure and features.  
It adds a Voron 2 config with Timelapse, Klicky and Stealthburner LED support to RatOS.  

The scripts in klicky subdir are the original Klicky scripts.  
I just added Stealthburner LED control.  
This will be changed if I find a better way to achive LED control with Klipper/Klicky. 

See also: 
     
    https://os.ratrig.com/  
    https://github.com/mainsail-crew/moonraker-timelapse.git  
    https://github.com/jlas1/Klicky-Probe.git  

## Prerequisites
You need to have RatOS installed

    https://os.ratrig.com/

## Installation
Clone this repo in your klipper_config as config_voron and run install.sh

    cd ~/klipper_config
    git clone https://github.com/odig/voron_config.git config_voron
    config_voron/scripts/install.sh

## Get initial config template
Copy the printer.cfg template as a sample config and adjust it to your needs.  
The following command will override you existing printer.cfg!

    config_voron/scripts/install-voron-2-4-config.sh