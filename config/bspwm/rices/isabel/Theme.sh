#!/usr/bin/env bash
#  ██╗███████╗ █████╗ ██████╗ ███████╗██╗         ██████╗ ██╗ ██████╗███████╗
#  ██║██╔════╝██╔══██╗██╔══██╗██╔════╝██║         ██╔══██╗██║██╔════╝██╔════╝
#  ██║███████╗███████║██████╔╝█████╗  ██║         ██████╔╝██║██║     █████╗
#  ██║╚════██║██╔══██║██╔══██╗██╔══╝  ██║         ██╔══██╗██║██║     ██╔══╝
#  ██║███████║██║  ██║██████╔╝███████╗███████╗    ██║  ██║██║╚██████╗███████╗
#  ╚═╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Isabel
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 2
	bspc config bottom_padding 42
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#b8bfe5"
	bspc config active_border_color "#b8bfe5"
	bspc config focused_border_color "#7560d3"
	bspc config presel_feedback_color "#81ae5f"
}

# Set alacritty colorscheme
set_alacritty_config() {
	cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# (Onedark) Color scheme for Isabel Rice

# Default colors
[colors.primary]
background = "#14171c"
foreground = "#abb2bf"

# Cursor colors
[colors.cursor]
cursor = "#abb2bf"
text = "#14171c"

# Normal colors
[colors.normal]
black = "#1e2127"
blue = "#4889be"
cyan = "#49919a"
green = "#81ae5f"
magenta = "#7560d3"
red = "#be5046"
white = "#abb2bf"
yellow = "#d19a66"

# Bright colors
[colors.bright]
black = "#5c6370"
blue = "#61afef"
cyan = "#56b6c2"
green = "#98c379"
magenta = "#8677cf"
red = "#e06c75"
white = "#ffffff"
yellow = "#e5c07b"
EOF
}

# Set kitty colorscheme
set_kitty_config() {
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
## This file is autogenerated, do not edit it, instead edit the Theme.sh file inside the rice directory.
## Onedark Color scheme for Isabel Rice


# The basic colors
foreground              #abb2bf
background              #14171c
selection_foreground    #24273A
selection_background    #F4DBD6

# Cursor colors
cursor                  #abb2bf
cursor_text_color       #14171c

# URL underline color when hovering with mouse
url_color               #61afef

# Kitty window border colors
active_border_color     #8677cf
inactive_border_color   #5c6370
bell_border_color       #e5c07b

# Tab bar colors
active_tab_foreground   #14171c
active_tab_background   #8677cf
inactive_tab_foreground #abb2bf
inactive_tab_background #1e2127
tab_bar_background      #14171c

# The 16 terminal colors

# black
color0 #1e2127
color8 #5c6370

# red
color1 #be5046
color9 #e06c75

# green
color2  #81ae5f
color10 #98c379

# yellow
color3  #d19a66
color11 #e5c07b

# blue
color4  #4889be
color12 #61afef

# magenta
color5  #7560d3
color13 #8677cf

# cyan
color6  #49919a
color14 #56b6c2

# white
color7  #abb2bf
color15 #ffffff
EOF

killall -USR1 kitty
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'kitty'\"/\"100:class_g = 'kitty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#14171c\"/g" \
		-e "s/separator_color = .*/separator_color = \"#abb2bf\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#7560d3'/g"

	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "#14171c"
		foreground = "#b8bfe5"

		[urgency_normal]
		timeout = 6
		background = "#14171c"
		foreground = "#b8bfe5"

		[urgency_critical]
		timeout = 0
		background = "#14171c"
		foreground = "#b8bfe5"
	_EOF_
}

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
// Eww colors for Isabel rice
\$bg: #14171c;
\$bg-alt: #181b21;
\$fg: #b8bfe5;
\$black: #5c6370;
\$lightblack: #262831;
\$red: #be5046;
\$blue: #4889be;
\$cyan: #49919a;
\$magenta: #7560d3;
\$green: #81ae5f;
\$yellow: #d19a66;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Isabel
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #14171c/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #b8bfe5/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #181b21/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #b8bfe5/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #5c6370/'
}

# Set rofi colors
set_launcher_config() {
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Isabel

* {
    font: "Terminess Nerd Font Mono Bold 10";
    background: #14171c;
    background-alt: #14171cE0;
    foreground: #b8bfe5;
    selected: #8677cf;
    active: #81ae5f;
    urgent: #e06c75;
    
    img-background: url("~/.config/bspwm/rices/isabel/rofi.webp", width);
}
EOF
}

# Launch the bar
launch_bars() {

	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q isa-bar -c "${rice_dir}"/config.ini &
	done

}

### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_alacritty_config
set_kitty_config
set_picom_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
