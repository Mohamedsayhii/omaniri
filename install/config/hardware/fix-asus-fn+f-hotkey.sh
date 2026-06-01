# Remap Fn+F (XF86Fn_F, scancode 0x9d) to F13 on ASUS machines that use asus-nb-wmi.

# In Windows this key cycles fan profiles (Silent/Balanced/Turbo), but Linux assigns
# it no keysym, making it invisible to Wayland compositors like Niri. This hwdb rule
# reassigns it to F13 at the kernel input layer before any compositor sees the event.
  
if omaniri-hw-match "asus"; then
  sudo tee /etc/udev/hwdb.d/90-asus-fn-key.hwdb > /dev/null << 'EOF'
evdev:name:Asus WMI hotkeys:*
 KEYBOARD_KEY_9d=f13
EOF
  sudo systemd-hwdb update
  sudo udevadm trigger
  echo "Asus WMI hotkey (0x9d → F13) mapped"
fi