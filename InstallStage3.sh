echo ' * Unpacking stage3...'
file stage3-arm64*.tar.xz || { echo '/!\ stage3 is not found. Please, download it.'; exit 1; }
tar xpf stage3-arm64*.tar.xz --numeric-owner --xattrs-include='*.*' -C $DEST || { echo '/!\ Failed to unpack stage3.'; exit 1; }
