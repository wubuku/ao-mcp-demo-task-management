--- Implements the Task.Create method.
--
-- @module task_create_logic

local task = require("task")

local task_create_logic = {}


--- Verifies the Task.Create command.
-- @param task_id table The TaskId of the Task
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
-- @return table The event, can use `task.new_task_created` to create it
function task_create_logic.verify(task_id, title, description, priority, assignee, due_date, status, tags, cmd, msg, env)
    local created_at = msg.Timestamp or os.time()
    local updated_at = created_at
    return task.new_task_created(task_id, title, description, priority, assignee, due_date, status, tags, created_at, updated_at)
end

--- Creates a new Task
-- @param event table The event
-- @param msg any The original message. Properties of an AO msg may include `Timestamp`, `Block-Height`, `Owner`, `Nonce`, etc.
-- @param env any The environment context
-- @return table The state of the Task
function task_create_logic.new(event, msg, env)
    return task.new(event.title, event.description, event.priority, event.assignee, event.due_date, event.status, event.tags)
end

return task_create_logic
