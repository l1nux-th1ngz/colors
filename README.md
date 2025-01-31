# This is my Hyprland config 
**Note:** This configuration is a work in progress, and I will continue to add more features as time permits.

**ملاحظة:** هذه الإعدادات لا تزال في مرحلة التطوير، وسأقوم بإضافة المزيد من الميزات بصورة مستمرة عندما يتاح لدي وقت أكثر.

### Required dependencies - برامج ضرورية
- [Hyprland](https://wiki.hyprland.org/Getting-Started/Installation/)
- [AGS](https://github.com/Aylur/ags/wiki/installation)
- Wofi
- network-manager-applet
- playerctl
- polkit-kde-agent
- ttf-font-awesome-5
- qt5ct
- Dolphin
- brightnessctl
- gammastep
- wl-clipboard
- hyprpicker
- sysstat
- bc
- kitty
- sassc
- systemsettings
- ttf-font-awesome-5
- acpi
- fish

### Optional dependencies - برامج اختيارية
- strawberry
- easyeffects
- nwg-look
- blueman
- telegram-desktop
- discord
- qt5-gsettings
- kvantum
- lightly-qt
- konsole
- vs code
- firefox

## Installing - التثبيت

### For Arch Users - لمستخدمي Arch:
```bash
yay -S base-devel strawberry brightnessctl network-manager-applet telegram-desktop wofi qt5-gsettings konsole blueman ark dolphin ffmpegthumbs playerctl lightly-qt kvantum polkit-kde-agent ttf-font-awesome-5 jq gufw qt5ct tar gammastep wl-clipboard nwg-look-bin visual-studio-code-bin firefox easyeffects hyprpicker discord hyprshot-git bc sysstat kitty sassc systemsettings ttf-font-awesome-5 orchis-theme-git acpi fish
```


### Setting up files - اعداد الملفات:

	git clone git@github.com:AhmedSaadi0/my-hyprland-config.git

	# backup your files
	mv ~/.config/hypr/ ~/.config/hypr-old
	mv ~/.config/ags/ ~/.config/ags-old
	mv ~/.config/wofi/ ~/.config/wofi-old
	cp ~/.config/fish/config.fish ~/.config/fish/config.back.fish

	# copy files
	cp -r my-hyprland-config ~/.config/hypr
	cp -r ~/.config/hypr/configs/ags ~/.config/ags
	cp -r ~/.config/hypr/configs/wofi ~/.config/wofi
	cp ~/.config/hypr/configs/config.fish ~/.config/fish/config.fish

	# set permissions for scripts
	sudo chmod +x ~/.config/hypr/scripts/*
	sudo chmod +x ~/.config/ags/scripts/*

	# setup environment
	sudo cp /etc/environment /etc/environmentOLD
	echo 'QT_QPA_PLATFORMTHEME=qt5ct' | sudo tee -a /etc/environment

	# copy theme files
	mkdir ~/.local/share/color-schemes/
	cp ~/.config/ags/modules/theme/plasma-colors/* ~/.local/share/color-schemes/
	cp ~/.config/hypr/configs/qt5ct.conf ~/.config/qt5ct/

	mkdir ~/.fonts
	cp -r ~/.config/hypr/configs/.fonts/* ~/.fonts

	mkdir ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/BeautySolar.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/Delight-brown-dark.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/Gradient-Dark-Icons.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/Infinity-Dark-Icons.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/kora-grey-light-panel.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/Magma.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/NeonIcons.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/la-capitaine-icon-theme.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/oomox-aesthetic-dark.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/Vivid-Dark-Icons.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/Windows11-red-dark.tar.gz -C ~/.local/share/icons
	tar xvf ~/.config/hypr/configs/icons/Zafiro-Nord-Dark-Black.tar.gz -C ~/.local/share/icons

	mkdir ~/.themes
	tar xvf ~/.config/hypr/configs/gtk-themes/Cabinet-Light-Orange.tar.gz -C ~/.themes
	tar xvf ~/.config/hypr/configs/gtk-themes/Kimi-dark.tar.gz -C ~/.themes
	tar xvf ~/.config/hypr/configs/gtk-themes/Nordic-darker-standard-buttons.tar.gz -C ~/.themes
	tar xvf ~/.config/hypr/configs/gtk-themes/Orchis-Green-Dark-Compact.tar.gz -C ~/.themes
	tar xvf ~/.config/hypr/configs/gtk-themes/Shades-of-purple.tar.xz -C ~/.themes
	tar xvf ~/.config/hypr/configs/gtk-themes/Tokyonight-Dark-BL.tar.gz -C ~/.themes


### You can change system fonts if you want to 'JF Flat' to have the same font I had
### بامكانك تغير خط الجهاز الى 'JF Flat' اذا اردت ان تحصل على نفس الخط الذي لدي


### Creating crontab for battery 40-80 rule - انشاء كرون تاب لتحسين استخدام البطارية باستخدام قاعدة الشحن 40-80 
    VISUAL=/usr/bin/nano crontab -e
    * * * * * ~/.config/hypr/scripts/battery.sh

# Screenshots - لقطات
<p align='center'>
	<img alt='screenshot 1' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/1.png'/>
</p>
<p align='center'>
	<img alt='screenshot 10' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/10.png'/>
</p>
<p align='center'>
	<img alt='screenshot 2' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/2.png'/>
</p>
<p align='center'>
	<img alt='screenshot 3' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/3.png'/>
</p>
<p align='center'>
	<img alt='screenshot 4' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/4.png'/>
</p>
<p align='center'>
	<img alt='screenshot 5' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/5.png'/>
</p>
<p align='center'>
	<img alt='screenshot 6' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/6.png'/>
</p>
<p align='center'>
	<img alt='screenshot 11' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/11.png'/>
</p>
<p align='center'>
	<img alt='screenshot 7' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/7.png'/>
</p>
<p align='center'>
	<img alt='screenshot 8' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/8.png'/>
</p>
<p align='center'>
	<img alt='screenshot 9' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/9.png'/>
</p>
<p align='center'>
	<img alt='screenshot 12' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/12.png'/>
</p>
<p align='center'>
	<img alt='screenshot 13' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/13.png'/>
</p>
<p align='center'>
	<img alt='screenshot 14' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/14.png'/>
</p>
<p align='center'>
	<img alt='screenshot 15' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/15.png'/>
</p>
<p align='center'>
	<img alt='screenshot 16' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/16.png'/>
</p>
<p align='center'>
	<img alt='screenshot 17' src='https://github.com/AhmedSaadi0/my-hyprland-config/blob/main/screenshots/17.png'/>
</p>
