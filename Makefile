DESTDIR=
PREFIX=/usr
SYSCONFDIR=/etc

SYSTEMCTL:=$(shell which systemctl)

install:
	if test -x "$(SYSTEMCTL)" && test -d "$(DESTDIR)$(SYSCONFDIR)/systemd/system"; then install -m0644 detect_noise.service $(DESTDIR)$(SYSCONFDIR)/systemd/system/detect_noise.service && $(SYSTEMCTL) daemon-reload; else echo "could not find systemd"; fi
	if test -e "$(DESTDIR)$(SYSCONFDIR)/systemd/system/detect_noise.service" && test ! -e "$(DESTDIR)$(SYSCONFDIR)/systemd/system/multi-user.target.wants/detect_noise.service"; then $(SYSTEMCTL) enable detect_noise.service && $(SYSTEMCTL) start detect_noise.service; else echo "detect noise daemon is already enabled"; fi
	if test -x "$(SYSTEMCTL)" && test -d "$(DESTDIR)$(SYSCONFDIR)/systemd/system"; then install -m0644 detect_noise_api.service $(DESTDIR)$(SYSCONFDIR)/systemd/system/detect_noise_api.service && $(SYSTEMCTL) daemon-reload; else echo "could not find systemd"; fi
	if test -e "$(DESTDIR)$(SYSCONFDIR)/systemd/system/detect_noise_api.service" && test ! -e "$(DESTDIR)$(SYSCONFDIR)/systemd/system/multi-user.target.wants/detect_noise_api.service"; then $(SYSTEMCTL) enable detect_noise_api.service && $(SYSTEMCTL) start detect_noise_api.service; else echo "detect noise api daemon is already enabled"; fi
