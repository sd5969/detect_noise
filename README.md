Simple script for detecting noise level. Uses `sox` with USB microphone set to `card 1, device 0`. Needs `node` and `http-server` library.

# Installation

Run `make install` after all dependencies are installed. This creates two services, `detect_noise` and `detect_noise_api`. Control with `systemd`. 
