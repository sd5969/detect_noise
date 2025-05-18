Simple script for detecting noise level. Uses `sox` with USB microphone set to `card 1, device 0`. Needs `alsa-utils`, `node` and `http-server` npm library.

# Installation

1. Clone repository to `/home/pi/scripts/detect_noise`
1. Install dependencies
2. Update permissions `chmod u+x detect_noise_level.sh`
2. _(if you did not use the folder listed in #1)_ Review file paths in `.service` files and `.sh` files
2. Test which interface the appropriate microphone is enabled on (using `arecord` command in the `.sh` file)
3. Run `make install` after all dependencies are installed

This creates two services, `detect_noise` and `detect_noise_api`. Control with `systemd`.

# Home Assistant Sensor

Add this to your `configuration.yaml`:

```
sensor:
  - platform: scrape
    resource: http://10.0.0.161:1111/noise.html
    select: "span"
    name: "AC Noise"
  - platform: template
    sensors:
      ac_noise_bool:
        name: "AC Noise (Boolean)"
        value_template: "{{ states('sensor.ac_noise') | float > 1.5 }}"

```

Replace `10.0.0.161` with the IP/hostname for where you have the detect_noise scripts running. Must be on the same network.
