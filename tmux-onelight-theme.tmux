#!/bin/bash
onelight_black="#e5e9f0"
onelight_blue="#61afef"
onelight_yellow="#e5c07b"
onelight_red="#e06c75"
onelight_white="#a1abc1"
onelight_green="#98c379"
onelight_visual_grey="#3e4452"
onelight_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$onelight_white"
set "message-bg" "$onelight_black"

set "message-command-fg" "$onelight_white"
set "message-command-bg" "$onelight_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$onelight_black"
setw "window-status-bg" "$onelight_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$onelight_black"
setw "window-status-activity-fg" "$onelight_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$onelight_white"
set "window-active-style" "fg=$onelight_comment_grey"

set "pane-border-fg" "$onelight_white"
set "pane-border-bg" "$onelight_black"
set "pane-active-border-fg" "$onelight_green"
set "pane-active-border-bg" "$onelight_black"

set "display-panes-active-colour" "$onelight_yellow"
set "display-panes-colour" "$onelight_blue"

set "status-bg" "$onelight_black"
set "status-fg" "$onelight_white"

set "@prefix_highlight_fg" "$onelight_black"
set "@prefix_highlight_bg" "$onelight_green"
set "@prefix_highlight_copy_mode_attr" "fg=$onelight_black,bg=$onelight_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@onelight_widgets")
time_format=$(get "@onelight_time_format" "%R")
date_format=$(get "@onelight_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$onelight_white,bg=$onelight_black,nounderscore,noitalics]${time_format}  ${date_format} ${status_widgets}#[fg=$onelight_white,bg=$onelight_black,bold]  #h "
set "status-left" "#[fg=$onelight_white,bg=$onelight_black,bold] #S #{prefix_highlight}"

set "window-status-format" " #I  #W "
set "window-status-current-format" " #I  #W "
