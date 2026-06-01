echo "Disabling snap-pac hooks and adding to NoExtract..."
for hook in 05-snap-pac-pre.hook zz-snap-pac-post.hook; do
  if [[ -f /usr/share/libalpm/hooks/$hook ]]; then
    sudo mv /usr/share/libalpm/hooks/$hook /usr/share/libalpm/hooks/$hook.disabled
    echo "  Disabled: $hook"
  fi
done
PACMAN_CONF="/etc/pacman.conf"
if ! grep -q "05-snap-pac-pre.hook" "$PACMAN_CONF" 2>/dev/null; then
  sudo sed -i "s|^#NoExtract\s*=|NoExtract = usr/share/libalpm/hooks/05-snap-pac-pre.hook usr/share/libalpm/hooks/zz-snap-pac-post.hook|" "$PACMAN_CONF"
  echo "  Added NoExtract entries"
fi
echo "snap-pac hooks disabled"