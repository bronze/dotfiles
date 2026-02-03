#!/usr/bin/env bash

# StatusLine script for Claude Code
# Mirrors oh-my-posh aesthetic from Fish shell config

# Read JSON input from stdin
input=$(cat)

# Extract values from JSON
user=$(whoami)
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
folder=$(basename "$cwd")
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
context_remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Get git info (skip locks for safety)
git_info=""
if git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git -C "$cwd" -c core.fileMode=false --no-optional-locks branch --show-current 2>/dev/null || echo "detached")

    # Check for changes (working tree)
    if ! git -C "$cwd" -c core.fileMode=false --no-optional-locks diff --quiet 2>/dev/null; then
        working_changed="*"
    else
        working_changed=""
    fi

    # Check for staged changes
    if ! git -C "$cwd" -c core.fileMode=false --no-optional-locks diff --cached --quiet 2>/dev/null; then
        staging_changed="+"
    else
        staging_changed=""
    fi

    git_status="${working_changed}${staging_changed}"
    git_info=" $(printf '\033[2m')│$(printf '\033[0m') $(printf '\033[36m')${branch}${git_status}$(printf '\033[0m')"
fi

# Build context indicator
context_info=""
if [ -n "$context_remaining" ]; then
    context_pct=$(printf "%.0f" "$context_remaining")
    if [ "$context_pct" -lt 20 ]; then
        context_color="\033[31m"  # Red for low
    elif [ "$context_pct" -lt 50 ]; then
        context_color="\033[33m"  # Yellow for medium
    else
        context_color="\033[32m"  # Green for good
    fi
    context_info=" $(printf '\033[2m')│$(printf '\033[0m') ${context_color}${context_pct}%$(printf '\033[0m')"
fi

# Output the status line with Nord-inspired colors
printf "$(printf '\033[2m')%s$(printf '\033[0m') $(printf '\033[2m')│$(printf '\033[0m') $(printf '\033[34m')%s$(printf '\033[0m')%s%s\n" \
    "$user" \
    "$folder" \
    "$git_info" \
    "$context_info"
