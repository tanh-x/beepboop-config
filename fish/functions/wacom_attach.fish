function wacom_attach
    if test (count $argv) -ne 1
        echo "Usage: wacom_attach <display>"
        return 1
    end

    set display $argv[1]

    xinput | grep -i "Wacom" | grep "slave  pointer" | grep -o "id=[0-9]*" | cut -d= -f2 | while read id
        xinput map-to-output $id $display
    end
end
