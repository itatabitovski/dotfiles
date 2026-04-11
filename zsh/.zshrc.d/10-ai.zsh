function claude-deepseek() {
  # Check if API key exists
  if [[ -z "${DEEPSEEK_API_KEY}" ]]; then
    echo "Error: DEEPSEEK_API_KEY is not set."
    return 1
  fi

  # Clear any existing Anthropic key
  unset ANTHROPIC_API_KEY

  export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
  export ANTHROPIC_AUTH_TOKEN="${DEEPSEEK_API_KEY}"
  export API_TIMEOUT_MS=600000
  export ANTHROPIC_MODEL="deepseek-chat"
  export ANTHROPIC_SMALL_FAST_MODEL="deepseek-chat"
  export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1

  # Run Claude Code
  claude "$@"
}
