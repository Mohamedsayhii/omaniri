# Configure ZRAM swap to use half of physical RAM with zstd compression.
# Overrides CachyOS default (/usr/lib/systemd/zram-generator.conf) which uses ram * 1.

sudo tee /etc/systemd/zram-generator.conf > /dev/null <<EOF
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
swap-priority = 100
fs-type = swap
EOF