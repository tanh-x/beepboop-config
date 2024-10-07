function winrb
    set w_entry (sudo grep -i windows /boot/grub/grub.cfg | cut -d "'" -f 2)
    sudo grub-reboot "$w_entry" && sudo reboot
end