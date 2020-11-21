function fish_right_prompt
  set -l original_status $status
  set -l return_code
  set -l status_color green

  if test $original_status -ne 0
    set status_color red
    set signal_value (math $original_status - 128)
    if test $original_status -gt 128 && kill -l $signal_value 2>/dev/null >&2
      set return_code SIG(kill -l $signal_value)
    else
      set return_code $original_status
    end
  end

  set -l hours (math --scale=0 "$CMD_DURATION / 3600000")
  set -l minutes (math --scale=0 "( $CMD_DURATION - $hours * 3600000 ) / 60000")
  set -l seconds (math "( $CMD_DURATION - $hours - $minutes * 60000 ) / 1000")

  set -l cmd_time (
  echo -n [(
  set_color $status_color;
  echo -n (printf %02d $hours):(printf %02d $minutes):(printf %06.3f $seconds);
  set_color normal)])

  set -l cmd_return
  if test $return_code
    set cmd_return [(set_color $status_color; echo -n $return_code; set_color normal)]
  end

  echo -sn $cmd_return $cmd_time
end
