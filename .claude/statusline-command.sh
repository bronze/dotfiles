#!/usr/bin/env bash

# StatusLine script for Claude Code
# Mirrors oh-my-posh aesthetic from Fish shell config

# Read JSON input from stdin
input=$(cat)

# Extract values from JSON (use full path to avoid Volta's broken jq)
user=$(whoami)
cwd=$(echo "$input" | /usr/bin/jq -r '.workspace.current_dir')
folder=$(basename "$cwd")
model=$(echo "$input" | /usr/bin/jq -r '.model.display_name // "Claude"')
context_remaining=$(echo "$input" | /usr/bin/jq -r '.context_window.remaining_percentage // empty')
cost=$(echo "$input" | /usr/bin/jq -r '.cost.total_cost_usd // 0')
input_tokens=$(echo "$input" | /usr/bin/jq -r '.context_window.current_usage.input_tokens // 0')

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

# Build context indicator with progress bar
context_info=""
if [ -n "$context_remaining" ]; then
    context_pct=$(printf "%.0f" "$context_remaining")
    used_pct=$((100 - context_pct))
    if [ "$context_pct" -lt 20 ]; then
        context_color=$(printf '\033[31m')  # Red for low
    elif [ "$context_pct" -lt 50 ]; then
        context_color=$(printf '\033[33m')  # Yellow for medium
    else
        context_color=$(printf '\033[32m')  # Green for good
    fi
    BAR_WIDTH=10
    FILLED=$((used_pct * BAR_WIDTH / 100))
    EMPTY=$((BAR_WIDTH - FILLED))
    BAR=""
    [ "$FILLED" -gt 0 ] && BAR=$(printf "%${FILLED}s" | tr ' ' '█')
    [ "$EMPTY" -gt 0 ] && BAR="${BAR}$(printf "%${EMPTY}s" | tr ' ' '░')"
    context_info=" $(printf '\033[2m')│$(printf '\033[0m') ${context_color}${BAR} ${used_pct}%$(printf '\033[0m')"
fi

# Build usage indicator (cost + tokens)
usage_info=""
if [ -n "$cost" ] && [ "$cost" != "0" ]; then
    # Format tokens as "Xk" if over 1000
    if [ "$input_tokens" -gt 1000 ] 2>/dev/null; then
        tokens_k=$(echo "scale=0; $input_tokens / 1000" | bc)
        tokens_display="${tokens_k}k"
    else
        tokens_display="$input_tokens"
    fi
    usage_info=" $(printf '\033[2m')│$(printf '\033[0m') $(printf '\033[35m')\$$(printf '%.2f' "$cost")$(printf '\033[0m') $(printf '\033[2m')${tokens_display}$(printf '\033[0m')"
fi

# Output the status line with Nord-inspired colors
printf "$(printf '\033[2m')%s$(printf '\033[0m') $(printf '\033[2m')│$(printf '\033[0m') $(printf '\033[34m')%s$(printf '\033[0m')%s%s%s\n" \
    "$user" \
    "$folder" \
    "$git_info" \
    "$context_info" \
    "$usage_info"
