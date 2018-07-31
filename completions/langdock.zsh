if [[ ! -o interactive ]]; then
    return
fi

compctl -K _langdock langdock

_langdock() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(langdock commands)"
  else
    completions="$(langdock completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}
