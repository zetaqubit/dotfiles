#!/usr/bin/python2.7
# Swaps the workspaces active on the 2 monitors.
# Needs i3-py. Install with 'pip install i3-py'

import i3
import sys

switch = len(sys.argv) > 1 and sys.argv[1] == 'switch'

# Remember the currently focused window.
focused_window = i3.filter(nodes=[], focused=True)[0]

# Retrieve workspaces on both monitors.
outputs = filter(lambda output: output['active'], i3.get_outputs())
outputs = [o for o in outputs]

if switch:
  for output in outputs:
    i3.workspace(output['current_workspace'])
    i3.command('move', 'workspace to output right')

  # Restore focused window.
  i3.focus(con_id=focused_window['id'])
else:
  # Just swap focus, not the workspaces.
  workspaces = i3.get_workspaces()
  for workspace in workspaces:
    for output in outputs:
      if workspace['name'] == output['current_workspace'] and not workspace['focused']:
        i3.workspace(workspace['name'])
        break
