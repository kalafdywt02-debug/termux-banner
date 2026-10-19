
#!/data/data/com.termux/files/usr/bin/bash
# Termux Custom Banner + Rainbow Prompt Setup
# ----------------------------------------------
# نصب: این اسکریپت رو دانلود کن و با bash اجرا کن
# برای شخصی‌سازی: فقط کلمه CYBRY.ARMY رو با اسم دلخواهت جایگزین کن

# نصب پکیج‌های مورد نیاز
pkg update -y
pkg install ruby figlet -y
command -v lolcat >/dev/null || gem install lolcat

# دانلود/استخراج عکس ASCII (لوگو)
echo 'H4sIAAAAAAACA9XQQQqAIBCF4b2neFDQBTqAK3eBBwi0lWdw886eiVkRDbPtXwnzwchYqynBWGV/gyRnDRxR8p6eEKF3B2QEYgj5yKbSC6K1AVlcfUIMkP7oiKtZgB2tSCFrIEb5PN1tH86Z2w1Lz+nCWp2YWN9Tg7yFRwbK9HAHw2mOgQsDAAA=' | base64 -d | gunzip > ~/banner_img.ans

# ساخت فایل بنر خوش‌آمدگویی
cat > ~/banner.sh << 'EOT'
clear
cat ~/banner_img.ans | lolcat
figlet -f standard "CYBRY ARMY" | lolcat
echo "-----------------------------------------" | lolcat
echo "        Welcome back, CYBRY ARMY" | lolcat
echo "-----------------------------------------" | lolcat
EOT

# پاک‌سازی تنظیمات قبلی (جلوگیری از تکرار در صورت اجرای دوباره)
grep -v -E "banner.sh|colors=|color_index|PROMPT_COMMAND" ~/.bashrc 2>/dev/null > ~/.bashrc.tmp
mv ~/.bashrc.tmp ~/.bashrc

# اضافه کردن بنر و پرامپت رنگین‌کمانی چرخشی به .bashrc
cat >> ~/.bashrc << 'EOF'
bash ~/banner.sh

colors=($(seq 21 1 120))
color_index=0
PROMPT_COMMAND='c=${colors[$color_index]}; color_index=$(( (color_index + 1) % ${#colors[@]} )); PS1="⚡ \[\e[1;38;5;${c}m\]CYBRY.ARMY\[\e[0m\] ⚡ :-\$ "'
EOF

source ~/.bashrc
echo "✅ نصب کامل شد! برای دیدن تغییرات، Termux رو کامل ببند و دوباره باز کن."
