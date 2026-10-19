command -v lolcat >/dev/null || gem install lolcat
echo 'H4sIAAAAAAACA9XQQQqAIBCF4b2neFDQBTqAK3eBBwi0lWdw886eiVkRDbPtXwnzwchYqynBWGV/gyRnDRxR8p6eEKF3B2QEYgj5yKbSC6K1AVlcfUIMkP7oiKtZgB2tSCFrIEb5PN1tH86Z2w1Lz+nCWp2YWN9Tg7yFRwbK9HAHw2mOgQsDAAA=' | base64 -d | gunzip > ~/banner_img.ans

cat > ~/banner.sh << 'EOT'
clear
cat ~/banner_img.ans | lolcat
figlet -f standard "CYBRY ARMY" | lolcat
echo "-----------------------------------------" | lolcat
echo "        Welcome back, CYBRY ARMY" | lolcat
echo "-----------------------------------------" | lolcat
EOT

grep -q 'banner.sh' ~/.bashrc || echo 'bash ~/banner.sh' >> ~/.bashrc

if ! grep -q 'CYBER-PROMPT' ~/.bashrc; then
cat >> ~/.bashrc << 'EOT'
# CYBER-PROMPT
colors=($(seq 21 1 120))
color_index=0
PROMPT_COMMAND='c=${colors[$color_index]}; color_index=$(( (color_index + 1) % ${#colors[@]} )); PS1="\[\e[1;38;5;${c}m\]CYBRY.ARMY \[\e[0m\]\$ "'
EOT
fi

source ~/.bashrc
