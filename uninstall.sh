#!/data/data/com.termux/files/usr/bin/bash
# Remove CYBER ARMY banner and prompt
rm -f ~/banner.sh ~/banner_img.ans
sed -i '/banner.sh/d' ~/.bashrc
sed -i '/# CYBER-PROMPT/,/^PROMPT_COMMAND=cyber_prompt/d' ~/.bashrc
echo "[+] Removed. Close Termux and open it again."
