function fish_prompt
  set -l git_info
  set -l git_branch (git branch --show-current 2> /dev/null)

  if test -n "$git_branch"
    set -l git_status_color normal
    if test (git status --porcelain | grep -E '^(\w+)?[ADM]+' | wc -l) -gt 0
      set git_status_color yellow
    end
    set git_info (echo -sn \( (set_color $git_status_color; echo -n $git_branch; set_color normal) \))
  end

  set -l tf_workspace
  if test -f .terraform/environment && test (cat .terraform/environment) != "default";
    set tf_workspace (echo -sn \( (cat .terraform/environment) \))
  end

  echo -n (prompt_pwd) $git_info $tf_workspace (set_color brblack; echo -n "\$ "; set_color normal)
end
