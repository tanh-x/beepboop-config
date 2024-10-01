# powerline-daemon -q
# set POWERLINE_BASH_CONTINUATION 1
# set POWERLINE_BASH_SELECT 1
# 
# set fish_function_path $fish_function_path "/usr/lib/python3.9/site-packages/powerline/bindings/fish"
# source /usr/lib/python3.9/site-packages/powerline/bindings/fish/powerline-setup.fish
# powerline-setup

set terminal (basename "/"(ps -f -p (cat /proc/(echo %self)/stat | cut -d \  -f 4) | tail -1 | sed 's/^.* //'))

# set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH $CONDA_PREFIX/lib/
# set -x LD_LIBRARY_PATH /opt/cuda/targets/x86_64-linux/lib/ $LD_LIBRARY_PATH
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk/

if status is-interactive
    if [ "$terminal" = "yakuake" ]; or [ "$terminal" = "konsole" ]
      # fish_logo | awk '{print " " $0}'
      echo
      tail -n 5 ~/.wttr_output
    end
    
    echo
    
    alias nano="nano -ZDEFLSil"
    # alias nfzf="nano -ZDEFLSil%0T4 \$(fzf --preview='cat {} | head -n 32')"
    # alias nano="micro"
    alias wtrs="curl wttr.in/Ames\?mQ0 -s | tee '/home/kew/.wttr_output'"
    alias wtrg="curl wttr.in/Ames\?format=v2&m -s | head -n 19"
    alias wtrf="curl v2.wttr.in/Ames\?mF -s"

    alias p="pastel"
    alias _w="cd ~/things/_w"
    alias _s="cd ~/things/_s"

    alias tmsrv='/home/kew/.local/share/Steam/steamapps/common/tModLoader/start-tModLoaderServer.sh'
    alias imgd='bash ~/imgd.sh'
    alias cgrep="grep --color=always"
    alias q='qalc'
    alias jl='julia'
    alias ari="sudo rogauracore initialize_keyboard; sudo rogauracore brightness 1"
    alias aura="sudo rogauracore"
    alias aural="sudo rogauracore brightness"
    alias mipyt="code ~/things/miscs/math.ipynb"
    alias nvr="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only"

    alias cpups="sudo cpupower frequency-set --governor powersave"
    alias cpupf="sudo cpupower frequency-set --governor performance"

    alias krita="krita --nosplash"
    alias kra="krita --nosplash ~/Pictures/a/test.kra"
    alias gdkt="/home/kew/programs/godot-install/godot.x11.opt.tools.64"
    alias gdt="/home/kew/programs/godot-install/Godot_v3.5.2-stable_x11.64"

    alias gitg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
    alias gitc="git commit"
    alias gitst="git status"
    alias gitsh="git stash"
    alias gitp="git push"
    alias gitpu="git push -u origin"
    alias gitm="git merge"
    alias gitma="git merge origin/main"
    alias gita="git add"
    alias gitb="git branch"
    alias gito="git checkout"
    alias gitcb="git checkout -B"
    alias gitf="git fetch"
    alias gitk="git pull"
    alias gitr="git remote"
    alias gitl="git branch -lvva"

    function chct; echo $argv | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold; end;

    #alias ls="lsd -lAh"
    alias ls="exa -ulham --icons --git -s modified -F"
  
    alias condainit="eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source"

    alias fconf='nano ~/.config/fish/config.fish'
    alias rb='systemctl reboot'
    alias sd='shutdown -h now'
    alias logout='qdbus org.kde.ksmserver /KSMServer logout 0 3 3'
    alias x='exit'

    alias c='clear && source $HOME/.config/fish/config.fish'
    alias wmclass='xprop WM_CLASS'

    alias py='python'
    alias ipy='ipython'
    alias venv='source ./venv/bin/activate.fish && echo \'Activated Python virtual environment at venv/\''
    alias .venv='source ./.venv/bin/activate.fish && echo \'Activated Python virtual environment at .venv/\''
    alias pym="python -m"
    alias vserve='npm run serve -- --port 3000'

    alias wa='bash ~/wascript'

    alias nvcol='nvidia-settings -a "DigitalVibrance=1023" && nvidia-settings -a "Gamma=1.16"'
    alias nvcolr='nvidia-settings -a "DigitalVibrance=0" && nvidia-settings -a "Gamma=1"'

    alias yayy='yes "" | yay'
end

if type -q zoxide
    zoxide init --cmd cd fish | source
end