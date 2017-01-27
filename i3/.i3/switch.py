#!/usr/bin/python2.7

import i3

# Retrieve workspaces on both monitors.
outputs = filter(lambda output: output['active'], i3.get_outputs())
outputs = [o for o in outputs]

# Set current workspace to output 0 and move it to right, with wrapping.
i3.workspace(outputs[0]['current_workspace'])
i3.command('move', 'workspace to output right')

# Set current workspace to output 1 and move it to right, with wrapping.
i3.workspace(outputs[1]['current_workspace'])
i3.command('move', 'workspace to output right')
