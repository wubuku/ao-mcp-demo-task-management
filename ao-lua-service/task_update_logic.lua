--- Implements the Task.Update method.
--
-- @module task_update_logic

local task = require("task")

local task_update_logic = {}


--- Verifies the Task.Update command.
-- @param _state table The current state of the Task
-- @param title string 
-- @param description string 
-- @param priority string 
-- @param assignee string 
-- @param due_date number 
-- @param status string 
-- @param tags table 
-- @param cmd table The command
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env table The environment context
-- @return table The event, can use `task.new_task_updated` to create it
function task_update_logic.verify(_state, title, description, priority, assignee, due_date, status, tags, cmd, msg, env)
    return task.new_task_updated(_state, title, description, priority, assignee, due_date, status, tags)
end

--- Applies the event to the current state and returns the updated state.
-- @param state table The current state of the Task
-- @param event table The event
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env any The environment context
-- @return table The updated state of the Task
function task_update_logic.mutate(state, event, msg, env)
    state.title = event.title
    state.description = event.description
    state.priority = event.priority
    state.assignee = event.assignee
    state.due_date = event.due_date
    state.status = event.status
    state.tags = event.tags
    return state
end

return task_update_logic
