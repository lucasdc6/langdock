function __fish_langdock_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'langdock' ]
    return 0
  end
  return 1
end

function __fish_langdock_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c langdock -n '__fish_langdock_needs_command' -a '(langdock commands)'
for cmd in (langdock commands)
  complete -f -c langdock -n "__fish_langdock_using_command $cmd" -a \
    "(langdock completions (commandline -opc)[2..-1])"
end
