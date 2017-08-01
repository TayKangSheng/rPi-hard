# Raspberry Pi Hardening

### 1. Fix Pi Backdoor

`sudo cat /etc/sudoers.d/010_pi-nopasswd`  

Remove NOPASSWD  
`pi ALL=(ALL) ALL`

### 2. Edit Sudoers Configuration

`sudo visudo`  

Under Defaults, remove grace period for cached sudo password by adding the following:  

`Defaults     timestamp_timeout=0`

### 3. Disable root login

`sudo nano /etc/ssh/sshd_config`

Remove root login permit by changing the following:  
`PermitRootLogin no`

### 4. Change pi password

`sudo passwd pi`


# Dashy Chromium Setup

### 1. Install Chromium, X11 and Unclutter

`sudo apt-get install chromium-browser x11-xserver-utils unclutter`

### 2. Prevent RPI from sleeping

`sudo nano /etc/lightdm/lightdm.conf`

Search for `[SeatDefault]` and add under it:

`xserver-command=X -s 0 dpms`

### 3. Chromium Browser settings

`sudo nano ~/.config/lxsession/LXDE-pi/autostart`

add the following lines:

`/usr/bin/chromium-browser --test-type  --no-default-browser-check --no-first-run --disable-session-crashed-bubble --ignore-certificate-errors --disable-infobars --start-fullscreen <URL>`

`/usr/bin/unclutter -idle 0.1 -root`

### 4. Fix Timezone

```bash
$ rm /etc/localtime  
$ cd /etc  
$ ln -s /usr/share/zoneinfo/Asia/Singapore localtime
```
