#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 22147072 a9ad6d4ab622e1db9e7092843b0851f92260f54f 17909760 bed3abd8f743712c81489d7351114b5598de4d2a
fi
if ! applypatch -c EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY:22147072:a9ad6d4ab622e1db9e7092843b0851f92260f54f; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/13540000.dwmmc0/by-name/BOOT:17909760:bed3abd8f743712c81489d7351114b5598de4d2a EMMC:/dev/block/platform/13540000.dwmmc0/by-name/RECOVERY a9ad6d4ab622e1db9e7092843b0851f92260f54f 22147072 bed3abd8f743712c81489d7351114b5598de4d2a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
